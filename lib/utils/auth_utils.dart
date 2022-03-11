import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class Auth {

  final FirebaseAuth authInstance;

  Auth({required this.authInstance});

  Future<String?> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser
        ?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    try {
      await authInstance.signInWithCredential(credential);
      return "Success";
    }on FirebaseAuthException catch(e){
      return e.code;
    }catch(e){
      return "Something went wrong";
    }
  }

  Future<String?> signInWithFacebook() async {
    try{
      // Trigger the sign-in flow
      final LoginResult loginResult = await FacebookAuth.instance.login();

      // Create a credential from the access token
      final OAuthCredential facebookAuthCredential = FacebookAuthProvider
          .credential(loginResult.accessToken!.token);

      // Once signed in, return the UserCredential
      await authInstance.signInWithCredential(facebookAuthCredential);
      return "Success";
    }on FirebaseAuthException catch(e){
      return e.code;
    }catch(e){
      return "Something went wrong";
    }
  }

  Future<String?> signInWithEmail(String email, String password) async {
    try {
      await authInstance.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      return "Success";
    }on FirebaseAuthException catch(e){
      return e.code;
    }
  }

  Future<String?> signUpWithEmail(String email, String password) async {
    try {
      await authInstance.createUserWithEmailAndPassword(
          email: email,
          password: password
      );
      // Send user id so user can be created by the backend.
      return "Success";
    }on FirebaseAuthException catch(e){
      return e.code;
    }
  }
}