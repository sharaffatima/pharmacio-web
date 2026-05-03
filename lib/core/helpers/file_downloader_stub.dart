import 'dart:typed_data';

class FileDownloader {
  static void downloadBytes({
    required Uint8List bytes,
    required String filename,
    String mimeType = 'application/pdf',
  }) {
    throw UnsupportedError('File downloads are only supported on Flutter Web.');
  }

  static void printCurrentPage() {
    throw UnsupportedError('Printing is only supported on Flutter Web.');
  }

  static void exportToExcel({
    required List<List<String>> data,
    required String filename,
    List<String>? headers,
  }) {
    throw UnsupportedError('Excel export is only supported on Flutter Web.');
  }
}

