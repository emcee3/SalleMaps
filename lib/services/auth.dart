import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:salle_maps/services/globals.dart';

class AuthService {
  Future<String> signUp(String email, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print("REGISTER SUCCESS!");
      return Global.signUpSuccess;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        return Global.signUpErrorPassword;
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        return Global.signUpErrorEmail;
      }
    } catch (e) {
      print(e);
    }
    return Global.signUpError;
  }

  Future<UserCredential> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print("LOGIN SUCCESS!");
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

/*  /// Sign in with Google
    //TODO: https://firebase.flutter.dev/docs/auth/social
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    // Create a new credential
    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await _auth.signInWithCredential(credential);
  }*/

  /// Sign out
  Future<void> signOut() {
    return FirebaseAuth.instance.signOut();
  }
}