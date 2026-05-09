import 'package:flutter/material.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/text_styles.dart';
import '../../../../core/helpers/spacing.dart';

class ProposalsHeaderWidget extends StatelessWidget {
  final VoidCallback? onDownloadZip;

  const ProposalsHeaderWidget({super.key, this.onDownloadZip});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.proposalsManagement,
                style: AppTextStyles.font24BlackBold,
              ),
              verticalSpace(4),
              Text(
                AppStrings.proposalsSubtitle,
                style: AppTextStyles.font13GreyRegular,
              ),
            ],
          ),
        ),
        if (onDownloadZip != null)
          ElevatedButton.icon(
            onPressed: onDownloadZip,
            icon: const Icon(Icons.archive_outlined, size: 20),
            label: const Text('Download All (ZIP)'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.charcoalBlack,
              foregroundColor: AppColors.white,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            ),
          ),
      ],
    );
  }
}
