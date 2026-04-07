import 'dart:typed_data';

import 'package:flutter/material.dart';

/// Shared model representing a file upload entry.
class UploadEntry {
  final String filename;
  final String type;
  final String date;
  final String status;
  final Color statusColor;
  final Color statusBgColor;
  final Uint8List? bytes;

  const UploadEntry({
    required this.filename,
    required this.type,
    required this.date,
    required this.status,
    required this.statusColor,
    required this.statusBgColor,
    this.bytes,
  });

  /// Determines file type label from extension.
  static String typeFromExtension(String ext) {
    switch (ext.toLowerCase()) {
      case 'pdf':
        return 'PDF';
      case 'xlsx':
      case 'xls':
        return 'Excel';
      case 'doc':
      case 'docx':
        return 'Word';
      case 'png':
      case 'jpg':
      case 'jpeg':
      case 'gif':
      case 'webp':
        return 'Image';
      default:
        return ext.toUpperCase();
    }
  }
}
