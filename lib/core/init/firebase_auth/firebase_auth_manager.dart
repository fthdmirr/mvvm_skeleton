import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthManager {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signUpEmailPassword(
      String email, String password) async {
    try {
      return (await _auth.createUserWithEmailAndPassword(
          email: email, password: password)).user;
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return null;
    }
  }

  Future<User?> signInWithEmailPassword(
      String email, String password) async {
    try {
      return (await _auth.signInWithEmailAndPassword(
          email: email, password: password)).user;
    } on FirebaseAuthException catch (e) {
      print(e.message);
            return null;

    }
  }

  Future<User?> signInAnonymously() async {
    try {
      return (await _auth.signInAnonymously()).user;
    } on FirebaseAuthException catch (e) {
      print(e.message);
            return null;

    }
  }

  Future<User?> signInWithGoogle() async {
    try {
      final googleUser = (await GoogleSignIn().signIn())!;

      final googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      return (await FirebaseAuth.instance.signInWithCredential(credential)).user;
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return null;
    }
  }

  
  bool isUserLogin() {
    final _user = _auth.currentUser;
    
    return _user != null ? true : false;
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
      await GoogleSignIn.standard().signOut();
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }

//VİEW MODELDE YAPILACAKLAR
  
  /*
  Future<void> sendUserEmailVerify() async {
    final _user = _auth.currentUser;

    try {
      if (!_user!.emailVerified) {
        await _user.sendEmailVerification();
      }
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }

//TODO
  Future<void> changePassword(
      String email, String password, String newPassword) async {
    try {
      final _user = await reAuthenticaton(email, password);
      if (_user != null) {
        await _auth.currentUser!.updatePassword(newPassword);
      }
    } catch (e) {
      print(e);
    }
  }

//TODO ??
  Future<void> deleteUser(String email, String password) async {
    try {
      final _user = await reAuthenticaton(email, password);
      if (_user != null) {
        await FirebaseAuth.instance.currentUser!.delete();
      }
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

//TODO
  Future<User?> reAuthenticaton(String email, String password) async {
    var credential =
        EmailAuthProvider.credential(email: email, password: password);

    final _user = (await FirebaseAuth.instance.currentUser!
            .reauthenticateWithCredential(credential))
        .user;
    return _user;
  }


  userLocation(User user) {
    final isLogin = isUserLogin();

    //TODO: navigate işlemi yapılacak
  }
  */
}
