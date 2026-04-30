import 'dart:html' as html;
import 'dart:typed_data';

/// Web-only file download helper.
///
/// On Flutter Web, triggers a browser download by creating a Blob
/// and clicking a temporary anchor element. This avoids needing a
/// platform-specific package while still working out-of-the-box for
/// the project's primary target.
class FileDownloader {
  /// Downloads raw [bytes] as a file with [filename] (mime defaults
  /// to PDF). The browser handles the download UI.
  static void downloadBytes({
    required Uint8List bytes,
    required String filename,
    String mimeType = 'application/pdf',
  }) {
    final blob = html.Blob([bytes], mimeType);
    final url = html.Url.createObjectUrlFromBlob(blob);
    final anchor = html.AnchorElement(href: url)
      ..download = filename
      ..style.display = 'none';
    html.document.body?.append(anchor);
    anchor.click();
    anchor.remove();
    html.Url.revokeObjectUrl(url);
  }

  /// Opens the print dialog of the current page. Useful when the
  /// proposal details are rendered with print-friendly CSS.
  static void printCurrentPage() {
    html.window.print();
  }
}
