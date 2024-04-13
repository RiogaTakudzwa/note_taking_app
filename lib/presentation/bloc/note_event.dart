part of 'note_bloc.dart';

class NoteEvent {}

class AddNoteEvent extends NoteEvent{
  final NoteEntity note;

  AddNoteEvent({
    required this.note
  });
}

class FetchNotesEvent extends NoteEvent {}

class FetchNotesAfterAddingEvent extends NoteEvent {}

class UpdateNoteEvent extends NoteEvent {
  final NoteEntity note;

  UpdateNoteEvent({
    required this.note
  });
}

class DeleteNoteEvent extends NoteEvent {
  final NoteEntity note;

  DeleteNoteEvent({
    required this.note
  });
}