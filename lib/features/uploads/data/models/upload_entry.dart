import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/colors.dart';

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

  /// Creates sample data for initial display.
  static List<UploadEntry> sampleData() => [
    UploadEntry(
      filename: 'supplier_offers_Q1_2026.pdf',
      type: 'PDF',
      date: '2026-02-11 09:30',
      status: AppStrings.completed,
      statusColor: AppColors.emerald,
      statusBgColor: AppColors.emerald.withValues(alpha: 0.1),
    ),
    UploadEntry(
      filename: 'warehouse_inventory.xlsx',
      type: 'Excel',
      date: '2026-02-11 08:15',
      status: AppStrings.processing,
      statusColor: AppColors.saffronAmber,
      statusBgColor: AppColors.saffronAmber.withValues(alpha: 0.1),
    ),
    UploadEntry(
      filename: 'price_list_vendor_A.pdf',
      type: 'PDF',
      date: '2026-02-10 16:45',
      status: AppStrings.completed,
      statusColor: AppColors.emerald,
      statusBgColor: AppColors.emerald.withValues(alpha: 0.1),
    ),
    UploadEntry(
      filename: 'offers_february.pdf',
      type: 'PDF',
      date: '2026-02-10 14:20',
      status: AppStrings.failed,
      statusColor: AppColors.brightRed,
      statusBgColor: AppColors.brightRed.withValues(alpha: 0.1),
    ),
    UploadEntry(
      filename: 'stock_update_feb.png',
      type: 'Image',
      date: '2026-02-09 11:00',
      status: AppStrings.completed,
      statusColor: AppColors.emerald,
      statusBgColor: AppColors.emerald.withValues(alpha: 0.1),
    ),
  ];

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
