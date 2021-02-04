import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:salle_maps/services/globals.dart';

class AuthService {
  final FirebaseAuth _auth;

  AuthService(this._auth);

  Stream<User> get authState => _auth.authStateChanges();

  Future<String> signUp(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Global.signUpSuccess;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return Global.signUpErrorPassword;
      } else if (e.code == 'email-already-in-use') {
        return Global.signUpErrorEmail;
      }
    } catch (e) {
      print(e);
    }
    return Global.signUpError;
  }

  Future<UserCredential> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      return null;
    }
  }

  /// Sign in with Google
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<String> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return Global.sendSuccess;
    } on FirebaseAuthException catch (e) {
      if (e.code == Global.invalidEmailError) {
        print('Invalid email.');
      } else if (e.code == Global.userNotFoundError) {
        print('No user found for that email.');
      }
      return e.code;
    }
  }

  /// Sign out
  Future<void> signOut() {
    return _auth.signOut();
  }
}
