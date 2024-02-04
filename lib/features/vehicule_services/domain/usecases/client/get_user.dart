import 'package:aguazullavapp/lib.dart';

class GetUser {
  final UserDataRepository repository;
  const GetUser({required this.repository});

  Future<Client?> call(String userId) async {
    return repository.getUser(userId);
  }
}
