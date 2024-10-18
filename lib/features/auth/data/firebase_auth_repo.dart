/*

future me check this to make it again
https://firebase.google.com/docs/flutter/setup?hl=ru&platform=ios


*/

import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_network/features/auth/domain/entities/app_user.dart';
import 'package:social_network/features/auth/domain/repos/auth_repo.dart';

class FirebaseAuthRepo implements AuthRepo {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  Future<AppUser?> getCurrentUser() async{
    final user = firebaseAuth.currentUser;
    if (user == null) {
      return null;
    }

    return AppUser(uid: user.uid, email: user.email!, name: '');

  }

  @override
  Future<AppUser?> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      //gets user data from firebaseAuth
      UserCredential userCredential =
          await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      //create user
      AppUser user = AppUser(
        uid: userCredential.user!.uid,
        email: email,
        name: '',
      );

      return user;
    } catch (error) {
      throw Exception('Login failed: $error');
    }
  }

  @override
  Future<void> logout() async{
    firebaseAuth.signOut();
    
  }

  @override
  Future<AppUser?> registerWithEmailAndPassword(
      String name, String email, String password) async {
    try {
      //creates new user data in firebase using email and password
      UserCredential userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);

      //create user
      AppUser user = AppUser(
        uid: userCredential.user!.uid,
        email: email,
        name: name,
      );

      return user;
    } catch (error) {
      throw Exception('Registration failed: $error');
    }
  }
}
