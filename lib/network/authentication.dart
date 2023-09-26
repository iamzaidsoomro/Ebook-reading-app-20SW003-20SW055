import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Authentication {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<User?> signIn(
      {required String email, required String password}) async {
    try {
      final UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final User? user = userCredential.user;
      return user;
    } on FirebaseAuthException catch (e) {
      return null;
    }
  }

  Future<String?> signUp(
      {required String email,
      required String password,
      required String username}) async {
    try {
      final UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) {
        User? user;
        user = value.user;
        user!.sendEmailVerification();
        user.updateDisplayName(username);
        _firebaseFirestore.collection('users').doc(user.email).set({
          'email': email,
          'password': password,
          'uid': user.uid,
          'name': user.displayName
        });
        return value;
      });
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
