import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SignInRepository {
  bool getIsLoggedIn();
  Future<void> saveIsLoggedIn(bool isLoggedIn);
  Future<UserCredential> signInWithEmail(String email, String password);
  Future<UserCredential> signInWithGoogle();
}

class SignInRepositoryImpl implements SignInRepository {
  const SignInRepositoryImpl(this._firebaseAuth, this._sharedPreferencesClient);

  final FirebaseAuth _firebaseAuth;
  final SharedPreferences _sharedPreferencesClient;

  @override
  bool getIsLoggedIn() {
    return _sharedPreferencesClient.getBool('isLoggedIn') ?? false;
  }

  @override
  Future<void> saveIsLoggedIn(bool isLoggedIn) {
    return _sharedPreferencesClient.setBool('isLoggedIn', isLoggedIn);
  }

  @override
  Future<UserCredential> signInWithEmail(String email, String password) async {
    try {
      final result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
    await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

}
