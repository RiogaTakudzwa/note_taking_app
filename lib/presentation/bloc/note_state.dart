part of 'note_bloc.dart';

class NoteState extends Equatable{
  final List<NoteEntity> notes;
  final bool errorState;

  const NoteState({
    required this.notes,
    required this.errorState,
  });

  @override
  List<Object> get props => [notes, errorState];

}

class FetchNoteState extends NoteState {
  const FetchNoteState(
    List<NoteEntity> notes,
    bool errorState,
  ):super(
    notes: notes,
    errorState: errorState
  );

  @override
  List<Object> get props => [notes, errorState];
}

class NoteErrorState extends NoteState {
  const NoteErrorState(
    List<NoteEntity> notes,
    bool errorState,
  ):super(
    notes: notes,
    errorState: errorState
  );

  @override
  List<Object> get props => [notes, errorState];
}
