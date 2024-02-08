import 'package:aguazullavapp/lib.dart';
import 'package:firebase_auth/firebase_auth.dart' show OAuthCredential;

abstract class IFirebaseAuthRepository {
  Future<UserInformationModel?> login(
      {required String email, required String password});
  Future<UserInformationModel?> register(
      {required String email, required String password});
  Future<bool> forgot(String email);
  Future<UserInformationModel?> signInWithCredentialGoogle(
      OAuthCredential credential);
  Future<void> logOut();

  Future<UserInformationModel?> fetchFireUser();
}
