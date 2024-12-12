import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';

import 'upload_dialog.dart';

class UploadButton extends StatelessWidget {
  final UploadConfig config;
  final List<String>? allowedExtensions;
  final Future<void> Function()? onClose;
  final UploadController controller;
  final Function(List<CustomFile> files) onUpload;

  const UploadButton({
    super.key,
    required this.config,
    required this.onUpload,
    required this.controller,
    this.allowedExtensions,
    this.onClose,
  });

  void _showUploadDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => UploadDialog(
        controller: controller,
        config: config,
        onUpload: onUpload,
        allowedExtensions: allowedExtensions,
        onClose: onClose,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Button(
      onPressed: () => _showUploadDialog(context),
      text: config.openModalButtonText,
      width: 200,
      style: ButtonType.primary,
    );
  }
}
