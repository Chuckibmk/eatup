import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  // Singleton instance
  static final FirebaseService _instance = FirebaseService._internal();

  // Factory constructor to return the singleton instance
  factory FirebaseService() {
    return _instance;
  }

  // Internal constructor
  FirebaseService._internal();

  // FirebaseAuth instance
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;

  // FirebaseFirestore instance
  FirebaseFirestore get firebaseFirestore => FirebaseFirestore.instance;
}
