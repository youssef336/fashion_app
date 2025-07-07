import 'package:fashion/core/services/main/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService implements AuthService {
  final auth = FirebaseAuth.instance;
  late User clinet;
  @override
  Future<User> loginUser(String email, String password) async {
    try {
      final credential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      clinet = credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
    return clinet;
  }
}
