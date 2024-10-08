import 'dart:typed_data';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';
import 'package:super_drag_and_drop/super_drag_and_drop.dart';
import 'package:path/path.dart' as path;

import 'list_item_download.dart';

class UploadDialog extends StatefulWidget {
  final UploadConfig config;
  final List<String>? allowedExtensions;
  final Function(List<CustomFile> files) onUpload;

  const UploadDialog({
    super.key,
    required this.config,
    required this.onUpload,
    this.allowedExtensions,
  });

  @override
  State<UploadDialog> createState() => _UploadDialogState();
}

class _UploadDialogState extends State<UploadDialog> {
  final List<CustomFile> _files = [];
  bool _isDragging = false;

  static const double _minHeight = 250.0;
  static const double _maxHeight = 450.0;
  static const double _baseHeight = 250.0;
  static const double _fileItemHeight = 60.0;

  double _calculateDialogHeight() {
    final contentHeight = _baseHeight + (_files.length * _fileItemHeight);
    return contentHeight.clamp(_minHeight, _maxHeight);
  }

  Future<void> _selectFiles() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: true);
    if (result != null) {
      setState(() {
        for (final file in result.files) {
          if (file.bytes != null &&
              !_files.any((element) => element.name == file.name)) {
            _files.add(CustomFile(
              name: file.name,
              bytes: file.bytes!,
              size: file.size,
            ));
          }
        }
      });
    }
  }

  _removeFile(String fileName) {
    setState(() {
      _files.removeWhere((element) => element.name == fileName);
    });
  }

  Future<void> _handlePerformDrop(PerformDropEvent event) async {
    final items = event.session.items;
    for (final item in items) {
      final reader = item.dataReader;
      reader?.getFile(null, (file) {
        if (_files.any((element) => element.name == file.fileName)) {
          return;
        }

        final stream = file.getStream();
        final chunks = <Uint8List>[];
        stream.listen(
          (chunk) {
            chunks.add(chunk);
          },
          onDone: () {
            _addFileFromChunk(file.fileName ?? '', chunks);
          },
        );
      });
    }
  }

  void _addFileFromChunk(String fileName, List<Uint8List> chunks) {
    final completeData = Uint8List.fromList(chunks.expand((x) => x).toList());
    final newFile = CustomFile(
      name: fileName,
      bytes: completeData,
      size: completeData.lengthInBytes,
    );
    setState(() {
      _files.add(newFile);
    });
  }

  bool isValidExtension(String fileName) {
    if (widget.allowedExtensions == null || widget.allowedExtensions!.isEmpty) {
      return true;
    }

    final extension = path.extension(fileName);
    return widget.allowedExtensions!.contains(extension);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Radiuses.sm),
      ),
      backgroundColor: Colors.white,
      contentPadding: const EdgeInsets.fromLTRB(
        Spacings.lg,
        Spacings.lg,
        Spacings.lg,
        Spacings.sm,
      ),
      content: SizedBox(
        width: 550,
        height: _calculateDialogHeight(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildHeader(),
            const SizedBox(height: Spacings.sm),
            _buildUploadArea(),
            if (_files.isNotEmpty) ...[
              const SizedBox(height: 4),
              _buildFilesList(),
            ],
          ],
        ),
      ),
      actions: [_buildActionButtons(context)],
    );
  }

  Widget _buildHeader() {
    return Text(
      widget.config.modalTitle,
      overflow: TextOverflow.ellipsis,
      style: TextStyles.headingMediumSemibold,
    );
  }

  Widget _buildUploadArea() {
    return Expanded(
      child: DropRegion(
        formats: Formats.standardFormats,
        onDropOver: (event) {
          setState(() => _isDragging = true);
          return DropOperation.copy;
        },
        onDropLeave: (event) {
          setState(() => _isDragging = false);
        },
        onPerformDrop: _handlePerformDrop,
        child: DottedBorder(
          color: Colors.black,
          strokeWidth: 1,
          dashPattern: [4, 4],
          child: _buildUploadContent(),
        ),
      ),
    );
  }

  Widget _buildUploadContent() {
    return Material(
      color: _isDragging
          ? ListoMainColors.primary.light
          : ListoMainColors.primary.ultraLight,
      child: InkWell(
        highlightColor: ListoMainColors.primary.light,
        splashColor: ListoMainColors.primary.light,
        borderRadius: BorderRadius.circular(Radiuses.xs),
        onTap: _selectFiles,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildUploadButton(),
              const SizedBox(height: Spacings.xs),
              _buildUploadSecondaryText(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUploadButton() {
    return IntrinsicWidth(
      child: OutlinedButton(
        onPressed: _selectFiles,
        style: ButtonStyles.secondary.copyWith(
            backgroundColor: WidgetStateProperty.all(Colors.transparent)),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: Spacings.xs),
              child: Icon(Icons.file_upload_outlined),
            ),
            Flexible(
              child: Text(
                widget.config.uploadAreaMainText,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUploadSecondaryText() {
    return Text(
      widget.config.uploadAreaSecondaryText,
      overflow: TextOverflow.ellipsis,
      style: TextStyles.bodySmall.copyWith(
        color: ListoMainColors.primary.materialColor.shade900,
      ),
    );
  }

  Widget _buildFilesList() {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 220, minHeight: 60),
      child: ListView.separated(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        padding: const EdgeInsets.all(Spacings.xs),
        itemCount: _files.length,
        separatorBuilder: (context, index) => const SizedBox(height: 4),
        itemBuilder: (context, index) => ListItemDownload(
          status: isValidExtension(_files[index].name)
              ? DownloadStatus.downloaded
              : DownloadStatus.error,
          fileName: _files[index].name,
          onDelete: _removeFile,
        ),
      ),
    );
  }

  Widget _buildActionButtons(context) {
    return Row(
      children: [
        Expanded(
          child: Button(
            style: ButtonType.secondary,
            text: widget.config.secondaryButtonText,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        const SizedBox(width: Spacings.xs),
        Expanded(
          child: Button(
            style: ButtonType.primary,
            text: widget.config.primaryButtonText,
            enabled: _files.isNotEmpty &&
                _files.every((file) => isValidExtension(file.name)),
            onPressed: () {
              widget.onUpload(_files);
              Navigator.of(context).pop();
            },
          ),
        ),
      ],
    );
  }
}
