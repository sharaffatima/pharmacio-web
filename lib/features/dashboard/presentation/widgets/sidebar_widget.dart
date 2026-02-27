import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/text_styles.dart';
import '../../../../core/helpers/extentions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/language/language_cubit.dart';
import '../../../../core/theme/theme_cubit.dart';
import '../../../../core/routing/routes.dart';

class SidebarWidget extends StatelessWidget {
  final int selectedIndex;

  const SidebarWidget({super.key, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220.w,
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border(right: BorderSide(color: AppColors.gainsboro, width: 1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ─── Admin Panel Title ─────────────────────
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
            child: Text(
              AppStrings.adminPanel,
              style: AppTextStyles.font16BlackSemiBold.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 18.sp,
              ),
            ),
          ),

          // ─── Menu Items ───────────────────────────
          ..._buildMenuItems(context),

          const Spacer(),

          // ─── Language Toggle ───────────────────────
          _buildLanguageToggle(context),

          // ─── Theme Toggle ──────────────────────────
          _buildThemeToggle(context),

          // ─── Logout ───────────────────────────────
          _buildMenuItem(
            context: context,
            icon: Icons.logout,
            label: AppStrings.logout,
            index: -1,
            isLogout: true,
          ),
          verticalSpace(20),
        ],
      ),
    );
  }

  /// Maps sidebar index to its corresponding route.
  static const Map<int, String> _indexToRoute = {
    0: Routes.dashboardScreen,
    1: Routes.uploadsScreen,
    2: Routes.offersScreen,
    3: Routes.compareScreen,
    4: Routes.proposalsScreen,
    5: Routes.inventoryScreen,
    6: Routes.alertsScreen,
  };

  List<Widget> _buildMenuItems(BuildContext context) {
    final items = [
      _SidebarItem(Icons.dashboard_outlined, AppStrings.dashboard),
      _SidebarItem(Icons.cloud_upload_outlined, AppStrings.uploads),
      _SidebarItem(Icons.description_outlined, AppStrings.offers),
      _SidebarItem(Icons.compare_arrows, AppStrings.compare),
      _SidebarItem(Icons.assignment_outlined, AppStrings.proposals),
      _SidebarItem(Icons.inventory_2_outlined, AppStrings.inventory),
      _SidebarItem(Icons.notifications_outlined, AppStrings.alertsAndLogs),
    ];

    return items.asMap().entries.map((entry) {
      return _buildMenuItem(
        context: context,
        icon: entry.value.icon,
        label: entry.value.label,
        index: entry.key,
      );
    }).toList();
  }

  Widget _buildMenuItem({
    required BuildContext context,
    required IconData icon,
    required String label,
    required int index,
    bool isLogout = false,
  }) {
    final isSelected = index == selectedIndex;

    return InkWell(
      onTap: () {
        if (isLogout) {
          context.pushNamedAndRemoveUntil(
            Routes.loginScreen,
            predicate: (route) => false,
          );
        }
        if (index == selectedIndex) return;

        final route = _indexToRoute[index];
        if (route != null) {
          context.pushReplacementNamed(route);
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.skyBlue.withValues(alpha: 0.08)
              : AppColors.white,
          border: Border(
            left: BorderSide(
              color: isSelected ? AppColors.skyBlue : Colors.transparent,
              width: 3.w,
            ),
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
        child: Row(
          children: [
            Icon(
              icon,
              size: 20.sp,
              color: isSelected ? AppColors.skyBlue : AppColors.coolGrey,
            ),
            horizontalSpace(12),
            Text(
              label,
              style: AppTextStyles.font14BlackRegular.copyWith(
                color: isSelected
                    ? AppColors.skyBlue
                    : isLogout
                    ? AppColors.coolGrey
                    : AppColors.black,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageToggle(BuildContext context) {
    final cubit = context.read<LanguageCubit>();
    final isArabic = cubit.state == 'ar';

    return InkWell(
      onTap: () {
        cubit.toggleLanguage();
        final route = _indexToRoute[selectedIndex];
        if (route != null) {
          context.pushReplacementNamed(route);
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
        child: Row(
          children: [
            Icon(Icons.language, size: 20.sp, color: AppColors.coolGrey),
            horizontalSpace(12),
            Text(
              isArabic ? 'English' : 'العربية',
              style: AppTextStyles.font14BlackRegular.copyWith(
                color: AppColors.coolGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildThemeToggle(BuildContext context) {
    final cubit = context.read<ThemeCubit>();
    final isDark = cubit.state;

    return InkWell(
      onTap: () {
        cubit.toggleTheme();
        final route = _indexToRoute[selectedIndex];
        if (route != null) {
          context.pushReplacementNamed(route);
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
        child: Row(
          children: [
            Icon(
              isDark ? Icons.light_mode : Icons.dark_mode,
              size: 20.sp,
              color: AppColors.coolGrey,
            ),
            horizontalSpace(12),
            Text(
              isDark
                  ? (AppStrings.currentLanguage == 'ar'
                        ? 'وضع فاتح'
                        : 'Light Mode')
                  : (AppStrings.currentLanguage == 'ar'
                        ? 'وضع داكن'
                        : 'Dark Mode'),
              style: AppTextStyles.font14BlackRegular.copyWith(
                color: AppColors.coolGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SidebarItem {
  final IconData icon;
  final String label;

  _SidebarItem(this.icon, this.label);
}
