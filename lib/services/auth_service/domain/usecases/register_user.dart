
import 'package:aguazullavapp/lib.dart';

class RegisterUser {
  final IFirebaseAuthRepository firebaseAuthRepository;
  RegisterUser(this.firebaseAuthRepository);
  Future<UserInformationModel?> call(String email, String password) {
    return firebaseAuthRepository.register(email: email, password: password);
  }
}