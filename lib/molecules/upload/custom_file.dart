import 'dart:typed_data';

class CustomFile {
  final String name;
  final Uint8List bytes;
  final int size;

  CustomFile({
    required this.name,
    required this.bytes,
    required this.size,
  });
}
