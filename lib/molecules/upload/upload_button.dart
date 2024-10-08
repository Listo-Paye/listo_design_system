import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';

import 'upload_dialog.dart';

class UploadButton extends StatelessWidget {
  final UploadConfig config;
  final List<String>? allowedExtensions;
  final Function(List<CustomFile> files) onUpload;

  const UploadButton({
    super.key,
    required this.config,
    required this.onUpload,
    this.allowedExtensions,
  });

  void _showUploadDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => UploadDialog(
        config: config,
        onUpload: onUpload,
        allowedExtensions: allowedExtensions,
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
