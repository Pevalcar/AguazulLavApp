import 'package:aguazullavapp/lib.dart';

class LoginUser {
  final IFirebaseAuthRepository firebaseAuthRepository;
  LoginUser(this.firebaseAuthRepository);
  Future<UserInformationModel?> call(String email, String password) {
    return firebaseAuthRepository.login(email: email, password: password);
  }
}
