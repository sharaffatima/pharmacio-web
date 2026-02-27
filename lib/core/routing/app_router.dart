import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/alerts/logic/cubit/alerts_cubit.dart';
import '../../features/alerts/presentation/screens/alerts_screen.dart';
import '../../features/auth/logic/cubits/login_cubit.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/compare/logic/cubit/compare_cubit.dart';
import '../../features/compare/presentation/screens/compare_screen.dart';
import '../../features/dashboard/presentation/screens/dashboard_screen.dart';
import '../../features/inventory/logic/cubit/inventory_cubit.dart';
import '../../features/inventory/presentation/screens/inventory_screen.dart';
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
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: LoginScreen(),
          ),
        );

      case Routes.dashboardScreen:
        return MaterialPageRoute(builder: (_) => const DashboardScreen());

      case Routes.uploadsScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => UploadsCubit()..loadData(),
            child: const UploadsScreen(),
          ),
        );

      case Routes.offersScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => OffersCubit()..loadData(),
            child: const OffersScreen(),
          ),
        );

      case Routes.compareScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => CompareCubit()..loadData(),
            child: const CompareScreen(),
          ),
        );

      case Routes.proposalsScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => ProposalsCubit()..loadData(),
            child: const ProposalsScreen(),
          ),
        );

      case Routes.inventoryScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => InventoryCubit()..loadData(),
            child: const InventoryScreen(),
          ),
        );

      case Routes.alertsScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => AlertsCubit()..loadData(),
            child: const AlertsScreen(),
          ),
        );

      default:
        return null;
    }
  }
}
