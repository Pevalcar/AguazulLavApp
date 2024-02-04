
import 'package:aguazullavapp/lib.dart';

class LoginOutUser {
  final IFirebaseAuthRepository firebaseAuthRepository;
  LoginOutUser(this.firebaseAuthRepository);
   
  Future<void> call() async {
    await firebaseAuthRepository.logOut();
  }
}