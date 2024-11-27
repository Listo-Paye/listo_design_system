import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';

enum UploadStatus {
  loaded,
  error,
  uploading,
  uploadComplete,
}

class ListItemDownload extends StatelessWidget {
  final UploadStatus status;
  final String fileName;
  final Function(String) onDelete;
  final double? uploadProgress;
  final String? errorMessage;

  const ListItemDownload({
    super.key,
    required this.status,
    required this.fileName,
    required this.onDelete,
    this.uploadProgress,
    this.errorMessage,
  });

  String get _uploadProgressString {
    if (status == UploadStatus.uploadComplete) {
      return "Téléversement : 100%";
    }

    if (uploadProgress == null) {
      return "Téléversement...";
    }

    return "Téléversement : ${(uploadProgress! * 100).toInt()}%";
  }

  Widget _buildTitle() {
    return Flexible(
      child: Text(
        fileName,
        overflow: TextOverflow.ellipsis,
        style: SepteoTextStyles.bodySmallInterBold,
      ),
    );
  }

  Widget _buildEndIcon() {
    bool shouldPad = status == UploadStatus.uploading || status == UploadStatus.uploadComplete;
    return Padding(
      padding: EdgeInsets.only(right: shouldPad ? SepteoSpacings.xs : 0),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(
            opacity: animation,
            child: ScaleTransition(
              scale: animation,
              child: child,
            ),
          );
        },
        child: status == UploadStatus.uploadComplete
            ? Icon(
                Icons.check_circle_outline,
                color: SepteoColors.green.shade600,
                size: 25,
              )
            : status == UploadStatus.uploading
                ? SizedBox(
                    width: 25,
                    height: 25,
                    child: CircularProgressIndicator(
                      value: uploadProgress,
                      strokeWidth: 3,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        SepteoColors.blue.shade600,
                      ),
                    ),
                  )
                : IconButton(
                    icon: Icon(
                      Icons.delete_outline,
                      color: SepteoColors.grey.shade400,
                      size: 25,
                    ),
                    onPressed: () => onDelete(fileName),
                  ),
      ),
    );
  }

  Widget _buildErrorContent() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildTitle(),
          Text(
            errorMessage ?? "Quelque chose s'est mal passé",
            style: SepteoTextStyles.captionInter.copyWith(
              color: SepteoColors.orange.shade600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUploadingContent() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildTitle(),
          Text(
            _uploadProgressString,
            style: SepteoTextStyles.captionInter.copyWith(
              color: SepteoColors.blue.shade600,
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildContent() {
    switch (status) {
      case UploadStatus.loaded:
        return [_buildTitle(), _buildEndIcon()];
      case UploadStatus.error:
        return [_buildErrorContent(), _buildEndIcon()];
      case UploadStatus.uploading:
      case UploadStatus.uploadComplete:
        return [_buildUploadingContent(), _buildEndIcon()];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(
          horizontal: SepteoSpacings.md, vertical: SepteoSpacings.xs),
      decoration: BoxDecoration(
        color: status == UploadStatus.error
            ? SepteoColors.orange.shade50
            : Colors.transparent,
        border: Border.all(
            color: status == UploadStatus.error
                ? SepteoColors.orange.shade800
                : SepteoColors.grey.shade400),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: _buildContent(),
      ),
    );
  }
}
