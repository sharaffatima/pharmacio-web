import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/app_strings.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/text_styles.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../data/models/me/me_response.dart';

class SettingsHeaderWidget extends StatelessWidget {
  final MeResponse? me;

  const SettingsHeaderWidget({super.key, this.me});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.settingsTitle, style: AppTextStyles.font24BlackBold),
        verticalSpace(4),
        Text(
          AppStrings.settingsSubtitle,
          style: AppTextStyles.font14CoolGreyRegular,
        ),
        verticalSpace(32),
        if (me != null) _buildProfileCard(me!),
      ],
    );
  }

  Widget _buildProfileCard(MeResponse me) {
    final username = me.username ?? '';
    final email = me.email ?? '';
    final isActive = me.isActive ?? false;
    final roles = me.roles ?? const <String>[];

    return Container(
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.gainsboro),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 28.r,
            backgroundColor: AppColors.skyBlue.withValues(alpha: 0.15),
            child: Text(
              username.isNotEmpty ? username[0].toUpperCase() : 'A',
              style: AppTextStyles.font24BlackBold.copyWith(
                color: AppColors.skyBlue,
              ),
            ),
          ),
          horizontalSpace(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(username, style: AppTextStyles.font16BlackSemiBold),
                verticalSpace(4),
                if (email.isNotEmpty)
                  Text(email, style: AppTextStyles.font14CoolGreyRegular),
                verticalSpace(4),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 2.h,
                      ),
                      decoration: BoxDecoration(
                        color: isActive
                            ? Colors.green.withValues(alpha: 0.1)
                            : Colors.red.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Text(
                        isActive
                            ? AppStrings.activeStatus
                            : AppStrings.inactiveStatus,
                        style: AppTextStyles.font12GreyRegular.copyWith(
                          color: isActive ? Colors.green : Colors.red,
                        ),
                      ),
                    ),
                    horizontalSpace(8),
                    if (roles.isNotEmpty)
                      Text(
                        roles.join(', '),
                        style: AppTextStyles.font12GreyRegular,
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
