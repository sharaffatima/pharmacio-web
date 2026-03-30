import 'package:dio/dio.dart';

import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/auth/data/datasources/auth_remote_data_source.dart';
import '../../features/auth/data/repos/auth_repo.dart';
import '../../features/auth/logic/cubits/auth_cubit.dart';
import '../../features/proposals/data/datasources/proposals_remote_data_source.dart';
import '../../features/proposals/data/repos/proposals_repo.dart';
import '../../features/proposals/logic/cubit/proposals_cubit.dart';
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

  // //! feature - proposals
  getIt.registerFactory<ProposalsCubit>(() => ProposalsCubit(getIt()));
  getIt.registerLazySingleton<ProposalsRepo>(
        () => ProposalsRepo(remoteDataSource: getIt(), networkInfo: getIt()),
  );
  getIt.registerLazySingleton<ProposalsRemoteDataSource>(
        () => ProposalsRemoteDataSourceImpl(apiServicesImpl: getIt()),
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