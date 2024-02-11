import 'package:aguazullavapp/lib.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

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
      final userJson = await credentialToJson(credenciales.user!, password);
      return UserInformationModel.fromJson(userJson);
    } on FirebaseAuthException catch (e) {
      logger.e('Error al registrar usuario', error: e);
    } catch (e) {
      logger.e('Error al registrar usuario', error: e);
    }
    return null;
  }

  @override
  Future<UserInformationModel?> signInWithCredentialGoogle(
      OAuthCredential credential) async {
    try {
      final credenciales = await _firebaseAuth.signInWithCredential(credential);
      final userJson = await credentialToJson(credenciales.user!, "google");
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
    UserInformationModel? user;
    try {
      UserCredential credenciales = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      final Map<String, dynamic> userJson =
          await credentialToJson(credenciales.user, password);
      user = UserInformationModel.fromJson(userJson);
      return user;
    } on FirebaseAuthException catch (e) {
      logger.e('Error al iniciar sesion', error: e);
      rethrow;
    } catch (e) {
      logger.e('Error al iniciar sesion catch', error: e);
    }
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
        final userJson = await credentialToJson(user, "google");
        return UserInformationModel.fromJson(userJson);
      }
    } on FirebaseAuthException catch (e) {
      logger.e('Error al iniciar sesion', error: e);
    } catch (e) {
      logger.e('Error al iniciar sesion', error: e);
    }
    return null;
  }

  Future<Map<String, dynamic>> credentialToJson(
      User? credential, String password) async {
    if (credential == null) {
      await FirebaseCrashlytics.instance.recordError(
          "Error al iniciar sesion credenciale null ${credential}", null);
      return {};
    }

    final json = {
      'uid': credential.uid,
      'email': credential.email,
      'displayName': credential.displayName,
      'photoURL': credential.photoURL,
      'emailVerified': credential.emailVerified,
      "password": password
    };
    return json;
  }
}
