import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _google = GoogleSignIn();

  Stream<User> get user {
    return _auth.authStateChanges();
  }

  Future comeInWithGoogle() async {
    GoogleSignInAccount account = await _google.signIn();
    if (account != null) {
      GoogleSignInAuthentication authentication = await account.authentication;
      AuthCredential credentials = GoogleAuthProvider.credential(
          idToken: authentication.idToken,
          accessToken: authentication.accessToken);

      UserCredential result = await _auth.signInWithCredential(credentials);
      User user = await _auth.currentUser;
    }

    return account.photoUrl;
  }

  //with email and password
  Future signWithEmailaPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future regWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signOut() async {
    User user = await _auth.currentUser;
    if (user.providerData[0].providerId == 'google.com') {
      await _google.disconnect();
    }
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e);
      return null;
    }
  }
}
