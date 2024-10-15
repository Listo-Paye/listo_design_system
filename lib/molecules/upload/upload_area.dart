import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:super_drag_and_drop/super_drag_and_drop.dart';

class UploadArea extends StatefulWidget {
  final UploadConfig config;
  final Function(List<CustomFile>) onFilesAdded;

  const UploadArea({
    super.key,
    required this.config,
    required this.onFilesAdded,
  });

  @override
  State<UploadArea> createState() => _UploadAreaState();
}

class _UploadAreaState extends State<UploadArea> {
  bool _isDragging = false;

  Future<void> _selectFiles() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: true);
    if (result != null) {
      final files = result.files
          .where((file) => file.bytes != null)
          .map((file) => CustomFile(
                name: file.name,
                bytes: file.bytes!,
                size: file.size,
              ))
          .toList();
      widget.onFilesAdded(files);
    }
  }

  Future<void> _handlePerformDrop(PerformDropEvent event) async {
    final items = event.session.items;
    final files = <CustomFile>[];

    for (final item in items) {
      final reader = item.dataReader;
      reader?.getFile(null, (file) {
        final stream = file.getStream();
        final chunks = <Uint8List>[];
        stream.listen(
          (chunk) => chunks.add(chunk),
          onDone: () {
            final completeData =
                Uint8List.fromList(chunks.expand((x) => x).toList());
            files.add(CustomFile(
              name: file.fileName ?? '',
              bytes: completeData,
              size: completeData.lengthInBytes,
            ));
            if (files.length == items.length) {
              widget.onFilesAdded(files);
            }
          },
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
          padding: const EdgeInsets.all(Spacings.xs),
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
    return OutlinedButton(
      onPressed: _selectFiles,
      style: ButtonStyles.secondary.copyWith(
        backgroundColor: WidgetStateProperty.all(Colors.transparent),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.file_upload_outlined, size: 18),
          const SizedBox(width: Spacings.xs),
          Text(widget.config.uploadAreaMainText),
        ],
      ),
    );
  }

  Widget _buildUploadSecondaryText() {
    return Text(
      widget.config.uploadAreaSecondaryText,
      style: TextStyles.bodySmall.copyWith(
        color: ListoMainColors.primary.materialColor.shade900,
      ),
    );
  }
}
