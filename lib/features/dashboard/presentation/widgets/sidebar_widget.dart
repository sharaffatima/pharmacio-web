import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/text_styles.dart';
import '../../../../core/helpers/extentions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/language/language_cubit.dart';
import '../../../../core/public_widgets/loading_widget.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theme/theme_cubit.dart';
import '../../../auth/logic/cubits/auth_cubit.dart';

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

          // ─── Register New Admin ────────────────────
          _buildRegisterButton(context),

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

  static const Map<int, String> _indexToRoute = {
    0: Routes.dashboardScreen,
    1: Routes.uploadsScreen,
    2: Routes.offersScreen,
    3: Routes.compareScreen,
    4: Routes.proposalsScreen,
    5: Routes.inventoryScreen,
    6: Routes.alertsScreen,
    7: Routes.settingsScreen,
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
      _SidebarItem(Icons.settings, AppStrings.settings),
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
          _showLogoutConfirmDialog(context);
          return;
        }
        if (index == selectedIndex) return;

        final route = _indexToRoute[index];
        if (route != null) {
          if (route == Routes.settingsScreen) {
            context.pushNamed(route);
          } else {
            context.pushReplacementNamed(route);
          }
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.skyBlue.withValues(alpha: 0.08)
              : AppColors.white,
          border: Border(
            left: BorderSide(
              color: isSelected ? AppColors.skyBlue : AppColors.transparent,
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

  void _showLogoutConfirmDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => BlocProvider(
        create: (_) => GetIt.I<AuthCubit>(),
        child: Builder(
          builder: (dialogContext) {
            return BlocListener<AuthCubit, AuthState>(
              listener: (listenerContext, state) {
                state.whenOrNull(
                  successLogout: (_) {
                    Navigator.of(dialogContext).pop();
                    if (context.mounted) {
                      context.pushNamedAndRemoveUntil(
                        Routes.loginScreen,
                        predicate: (route) => false,
                      );
                    }
                  },
                  error: (msg) {
                    Navigator.of(dialogContext).pop();
                    if (context.mounted) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text(msg)));
                    }
                  },
                );
              },
              child: AlertDialog(
                title: Text(
                  AppStrings.logoutConfirmTitle,
                  style: AppTextStyles.font16BlackSemiBold,
                ),
                content: Text(
                  AppStrings.logoutConfirmMessage,
                  style: AppTextStyles.font14CoolGreyRegular,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(dialogContext).pop(),
                    child: Text(
                      AppStrings.cancel,
                      style: AppTextStyles.font14CoolGreyRegular,
                    ),
                  ),
                  BlocBuilder<AuthCubit, AuthState>(
                    builder: (ctx, state) {
                      return state.maybeWhen(
                        loading: () => LoadingWidget(),
                        orElse: () => TextButton(
                          onPressed: () => ctx.read<AuthCubit>().logout(),
                          child: Text(
                            AppStrings.logout,
                            style: AppTextStyles.font14CoolGreyRegular.copyWith(
                              color: AppColors.brightRed,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildRegisterButton(BuildContext context) {
    return InkWell(
      onTap: () => context.pushNamed(Routes.registerScreen),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
        child: Row(
          children: [
            Icon(
              Icons.person_add_outlined,
              size: 20.sp,
              color: AppColors.coolGrey,
            ),
            horizontalSpace(12),
            Text(
              AppStrings.registerNewAdmin,
              style: AppTextStyles.font14BlackRegular.copyWith(
                color: AppColors.coolGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageToggle(BuildContext context) {
    final cubit = context.read<LanguageCubit>();

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
              AppStrings.switchLanguageLabel,
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
              isDark ? AppStrings.lightMode : AppStrings.darkMode,
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
