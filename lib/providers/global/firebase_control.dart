import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'firebase_control.g.dart';

const List<String> scopes = <String>[
  'email',
  'https://www.googleapis.com/auth/contacts.readonly',
];
GoogleSignIn _googleSignIn = GoogleSignIn(
  // Optional clientId
  // clientId: 'your-client_id.apps.googleusercontent.com',
  scopes: scopes,
);

@riverpod
class FirebaseControl extends _$FirebaseControl {
  Future<User?> _fetch() async {
    return FirebaseAuth.instance.currentUser;
  }

  @override
  Future<User?> build() {
    return _fetch();
  }

  void login(String email, String password) async {
    state = AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      final credenciales = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return credenciales.user;
    });
  }

  void register(String email, String password) async {
    state = AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final credenciales = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return credenciales.user;
    });
  }

  void forgot(String email) async {
    state = AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      //TODO create new user in firebase firestore
      
      return null;
    });
  }

  void signInWithGoogle() async {
    // Trigger the authentication flow
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      // Obtain the auth details from the request
      if (kIsWeb && FirebaseAuth.instance.currentUser != null) {
        await _googleSignIn.canAccessScopes(scopes);
        return _fetch();
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
            await FirebaseAuth.instance.signInWithCredential(credential);
        return credenciales.user;
      }
    });
  }

  Future<void> signOut() async {
    FirebaseAuth.instance.signOut();
    state = const AsyncValue.data(null);
  }
}
