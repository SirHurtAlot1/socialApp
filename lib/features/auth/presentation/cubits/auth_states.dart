/*

All states for auth proccess

*/


import 'package:social_network/features/auth/domain/entities/app_user.dart';

abstract class AuthState{}


//initital
class AuthInitial extends AuthState{}


//loading
class AuthLoading extends AuthState{}


//authenticated
class Authenticated extends AuthState{
  final AppUser user;

  Authenticated({required this.user});
}

//unauthenticated
class Unauthenticated extends AuthState{}


//errors
class AuthError extends AuthState{
  final String error;

  AuthError({required this.error});
}