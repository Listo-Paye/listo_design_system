import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';
import 'package:listo_design_system/molecules/upload/list_item_download.dart';
import 'package:path/path.dart' as path;

import 'upload_area.dart';
import 'file_list.dart';
import 'custom_file_wrapper.dart';

class UploadDialog extends StatefulWidget {
  final UploadConfig config;
  final List<String>? allowedExtensions;
  final VoidCallback? onClose;
  final Function(List<CustomFile>) onUpload;
  final UploadController controller;

  const UploadDialog({
    super.key,
    required this.config,
    required this.onUpload,
    required this.controller,
    this.allowedExtensions,
    this.onClose,
  });

  @override
  State<UploadDialog> createState() => _UploadDialogState();
}

class _UploadDialogState extends State<UploadDialog> {
  final List<CustomFileWrapper> _files = [];

  @override
  void initState() {
    super.initState();
    _setupController();
  }

  void _setupController() {
    widget.controller.onProgress = _updateUploadProgress;
    widget.controller.onComplete = _markUploadComplete;
    widget.controller.onError = _onError;
  }

  void _addFile(CustomFile file) {
    if (_files.any((f) => f.file.name == file.name)) return;

    final status = _getFileStatus(file.name);
    setState(() {
      _files.add(CustomFileWrapper(
        file: file,
        status: status,
        errorMessage: status == UploadStatus.error
            ? "Format de fichier non pris en compte"
            : null,
      ));
    });
  }

  void _removeFile(String fileName) {
    setState(() {
      _files.removeWhere((f) => f.file.name == fileName);
    });
  }

  UploadStatus _getFileStatus(String fileName) {
    return _isValidExtension(fileName)
        ? UploadStatus.loaded
        : UploadStatus.error;
  }

  bool _isValidExtension(String fileName) {
    if (widget.allowedExtensions == null || widget.allowedExtensions!.isEmpty) {
      return true;
    }
    final extension = path.extension(fileName);
    return widget.allowedExtensions!.contains(extension);
  }

  void _updateUploadProgress(String fileName, double progress) {
    if (!widget.controller.showProgress) return;
    setState(() {
      final file = _files.firstWhere((f) => f.file.name == fileName);
      file.uploadProgress = progress;
    });
  }

  void _markUploadComplete(String fileName) {
    setState(() {
      final file = _files.firstWhere((f) => f.file.name == fileName);
      file.status = UploadStatus.uploadComplete;
    });
  }

  void _onError(String fileName, String message) {
    setState(() {
      final file = _files.firstWhere((f) => f.file.name == fileName);
      file.status = UploadStatus.error;
      file.errorMessage = message;
    });
  }

  void _startUploading() {
    final filesToUpload = _files
        .where((f) => f.status == UploadStatus.loaded)
        .map((f) => f.file)
        .toList();

    widget.onUpload(filesToUpload);

    setState(() {
      for (var file in _files) {
        if (file.status != UploadStatus.uploadComplete) {
          file.status = UploadStatus.uploading;
          file.uploadProgress = widget.controller.showProgress ? 0.0 : null;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(SepteoSpacings.sm),
      ),
      backgroundColor: Colors.white,
      contentPadding: const EdgeInsets.fromLTRB(
        SepteoSpacings.xxl,
        SepteoSpacings.xxl,
        SepteoSpacings.xxl,
        SepteoSpacings.md,
      ),
      content: SizedBox(
        width: 550,
        height: _calculateDialogHeight(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildHeader(),
            const SizedBox(height: SepteoSpacings.md),
            UploadArea(
              config: widget.config,
              onFilesAdded: (files) => files.forEach(_addFile),
            ),
            if (_files.isNotEmpty) ...[
              const SizedBox(height: SepteoSpacings.xs),
              FileList(
                files: _files,
                onRemove: _removeFile,
              ),
            ],
          ],
        ),
      ),
      actions: [_buildActionButtons()],
    );
  }

  Widget _buildHeader() {
    return Text(
      widget.config.modalTitle,
      style: SepteoTextStyles.bodyLargeInterBold,
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: Button(
            style: ButtonType.secondary,
            text: widget.config.secondaryButtonText,
            onPressed: () {
              widget.onClose?.call();
              Navigator.of(context).pop();
            },
          ),
        ),
        const SizedBox(width: SepteoSpacings.xs),
        Expanded(
          child: Button(
            style: ButtonType.primary,
            text: widget.config.primaryButtonText,
            enabled: _isPrimaryButtonEnabled(),
            onPressed: _startUploading,
          ),
        ),
      ],
    );
  }

  bool _isPrimaryButtonEnabled() {
    return _files.isNotEmpty &&
        !_files.any((f) => f.status == UploadStatus.uploading) &&
        !_files.any((f) => f.status == UploadStatus.error) &&
        _files.any((f) => f.status == UploadStatus.loaded);
  }

  double _calculateDialogHeight() {
    const double minHeight = 250.0;
    const double maxHeight = 530.0;
    const double baseHeight = 250.0;
    const double fileItemHeight = 60.0;

    final contentHeight = baseHeight + (_files.length * fileItemHeight);
    return contentHeight.clamp(minHeight, maxHeight);
  }
}
