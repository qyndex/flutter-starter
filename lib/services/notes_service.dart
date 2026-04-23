import '../models/note.dart';
import 'supabase_service.dart';

class NotesService {
  /// Fetch all notes for the current user, pinned first then newest first.
  Future<List<Note>> fetchNotes() async {
    final data = await supabase
        .from('notes')
        .select()
        .order('is_pinned', ascending: false)
        .order('updated_at', ascending: false);
    return (data as List).map((e) => Note.fromMap(e as Map<String, dynamic>)).toList();
  }

  /// Create a new note. Returns the inserted note.
  Future<Note> createNote({
    required String userId,
    required String title,
    String content = '',
  }) async {
    final data = await supabase.from('notes').insert({
      'user_id': userId,
      'title': title,
      'content': content,
    }).select().single();
    return Note.fromMap(data);
  }

  /// Update an existing note. Returns the updated note.
  Future<Note> updateNote(Note note) async {
    final data = await supabase
        .from('notes')
        .update(note.toUpdateMap())
        .eq('id', note.id)
        .select()
        .single();
    return Note.fromMap(data);
  }

  /// Toggle the pinned state of a note. Returns the updated note.
  Future<Note> togglePin(Note note) async {
    final data = await supabase
        .from('notes')
        .update({'is_pinned': !note.isPinned})
        .eq('id', note.id)
        .select()
        .single();
    return Note.fromMap(data);
  }

  /// Delete a note by ID.
  Future<void> deleteNote(String id) async {
    await supabase.from('notes').delete().eq('id', id);
  }
}
