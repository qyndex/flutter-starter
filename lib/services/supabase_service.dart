import 'package:supabase_flutter/supabase_flutter.dart';

/// Convenience accessor for the Supabase client singleton.
/// Must call [Supabase.initialize] in main() before using.
SupabaseClient get supabase => Supabase.instance.client;
