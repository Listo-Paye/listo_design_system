import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';

import 'custom_file_wrapper.dart';
import 'list_item_download.dart';

class FileList extends StatelessWidget {
  final List<CustomFileWrapper> files;
  final Function(String) onRemove;

  const FileList({
    super.key,
    required this.files,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 350, minHeight: 60),
      child: ListView.separated(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(vertical: Spacings.xs),
        itemCount: files.length,
        separatorBuilder: (context, index) => const SizedBox(height: 4),
        itemBuilder: (context, index) {
          final file = files[index];
          return ListItemDownload(
            status: file.status,
            fileName: file.file.name,
            onDelete: onRemove,
            uploadProgress: file.uploadProgress,
            errorMessage: file.errorMessage,
          );
        },
      ),
    );
  }
}