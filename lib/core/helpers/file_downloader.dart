import 'dart:typed_data';

import 'file_downloader_stub.dart'
    if (dart.library.html) 'file_downloader_web.dart' as impl;

/// File download helper.
///
/// Uses a web implementation on Flutter Web, and a safe stub on non-web
/// platforms (e.g. VM tests).
class FileDownloader {
  static void downloadBytes({
    required Uint8List bytes,
    required String filename,
    String mimeType = 'application/pdf',
  }) =>
      impl.FileDownloader.downloadBytes(
        bytes: bytes,
        filename: filename,
        mimeType: mimeType,
      );

  static void printCurrentPage() => impl.FileDownloader.printCurrentPage();

  static void exportToExcel({
    required List<List<String>> data,
    required String filename,
    List<String>? headers,
  }) =>
      impl.FileDownloader.exportToExcel(
        data: data,
        filename: filename,
        headers: headers,
      );
}
