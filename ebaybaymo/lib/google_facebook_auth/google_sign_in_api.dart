import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInApi {
  static final _googleSignIn = GoogleSignIn();

  static Future<GoogleSignInAccount?> login() async {
    try {
      return await _googleSignIn.signIn();
    } catch (e) {
      print('Error during Google Sign-In: $e');
      return null;
    }
  }

  static Future<void> logout() async {
    try {
      await _googleSignIn.disconnect();
    } catch (e) {
      print('Error during Google Sign-Out: $e');
    }
  }

  static Future<bool> isSignedIn() async {
    try {
      return await _googleSignIn.isSignedIn();
    } catch (e) {
      print('Error checking sign-in status: $e');
      return false;
    }
  }

  static Future<GoogleSignInAccount?> getCurrentUser() async {
    try {
      return await _googleSignIn.signInSilently();
    } catch (e) {
      print('Error getting current user silently: $e');
      return null;
    }
  }
}
