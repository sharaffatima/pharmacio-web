import 'package:dio/dio.dart';

import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/auth/data/datasources/auth_remote_data_source.dart';
import '../../features/auth/data/repos/auth_repo.dart';
import '../../features/auth/logic/cubits/auth_cubit.dart';
import '../../features/alerts/data/datasources/alerts_remote_data_source.dart';
import '../../features/alerts/data/repos/alerts_repo.dart';
import '../../features/alerts/logic/cubit/alerts_cubit.dart';
import '../../features/dashboard/data/datasources/dashboard_remote_data_source.dart';
import '../../features/dashboard/data/repos/dashboard_repo.dart';
import '../../features/dashboard/logic/cubit/dashboard_cubit.dart';
import '../../features/inventory/data/datasources/inventory_remote_data_source.dart';
import '../../features/inventory/data/repos/inventory_repo.dart';
import '../../features/inventory/logic/cubit/inventory_cubit.dart';
import '../../features/uploads/data/datasources/uploads_remote_data_source.dart';
import '../../features/uploads/data/repos/uploads_repo.dart';
import '../../features/uploads/logic/cubit/uploads_cubit.dart';
import '../networking/api_services_impl.dart';
import '../networking/network_info.dart';

final getIt = GetIt.instance;

Future<void> setupGetit() async {
  // //! feature - auth (login)

  //cubit
  getIt.registerFactory<AuthCubit>(() => AuthCubit(getIt()));
  //repo
  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepo(networkInfo: getIt(), authRemoteDataSource: getIt()),
  );
  //data source
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImp(apiServicesImpl: getIt()),
  );

  // //! feature - uploads
  getIt.registerFactory<UploadsCubit>(() => UploadsCubit(getIt()));
  getIt.registerLazySingleton<UploadsRepo>(
    () => UploadsRepo(uploadsRemoteDataSource: getIt(), networkInfo: getIt()),
  );
  getIt.registerLazySingleton<UploadsRemoteDataSource>(
    () => UploadsRemoteDataSourceImp(apiServicesImpl: getIt()),
  );

  // //! feature - dashboard
  getIt.registerFactory<DashboardCubit>(() => DashboardCubit(getIt()));
  getIt.registerLazySingleton<DashboardRepo>(
    () =>
        DashboardRepo(dashboardRemoteDataSource: getIt(), networkInfo: getIt()),
  );
  getIt.registerLazySingleton<DashboardRemoteDataSource>(
    () => DashboardRemoteDataSourceImp(apiServicesImpl: getIt()),
  );

  // //! feature - inventory
  getIt.registerFactory<InventoryCubit>(() => InventoryCubit(getIt()));
  getIt.registerLazySingleton<InventoryRepo>(
    () =>
        InventoryRepo(inventoryRemoteDataSource: getIt(), networkInfo: getIt()),
  );
  getIt.registerLazySingleton<InventoryRemoteDataSource>(
    () => InventoryRemoteDataSourceImp(apiServicesImpl: getIt()),
  );

  // //! feature - alerts
  getIt.registerFactory<AlertsCubit>(() => AlertsCubit(getIt()));
  getIt.registerLazySingleton<AlertsRepo>(
    () => AlertsRepo(alertsRemoteDataSource: getIt(), networkInfo: getIt()),
  );
  getIt.registerLazySingleton<AlertsRemoteDataSource>(
    () => AlertsRemoteDataSourceImp(apiServicesImpl: getIt()),
  );

  //! Core

  getIt.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImp(internetConnectionChecker: getIt()),
  );

  getIt.registerLazySingleton(() => ApiServicesImpl());

  //! External

  final sharedPreference = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => sharedPreference);
  getIt.registerLazySingleton(() => Dio());
  getIt.registerLazySingleton(() => InternetConnectionChecker.createInstance());
}
