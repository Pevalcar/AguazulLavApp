import 'package:aguazullavapp/lib.dart';

class LoginUser {
  final FirebaseAuthRepository firebaseAuthRepository;
  LoginUser(this.firebaseAuthRepository);
  Future<UserInformationModel?> call(String email, String password) async {
    return await firebaseAuthRepository.login(email: email, password: password);
  }
}
