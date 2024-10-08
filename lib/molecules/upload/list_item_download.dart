import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';

enum DownloadStatus {
  downloaded,
  error,
}

class ListItemDownload extends StatelessWidget {
  final DownloadStatus status;
  final String fileName;
  final Function(String) onDelete;

  const ListItemDownload({
    super.key,
    required this.status,
    required this.fileName,
    required this.onDelete,
  });

  Widget _buildTitle() {
    return Flexible(
      child: Text(
        fileName,
        overflow: TextOverflow.ellipsis,
        style: TextStyles.bodyMediumSemibold,
      ),
    );
  }

  List<Widget> _buildContent() {
    return switch (status) {
      DownloadStatus.downloaded => [
          _buildTitle(),
          IconButton(
            icon: Icon(
              Icons.delete_outline,
              color: ListoMainColors.neutral.shade400,
              size: 25,
            ),
            onPressed: () => onDelete(fileName),
          ),
        ],
      DownloadStatus.error => [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildTitle(),
                Text(
                  "Format de fichier non pris en compte",
                  style: TextStyles.bodySmall.copyWith(
                    color: ListoMainColors.secondary.base,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.delete_outline,
              color: ListoMainColors.neutral.shade400,
              size: 25,
            ),
            onPressed: () => onDelete(fileName),
          ),
        ],
    };
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(
          horizontal: Spacings.sm, vertical: Spacings.xs),
      decoration: BoxDecoration(
        color: status == DownloadStatus.error
            ? ListoMainColors.secondary.ultraLight
            : Colors.transparent,
        border: Border.all(
            color: status == DownloadStatus.error
                ? ListoMainColors.secondary.darker
                : ListoMainColors.neutral.shade400),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: _buildContent(),
      ),
    );
  }
}
