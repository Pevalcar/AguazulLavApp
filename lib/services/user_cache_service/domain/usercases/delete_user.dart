
import 'package:aguazullavapp/lib.dart';

class DeleteUser {
  final IUserCacheRepository userCacheRepo;
  DeleteUser(this.userCacheRepo);
  Future<bool> call() {
    return userCacheRepo.deleteUser();
  }
}