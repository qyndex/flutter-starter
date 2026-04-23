import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/note.dart';
import '../services/notes_service.dart';

/// Provides the [NotesService] singleton.
final notesServiceProvider = Provider<NotesService>((ref) => NotesService());

/// Async provider that fetches the current user's notes.
/// Call `ref.invalidate(notesProvider)` after mutations to refresh.
final notesProvider = FutureProvider<List<Note>>((ref) {
  final service = ref.watch(notesServiceProvider);
  return service.fetchNotes();
});
