import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Google Sign-In
  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Trigger the Google Sign-In flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        // User canceled the sign-in
        return null;
      }

      // Obtain the auth details
      final GoogleSignInAuthentication googleAuth =
      await googleUser.authentication;

      if (googleAuth.accessToken == null || googleAuth.idToken == null) {
        throw FirebaseAuthException(
          code: 'ERROR_MISSING_GOOGLE_TOKENS',
          message: 'Missing Google Auth Tokens',
        );
      }

      // Create credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in with Firebase
      return await _auth.signInWithCredential(credential);
    } catch (e) {
      print("AuthServices Google Sign-In Error: $e");
      rethrow;
    }
  }

  /// Sign out from Firebase and Google
  Future<void> signOut() async {
    await _auth.signOut();
    await GoogleSignIn().signOut();
  }
}
