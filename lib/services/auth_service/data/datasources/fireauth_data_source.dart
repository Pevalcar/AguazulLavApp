import 'package:aguazullavapp/lib.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class IFirebaseAuthDataSource {
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

class FirebaseAuthDataSource implements IFirebaseAuthDataSource {
  final FirebaseAuth _firebaseAuth;
  FirebaseAuthDataSource(this._firebaseAuth);

  @override
  Future<bool> forgot(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      return true;
    } on FirebaseAuthException catch (e) {
      logger.e('Error al registrar usuario', error: e);
    } catch (e) {
      logger.e('Error al registrar usuario', error: e);
    }
    return false;
  }

  @override
  Future<UserInformationModel?> register(
      {required String email, required String password}) async {
    try {
      final credenciales = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      final userJson = credentialToJson(credenciales.user!, password);
      return UserInformationModel.fromJson(userJson);
    } on FirebaseAuthException catch (e) {
      logger.e('Error al registrar usuario', error: e);
    } catch (e) {
      logger.e('Error al registrar usuario', error: e);
    }
    return null;
  }

  @override
  Future<UserInformationModel?> signInWithCredentialGoogle( OAuthCredential credential) async {
    try {
      final credenciales = await _firebaseAuth.signInWithCredential(credential);
      final userJson = credentialToJson(credenciales.user!,"google");
      return UserInformationModel.fromJson(userJson);
    } on FirebaseAuthException catch (e) {
      logger.e('Error al iniciar sesion', error: e);
    } catch (e) {
      logger.e('Error al iniciar sesion', error: e);
    }
    return null;
  }

  @override
  Future<UserInformationModel?> login(
      {required String email, required String password}) async {
    try {
      final credenciales = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      final userJson = credentialToJson(credenciales.user!, password);
      return UserInformationModel.fromJson(userJson);
    } on FirebaseAuthException catch (e) {
      logger.e('Error al iniciar sesion', error: e);
    } catch (e) {
      logger.e('Error al iniciar sesion', error: e);
    }
    return null;
  }

  @override
  Future<void> logOut() {
    return _firebaseAuth.signOut();
  }

  @override
  Future<UserInformationModel?> fetchFireUser() async {
    try {
      final user = _firebaseAuth.currentUser;
      if (user != null) {
        final userJson = credentialToJson(user, "google");
        return UserInformationModel.fromJson(userJson);
      }
    } on FirebaseAuthException catch (e) {
      logger.e('Error al iniciar sesion', error: e);
    } catch (e) {
      logger.e('Error al iniciar sesion', error: e);
    }
    return null;
  }

  Map<String, dynamic> credentialToJson(User credential,String password) {
    return {
      'uid': credential.uid,
      'email': credential.email,
      'displayName': credential.displayName,
      'photoURL': credential.photoURL,
      'emailVerified': credential.emailVerified,
      "password":  password
    };
  }
}
