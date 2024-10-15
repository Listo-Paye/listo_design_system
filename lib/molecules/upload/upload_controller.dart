class UploadController {
  late void Function(String filename, double progress) onProgress;
  late void Function(String filename) onComplete;
  late void Function(String filename, String message) onError;
  final bool showProgress;

  UploadController({this.showProgress = false});
}
