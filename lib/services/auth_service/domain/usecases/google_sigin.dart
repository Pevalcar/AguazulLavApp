import 'package:aguazullavapp/lib.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GoogleSignInUser {
  final IFirebaseAuthRepository firebaseAuthRepository;
  GoogleSignInUser(this.firebaseAuthRepository);
  Future<UserInformationModel?> call(OAuthCredential credential) {
    return firebaseAuthRepository.signInWithCredentialGoogle(credential);
  }
}
