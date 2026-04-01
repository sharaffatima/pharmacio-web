import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/alerts/logic/cubit/alerts_cubit.dart';
import '../../features/alerts/presentation/screens/alerts_screen.dart';
import '../../features/auth/logic/cubits/auth_cubit.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/register_screen.dart';
import '../../features/auth/presentation/screens/settings_screen.dart';
import '../../features/compare/logic/cubit/compare_cubit.dart';
import '../../features/compare/presentation/screens/compare_screen.dart';
import '../../features/dashboard/presentation/screens/dashboard_screen.dart';
import '../../features/inventory/logic/cubit/inventory_cubit.dart';
import '../../features/inventory/presentation/screens/inventory_screen.dart';
import '../../features/notifications/logic/cubit/notifications_cubit.dart';
import '../../features/offers/logic/cubit/offers_cubit.dart';
import '../../features/offers/presentation/screens/offers_screen.dart';
import '../../features/proposals/logic/cubit/proposals_cubit.dart';
import '../../features/proposals/presentation/screens/proposals_screen.dart';
import '../../features/uploads/logic/cubit/uploads_cubit.dart';
import '../../features/uploads/presentation/screens/uploads_screen.dart';
import '../di/dependency_injection.dart';
import 'routes.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // ─── Auth ─────────────────────────────────────────────────────────────
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<AuthCubit>(),
            child: const LoginScreen(),
          ),
        );

      case Routes.registerScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<AuthCubit>(),
            child: const RegisterScreen(),
          ),
        );

      case Routes.settingsScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<AuthCubit>()..getMe(),
            child: const SettingsScreen(),
          ),
        );

      // ─── Dashboard ────────────────────────────────────────────────────────
      case Routes.dashboardScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) => getIt<NotificationsCubit>()..loadNotifications(),
              ),
            ],
            child: const DashboardScreen(),
          ),
        );

      // ─── Uploads ──────────────────────────────────────────────────────────
      case Routes.uploadsScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<UploadsCubit>(),
            child: const UploadsScreen(),
          ),
        );

      // ─── Offers ───────────────────────────────────────────────────────────
      case Routes.offersScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<OffersCubit>()..loadData(),
            child: const OffersScreen(),
          ),
        );

      // ─── Compare ──────────────────────────────────────────────────────────
      case Routes.compareScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => getIt<CompareCubit>()..loadData()),
              // ProposalsCubit needed for compareOffers() and generateProposal()
              BlocProvider(create: (_) => getIt<ProposalsCubit>()),
            ],
            child: const CompareScreen(),
          ),
        );

      // ─── Proposals — now uses real repo via GetIt ──────────────────────────
      case Routes.proposalsScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<ProposalsCubit>()..loadData(),
            child: const ProposalsScreen(),
          ),
        );

      // ─── Inventory — now uses real repo via GetIt ─────────────────────────
      case Routes.inventoryScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<InventoryCubit>()..loadData(),
            child: const InventoryScreen(),
          ),
        );

      // ─── Alerts ───────────────────────────────────────────────────────────
      case Routes.alertsScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              // AlertsCubit manages only UI state (tab index, severity filter)
              BlocProvider(create: (_) => AlertsCubit()..init()),
              // NotificationsCubit provides all real data from API
              BlocProvider(
                create: (_) => getIt<NotificationsCubit>()..loadNotifications(),
              ),
            ],
            child: const AlertsScreen(),
          ),
        );

      default:
        return null;
    }
  }
}
