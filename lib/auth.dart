import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationService {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseStore = FirebaseFirestore.instance;

  Future<void> signOut() async {
    await firebaseAuth.signOut();

    await _clearSession();
  }

  Future<void> _clearSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('userUid');
  }

  Future<void> updateLastLogin(String uid) async {
    await firebaseStore
        .collection('users')
        .doc(uid)
        .update({'lastlogin': FieldValue.serverTimestamp()});
  }

  void checkFirebaseConnection() {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      print('Firebase is connected. User is signed in as ${user.email}.');
    } else {
      print('Firebase is connected, but no user is signed in.');
    }
  }
}
