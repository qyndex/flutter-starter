import 'package:supabase_flutter/supabase_flutter.dart';
import 'supabase_service.dart';

class AuthService {
  /// Sign up with email and password.
  /// Optionally pass [fullName] to store in user metadata.
  Future<AuthResponse> signUp({
    required String email,
    required String password,
    String? fullName,
  }) {
    return supabase.auth.signUp(
      email: email,
      password: password,
      data: fullName != null ? {'full_name': fullName} : null,
    );
  }

  /// Sign in with email and password.
  Future<AuthResponse> signIn({
    required String email,
    required String password,
  }) {
    return supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }

  /// Sign out the current user.
  Future<void> signOut() {
    return supabase.auth.signOut();
  }

  /// The currently signed-in user, or null.
  User? get currentUser => supabase.auth.currentUser;

  /// Stream of auth state changes.
  Stream<AuthState> get onAuthStateChange =>
      supabase.auth.onAuthStateChange;
}
