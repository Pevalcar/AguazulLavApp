// import 'package:aguazullavapp/lib.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';

// part 'user_cache_provider.g.dart';

// @riverpod
// UserDataSource userDatasource(UserDataSourceRef ref) {
//   final storageService = ref.watch();
//    return UserLocalDatasource(storageService);
// }
// final userLocalRepositoryProvider = Provider<UserRepository>((ref) {
//   final storageService = ref.watch(storageServiceProvider);

//   final datasource = ref.watch(userDatasourceProvider(storageService));

//   final repository = UserRepositoryImpl(datasource);

//   return repository;
// });
