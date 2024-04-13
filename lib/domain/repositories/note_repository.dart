import 'package:dartz/dartz.dart';
import 'package:note_taking_app/domain/entities/note_entity.dart';
import 'package:note_taking_app/domain/failures/failures.dart';

abstract class NoteRepository{
  Future<Either<Failure, NoteEntity>> addNote(NoteEntity note);
  Future<Either<Failure, List<NoteEntity>>> fetchNotes();
}