import 'package:aguazullavapp/lib.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers_login.g.dart';

const List<String> scopes = <String>[
  'email',
  'https://www.googleapis.com/auth/contacts.readonly',
];
GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: scopes,
);

@riverpod
LoginUser loginUser(LoginUserRef ref) {
  final firebaseAuthRepository = ref.watch(authFireRepoProvider);
  return LoginUser(firebaseAuthRepository);
}

@riverpod
ForgotUser forgotUser(ForgotUserRef ref) {
  final firebaseAuthRepository = ref.watch(authFireRepoProvider);
  return ForgotUser(firebaseAuthRepository);
}

@riverpod
RegisterUser registerUser(RegisterUserRef ref) {
  final firebaseAuthRepository = ref.watch(authFireRepoProvider);
  return RegisterUser(firebaseAuthRepository);
}

@riverpod
GoogleSignInUser googleSignInUser(GoogleSignInUserRef ref) {
  final firebaseAuthRepository = ref.watch(authFireRepoProvider);
  return GoogleSignInUser(firebaseAuthRepository);
}

@riverpod
LoginOutUser loginOutUser(LoginOutUserRef ref) {
  final firebaseAuthRepository = ref.watch(authFireRepoProvider);
  return LoginOutUser(firebaseAuthRepository);
}

@riverpod
FetchFireUser fetchFireUser(FetchFireUserRef ref) {
  final firebaseAuthRepository = ref.watch(authFireRepoProvider);
  return FetchFireUser(firebaseAuthRepository);
}

//TODO cache user control impleemntar control de base de datos cache
// @riverpod
// SaveUserData saveCahceUserDAta(SaveCahceUserDAtaRef ref) {
//   final userCacheRepo = ref.watch(UserCacheRepositoryImplProvider);
//   return  SaveUserData(userCacheRepo);
// }

@riverpod
class UserStateCurrent extends _$UserStateCurrent {
  @override
  FutureOr<UserInformationModel?> build() {
    return _fetch();
  }

  Future<UserInformationModel?> _fetch(){
    return ref.watch(fetchFireUserProvider).call();
  }


  void login(String email, String password) async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      return await ref.read(loginUserProvider).call(email, password);

    });
  }

  void register(String email, String password) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      return await ref.read(registerUserProvider).call(email, password);
    });
  }

  void forgot(String email) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref.read(forgotUserProvider).call(email);
      return null;
    });
  }

  void signInWithGoogle() async {
    // Trigger the authentication flow
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      // Obtain the auth details from the request
      //TODO cambiar provehedor de datosUsuario
      if (kIsWeb && ref.watch(fireAuthInstanceProvider).currentUser != null) {
        await _googleSignIn.canAccessScopes(scopes);
        return null;
      } else {
        final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

        // Obtain the auth details from the request
        final GoogleSignInAuthentication? googleAuth =
            await googleUser?.authentication;

        // Create a new credential
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );

        // Once signed in, return the UserCredential
        final credenciales =
            await ref.read(googleSignInUserProvider).call(credential);
        return credenciales;
      }
    });
  }

  void signOut() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref.read(loginOutUserProvider).call();
      await _googleSignIn.signOut();
      return null;
    });
  }
}

@riverpod
class ShowPass extends _$ShowPass {
  @override
  bool build() {
    return true;
  }

  void toggle() {
    state = !state;
  }
}

enum screensMode { login, register, forgot }

@riverpod
class ScreensMode extends _$ScreensMode {
  @override
  screensMode build() {
    return screensMode.login;
  }

  void toggle(screensMode mode) {
    state = mode;
  }
}
