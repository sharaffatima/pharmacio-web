import 'dart:io';
import 'dart:typed_data';

import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';

class FileDownloader {
  static Future<void> downloadBytes({
    required Uint8List bytes,
    required String filename,
    String mimeType = 'application/pdf',
  }) async {
    final path = await FilePicker.platform.saveFile(
      dialogTitle: 'Save file',
      fileName: filename,
    );
    if (path == null) return;

    final file = File(path);
    await file.writeAsBytes(bytes);
  }

  static void printCurrentPage() {
    throw UnsupportedError('Printing is only supported on Flutter Web.');
  }

  static Future<void> exportToExcel({
    required List<List<String>> data,
    required String filename,
    List<String>? headers,
  }) async {
    final excel = Excel.createExcel();
    final sheet = excel['Sheet1'];

    if (headers != null && headers.isNotEmpty) {
      for (int i = 0; i < headers.length; i++) {
        sheet
            .cell(CellIndex.indexByColumnRow(columnIndex: i, rowIndex: 0))
            .value = TextCellValue(
          headers[i],
        );
      }
    }

    for (int row = 0; row < data.length; row++) {
      for (int col = 0; col < data[row].length; col++) {
        final rowIndex = headers != null && headers.isNotEmpty ? row + 1 : row;
        sheet
            .cell(
              CellIndex.indexByColumnRow(columnIndex: col, rowIndex: rowIndex),
            )
            .value = TextCellValue(
          data[row][col],
        );
      }
    }

    final encoded = excel.encode();
    if (encoded == null) return;

    final path = await FilePicker.platform.saveFile(
      dialogTitle: 'Save file',
      fileName: filename,
    );
    if (path == null) return;

    final file = File(path);
    await file.writeAsBytes(Uint8List.fromList(encoded));
  }
}
