
import 'package:aguazullavapp/lib.dart';

class  ForgotUser {
  final IFirebaseAuthRepository firebaseAuthRepository;
  ForgotUser(this.firebaseAuthRepository);
  Future<bool> call(String email) {
    return firebaseAuthRepository.forgot(email);
  }
}