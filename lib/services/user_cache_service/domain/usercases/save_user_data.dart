import 'package:aguazullavapp/lib.dart';

class SaveUserData {
  final IUserCacheRepository userCacheRepo;
  SaveUserData(this.userCacheRepo);
  Future<bool> call(UserInformationModel user) {
    return userCacheRepo.saveUser(user: user);
  }
}
