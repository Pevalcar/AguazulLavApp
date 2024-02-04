import 'package:aguazullavapp/lib.dart';

class FetchFireUser {
  final IFirebaseAuthRepository firebaseAuthRepository;

  FetchFireUser(this.firebaseAuthRepository);

  Future<UserInformationModel?> call() async {
    return firebaseAuthRepository.fetchFireUser();
  }
}
