import 'package:movie_app/data/model/user_model.dart';
import 'package:movie_app/services/auth_services.dart';


class SignupViewModel {
  final AuthService _authService = AuthService();

  Future<UserModel?> signUp(String email, String password) async {
    return await _authService.signUpWithEmailPassword(email, password);
  }

  Future<UserModel?> signIn(String email, String password) async {
    return await _authService.signInWithEmailPassword(email, password);
  }

  Future<void> signOut() async {
    await _authService.signOut();
  }
}
