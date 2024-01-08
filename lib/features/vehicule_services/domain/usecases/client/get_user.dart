import 'package:aguazullavapp/features/vehicule_services/domain/repositories/user_data_repository.dart';
import 'package:aguazullavapp/lib.dart';

class GetUser {
  final UserDataRepository repository;
  const GetUser({required this.repository});

  Future<User?> call(String userId) async {
    return repository.getUser(userId);
  }
}
