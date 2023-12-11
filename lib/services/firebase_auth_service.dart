import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uasmobile/services/firestore_service.dart';

class FirebaseAuthService {
  FirebaseAuth _authService = FirebaseAuth.instance;

  Future<User?> signUpWithEmailandPassword(
      String email, password, BuildContext context) async {
    try {
      UserCredential credential = await _authService
          .createUserWithEmailAndPassword(email: email, password: password);

      User? user = credential.user;
      await FirestoreServices(uid: user!.uid).CreateUser(email);
      return credential.user;
    } catch (e) {
      final String errorMessage = e.toString();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMessage),
          backgroundColor: Colors.red,
        ),
      );
    }
    return null;
  }

  Future<User?> loginWithEmailandPassword(
      String email, password, BuildContext context) async {
    try {
      UserCredential credential = await _authService.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } catch (e) {
      final String errorMessage = e.toString();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMessage),
          backgroundColor: Colors.red,
        ),
      );
    }
    return null;
  }

  String? getCurrentUser() {
    try {
      User? user = _authService.currentUser;
      return user?.email;
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
