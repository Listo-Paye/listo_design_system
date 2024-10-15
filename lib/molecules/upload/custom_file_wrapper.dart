import 'package:listo_design_system/listo_design_system.dart';
import 'package:listo_design_system/molecules/upload/list_item_download.dart';

class CustomFileWrapper {
  final CustomFile file;
  UploadStatus status;
  double? uploadProgress;
  String? errorMessage;

  CustomFileWrapper({
    required this.file,
    required this.status,
    this.uploadProgress,
    this.errorMessage,
  });
}
