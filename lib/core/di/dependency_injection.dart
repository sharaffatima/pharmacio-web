import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/auth/data/datasources/auth_remote_data_source.dart';
import '../../features/auth/data/repos/auth_repo.dart';
import '../../features/auth/logic/cubits/auth_cubit.dart';
import '../../features/compare/data/datasources/compare_remote_data_source.dart';
import '../../features/compare/data/repos/compare_repo.dart';
import '../../features/compare/logic/cubit/compare_cubit.dart';
import '../../features/offers/data/datasources/offers_remote_data_source.dart';
import '../../features/offers/data/repos/offers_repo.dart';
import '../../features/offers/logic/cubit/offers_cubit.dart';
import '../../features/inventory/data/datasources/inventory_remote_data_source.dart';
import '../../features/inventory/data/repos/inventory_repo.dart';
import '../../features/inventory/logic/cubit/inventory_cubit.dart';
import '../../features/notifications/data/datasources/notifications_remote_data_source.dart';
import '../../features/notifications/data/repos/notifications_repo.dart';
import '../../features/notifications/logic/cubit/notifications_cubit.dart';
import '../../features/proposals/data/datasources/proposals_remote_data_source.dart';
import '../../features/proposals/data/repos/proposals_repo.dart';
import '../../features/proposals/logic/cubit/proposals_cubit.dart';
import '../../features/uploads/data/datasources/uploads_remote_data_source.dart';
import '../../features/uploads/data/repos/uploads_repo.dart';
import '../../features/uploads/logic/cubit/uploads_cubit.dart';
import '../../features/rbac/data/datasources/rbac_remote_data_source.dart';
import '../../features/rbac/data/repos/rbac_repo.dart';
import '../../features/rbac/logic/cubit/rbac_cubit.dart';
import '../networking/api_services_impl.dart';
import '../networking/network_info.dart';

final getIt = GetIt.instance;

Future<void> setupGetit() async {
  // ─── feature: auth ────────────────────────────────────────────────────────
  getIt.registerFactory<AuthCubit>(() => AuthCubit(getIt()));
  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepo(networkInfo: getIt(), authRemoteDataSource: getIt()),
  );
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImp(apiServicesImpl: getIt()),
  );

  // ─── feature: uploads ─────────────────────────────────────────────────────
  getIt.registerFactory<UploadsCubit>(() => UploadsCubit(getIt()));
  getIt.registerLazySingleton<UploadsRepo>(
    () => UploadsRepo(uploadsRemoteDataSource: getIt(), networkInfo: getIt()),
  );
  getIt.registerLazySingleton<UploadsRemoteDataSource>(
    () => UploadsRemoteDataSourceImp(apiServicesImpl: getIt()),
  );

  // ─── feature: inventory ───────────────────────────────────────────────────
  getIt.registerFactory<InventoryCubit>(() => InventoryCubit(getIt()));
  getIt.registerLazySingleton<InventoryRepo>(
    () =>
        InventoryRepo(inventoryRemoteDataSource: getIt(), networkInfo: getIt()),
  );
  getIt.registerLazySingleton<InventoryRemoteDataSource>(
    () => InventoryRemoteDataSourceImp(apiServicesImpl: getIt()),
  );

  // ─── feature: offers ───────────────────────────────────────────────────────
  getIt.registerFactory<OffersCubit>(() => OffersCubit(getIt()));
  getIt.registerLazySingleton<OffersRepo>(
    () => OffersRepo(offersRemoteDataSource: getIt(), networkInfo: getIt()),
  );
  getIt.registerLazySingleton<OffersRemoteDataSource>(
    () => OffersRemoteDataSourceImp(apiServicesImpl: getIt()),
  );

  // ─── feature: compare ──────────────────────────────────────────────────────
  getIt.registerFactory<CompareCubit>(() => CompareCubit(getIt()));
  getIt.registerLazySingleton<CompareRepo>(
    () => CompareRepo(compareRemoteDataSource: getIt(), networkInfo: getIt()),
  );
  getIt.registerLazySingleton<CompareRemoteDataSource>(
    () => CompareRemoteDataSourceImp(apiServicesImpl: getIt()),
  );

  // ─── feature: proposals ───────────────────────────────────────────────────
  getIt.registerFactory<ProposalsCubit>(() => ProposalsCubit(getIt()));
  getIt.registerLazySingleton<ProposalsRepo>(
    () =>
        ProposalsRepo(proposalsRemoteDataSource: getIt(), networkInfo: getIt()),
  );
  getIt.registerLazySingleton<ProposalsRemoteDataSource>(
    () => ProposalsRemoteDataSourceImp(apiServicesImpl: getIt()),
  );

  // ─── feature: notifications ───────────────────────────────────────────────
  getIt.registerFactory<NotificationsCubit>(() => NotificationsCubit(getIt()));
  getIt.registerLazySingleton<NotificationsRepo>(
    () => NotificationsRepo(
      notificationsRemoteDataSource: getIt(),
      networkInfo: getIt(),
    ),
  );
  getIt.registerLazySingleton<NotificationsRemoteDataSource>(
    () => NotificationsRemoteDataSourceImp(apiServicesImpl: getIt()),
  );

  // ─── feature: rbac ─────────────────────────────────────────────────────────
  getIt.registerFactory<RbacCubit>(() => RbacCubit(getIt()));
  getIt.registerLazySingleton<RbacRepo>(
    () => RbacRepo(rbacRemoteDataSource: getIt(), networkInfo: getIt()),
  );
  getIt.registerLazySingleton<RbacRemoteDataSource>(
    () => RbacRemoteDataSourceImp(apiServicesImpl: getIt()),
  );

  // ─── Core ─────────────────────────────────────────────────────────────────
  getIt.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImp(internetConnectionChecker: getIt()),
  );
  getIt.registerLazySingleton(() => ApiServicesImpl());

  // ─── External ─────────────────────────────────────────────────────────────
  final sharedPreference = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => sharedPreference);
  getIt.registerLazySingleton(() => Dio());
  getIt.registerLazySingleton(() => InternetConnectionChecker.createInstance());
}
