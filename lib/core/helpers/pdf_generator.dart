import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:archive/archive.dart';

import '../../features/proposals/data/models/purchase_proposal_model.dart';
import '../../features/proposals/data/models/proposal_item_model.dart';
import 'formatters.dart';

class PdfGenerator {
  static Future<Uint8List> generateProposalPdf(PurchaseProposalModel proposal) async {
    final pdf = pw.Document();

    final arabicFont = await PdfGoogleFonts.cairoRegular();
    final arabicFontBold = await PdfGoogleFonts.cairoBold();

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(32),
        theme: pw.ThemeData.withFont(
          base: arabicFont,
          bold: arabicFontBold,
        ),
        textDirection: pw.TextDirection.rtl,
        build: (context) {
          return [
            _buildHeader(proposal),
            pw.SizedBox(height: 20),
            _buildItemsTable(proposal.items ?? []),
          ];
        },
      ),
    );

    return pdf.save();
  }

  static pw.Widget _buildHeader(PurchaseProposalModel proposal) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text('Purchase Proposal #${proposal.id ?? "-"}',
            style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold)),
        pw.SizedBox(height: 16),
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text('Status: ${proposal.status ?? "-"}'),
                pw.SizedBox(height: 4),
                pw.Text('Created By: ${proposal.createdBy ?? "-"}'),
                pw.SizedBox(height: 4),
                pw.Text('Approved By: ${proposal.approvedBy ?? "-"}'),
              ],
            ),
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text('Created At: ${_formatDate(proposal.createdAt)}'),
                pw.SizedBox(height: 4),
                pw.Text('Updated At: ${_formatDate(proposal.updatedAt)}'),
                pw.SizedBox(height: 4),
                pw.Text('Total Cost: ${AppFormatters.formatCurrency(proposal.totalCost)}',
                    style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
              ],
            ),
          ],
        ),
      ],
    );
  }

  static pw.Widget _buildItemsTable(List<ProposalItemModel> items) {
    if (items.isEmpty) {
      return pw.Text('No items found.', style: const pw.TextStyle(color: PdfColors.grey600));
    }

    final headers = ['Product', 'Company', 'Qty', 'Unit Price', 'Total'];

    final data = items.map((item) {
      final strength = (item.strength != null && item.strength!.isNotEmpty)
          ? ' (${item.strength})'
          : '';
      final name = '${item.productName ?? "-"}$strength';
      return [
        name,
        item.company ?? "-",
        item.proposedQuantity?.toString() ?? "0",
        AppFormatters.formatCurrency(item.unitPrice),
        AppFormatters.formatCurrency(item.lineTotal),
      ];
    }).toList();

    return pw.TableHelper.fromTextArray(
      headers: headers,
      data: data,
      headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
      headerDecoration: const pw.BoxDecoration(color: PdfColors.grey300),
      rowDecoration: const pw.BoxDecoration(
        border: pw.Border(bottom: pw.BorderSide(color: PdfColors.grey300, width: 0.5)),
      ),
      cellAlignment: pw.Alignment.centerRight,
      cellPadding: const pw.EdgeInsets.symmetric(vertical: 8, horizontal: 4),
    );
  }

  static String _formatDate(DateTime? date) {
    if (date == null) return '-';
    final local = date.toLocal();
    final year = local.year.toString().padLeft(4, '0');
    final month = local.month.toString().padLeft(2, '0');
    final day = local.day.toString().padLeft(2, '0');
    final hour = local.hour.toString().padLeft(2, '0');
    final min = local.minute.toString().padLeft(2, '0');
    return '$year-$month-$day $hour:$min';
  }

  static Future<Uint8List> generateProposalsZip(List<PurchaseProposalModel> proposals) async {
    final archive = Archive();

    for (final proposal in proposals) {
      final pdfBytes = await generateProposalPdf(proposal);
      final filename = 'Proposal_${proposal.id ?? "Unknown"}.pdf';
      final archiveFile = ArchiveFile(filename, pdfBytes.length, pdfBytes);
      archive.addFile(archiveFile);
    }

    final encoder = ZipEncoder();
    final zipData = encoder.encode(archive);
    return Uint8List.fromList(zipData ?? []);
  }
}
