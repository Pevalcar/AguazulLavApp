import 'package:aguazullavapp/lib.dart';
import 'package:firebase_auth/firebase_auth.dart' show OAuthCredential;

class FirebaseAuthRepository implements IFirebaseAuthRepository {
  final FirebaseAuthDataSource dataSource;
  FirebaseAuthRepository(this.dataSource);
  @override
  Future<bool> forgot(String email) async {
    return await dataSource.forgot(email);
  }

  @override
  Future<UserInformationModel?> login(
      {required String email, required String password}) async {
    return await dataSource.login(email: email, password: password);
  }

  @override
  Future<UserInformationModel?> register(
      {required String email, required String password}) async {
    return await dataSource.register(email: email, password: password);
  }

  @override
  Future<UserInformationModel?> signInWithCredentialGoogle(
      OAuthCredential credential) async {
    return await dataSource.signInWithCredentialGoogle(credential);
  }
  
  @override
  Future<void> logOut() {
    return  dataSource.logOut();
  }
  
  @override
  Future<UserInformationModel?> fetchFireUser() {
    return dataSource.fetchFireUser();
  }
}
