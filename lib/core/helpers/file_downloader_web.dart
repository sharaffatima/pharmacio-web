// ignore_for_file: avoid_web_libraries_in_flutter, deprecated_member_use

import 'dart:html' as html;
import 'dart:typed_data';

import 'package:excel/excel.dart';

class FileDownloader {
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

  static void printCurrentPage() {
    html.window.print();
  }

  static void exportToExcel({
    required List<List<String>> data,
    required String filename,
    List<String>? headers,
  }) {
    final excel = Excel.createExcel();
    final sheet = excel['Sheet1'];

    if (headers != null && headers.isNotEmpty) {
      for (int i = 0; i < headers.length; i++) {
        sheet
                .cell(CellIndex.indexByColumnRow(columnIndex: i, rowIndex: 0))
                .value =
            TextCellValue(headers[i]);
      }
    }

    for (int row = 0; row < data.length; row++) {
      for (int col = 0; col < data[row].length; col++) {
        final rowIndex = headers != null && headers.isNotEmpty ? row + 1 : row;
        sheet
                .cell(
                  CellIndex.indexByColumnRow(
                    columnIndex: col,
                    rowIndex: rowIndex,
                  ),
                )
                .value =
            TextCellValue(data[row][col]);
      }
    }

    final bytes = excel.encode();
    if (bytes != null) {
      downloadBytes(
        bytes: Uint8List.fromList(bytes),
        filename: filename,
        mimeType:
            'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
      );
    }
  }
}

