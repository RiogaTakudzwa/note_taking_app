import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/note_entity.dart';
import '../../domain/usecases/note_usecases.dart';

part 'note_event.dart';
part 'note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  final FetchNote fetchNotes;
  final AddNote addNotes;

  NoteBloc(
      this.addNotes,
      this.fetchNotes
  ) : super(const NoteState(
      notes: [],
      errorState: false
  )) {
    on<AddNoteEvent>(_onAddNotes);
    on<FetchNotesAfterAddingEvent>(_onFetchNOtesAfterAddingEvent);
  }

  _onFetchNOtesAfterAddingEvent(event, emit) async {
    try {
      final result = await fetchNotes.execute();

      result.fold(
          (failure) => emit(NoteErrorState(failure.message)),
          (notes) {
          if (notes.isEmpty) {
            emit(NoteEmptyState());
          } else {
            emit(LoadedNoteAfterAddingState(notes));
          }
        },
      );
    } catch (e) {
      emit(NoteErrorState('Error loading notes: $e'));
    }
  }

  _onAddNotes(event, emit) async {
    try{
      final result = await addNotes.execute(event.note);
      result.fold(
        (failure) => emit(NoteErrorState(failure.message)),
          (note) => add(FetchNotesAfterAddingEvent()),
        }
      );
    }catch (e){

    }
  }
}
