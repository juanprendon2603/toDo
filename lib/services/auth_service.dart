import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthService with ChangeNotifier {
  // Extiende ChangeNotifier
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? _user;

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  User? get user => _user;

  Future<void> signUp({required String email, required String password}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      print("Error al registrarse: $e");
      throw e;
    }
  }

  Future<void> signIn({required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      print("Error al iniciar sesión: $e");
      throw e;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
