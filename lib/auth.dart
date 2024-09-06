import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserCredential> signInWithEmailAndPassword(
      String email, String password) async {
    return await _auth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> signOut() async {
    await _auth.signOut();

    await _clearSession();
  }

  Future<void> _clearSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('userUid');
  }

  Future<void> updateLastLogin(String uid) async {
    await _firestore
        .collection('users')
        .doc(uid)
        .update({'lastlogin': FieldValue.serverTimestamp()});
  }
}
