import 'package:dartz/dartz.dart';
import 'package:note_taking_app/domain/entities/note_entity.dart';
import 'package:note_taking_app/domain/repositories/note_repository.dart';

import '../failures/failures.dart';

class FetchNote {
  final NoteRepository repository;
  FetchNote(this.repository);
  Future<Either<Failure, List<NoteEntity>>> execute() => repository.fetchNotes();
}

class AddNote {
  final NoteRepository repository;
  AddNote(this.repository);
  Future<Either<Failure, NoteEntity>> execute(NoteEntity note) => repository.addNote(note);
}