import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/profile.dart';
import '../services/profile_service.dart';

/// Provides the [ProfileService] singleton.
final profileServiceProvider = Provider<ProfileService>((ref) => ProfileService());

/// Async provider that fetches the current user's profile.
/// Call `ref.invalidate(profileProvider)` after mutations to refresh.
final profileProvider = FutureProvider<Profile?>((ref) {
  final service = ref.watch(profileServiceProvider);
  return service.fetchProfile();
});
