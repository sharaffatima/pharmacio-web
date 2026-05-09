import 'file_downloader_stub.dart' if (dart.library.html) 'file_downloader_web.dart';

abstract class FileDownloader {
  static void downloadFile(List<int> bytes, String filename) {
    downloadFileImpl(bytes, filename);
  }
}
