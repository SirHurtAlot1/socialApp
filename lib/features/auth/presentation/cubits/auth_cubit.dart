import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_network/features/auth/domain/entities/app_user.dart';
import 'package:social_network/features/auth/domain/repos/auth_repo.dart';
import 'package:social_network/features/auth/presentation/cubits/auth_states.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo authRepo;
  AppUser? _currentUser;

  AuthCubit({required this.authRepo}) : super(AuthInitial());

  //get current user
  AppUser? get currentUser => _currentUser;

  //check if user already auth
  void checkAuth() async {
    final AppUser? user = await authRepo.getCurrentUser();

    if (user != null) {
      _currentUser = user;
      emit(Authenticated(user: user));
    } else {
      emit(Unauthenticated());
    }
  }

  //login with email and password
  Future<void> loginWithEmailAndPassword(String email, String password) async{
    try {

      emit(AuthLoading());
      AppUser? user = await  authRepo.loginWithEmailAndPassword(email, password);

      if (user != null) {
        _currentUser = user;
        emit(Authenticated(user: user));
        
      } else {
        emit(Unauthenticated());
      }
    } catch (error) {
      emit(AuthError(error: error.toString()));
      emit(Unauthenticated());
    }
  }


  //register with email and password
   Future<void> registerWithEmailAndPassword(String name, String email, String password) async{
    try {

      emit(AuthLoading());
      AppUser? user = await  authRepo.registerWithEmailAndPassword(name, email, password);

      if (user != null) {
        _currentUser = user;
        emit(Authenticated(user: user));
        
      } else {
        emit(Unauthenticated());
      }
    } catch (error) {
      emit(AuthError(error: error.toString()));
      emit(Unauthenticated());
    }
  }

  //logout
  Future<void> logout() async{
    authRepo.logout();
    emit(Unauthenticated());

  }
}
