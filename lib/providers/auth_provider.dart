import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../services/auth_service.dart';

/// Provides the [AuthService] singleton.
final authServiceProvider = Provider<AuthService>((ref) => AuthService());

/// Streams auth state changes. Emits the current [User] or null.
final authStateProvider = StreamProvider<User?>((ref) {
  final authService = ref.watch(authServiceProvider);
  // Seed with current user, then stream changes
  final controller = StreamController<User?>();
  controller.add(authService.currentUser);
  final subscription = authService.onAuthStateChange.listen((state) {
    controller.add(state.session?.user);
  });
  ref.onDispose(() {
    subscription.cancel();
    controller.close();
  });
  return controller.stream;
});
