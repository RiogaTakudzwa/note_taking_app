import 'package:dartz/dartz.dart';
import 'package:note_taking_app/data/datasource/note_local_datasource.dart';
import 'package:note_taking_app/domain/entities/note_entity.dart';
import 'package:note_taking_app/domain/exceptions/exceptions.dart';
import 'package:note_taking_app/domain/failures/failures.dart';
import 'package:note_taking_app/domain/repositories/note_repository.dart';

import '../models/note_model.dart';

class NoteRepositoryImplementation implements NoteRepository{
  final NoteLocalDatasource noteLocalDatasource;

  NoteRepositoryImplementation({
    required this.noteLocalDatasource
  });

  @override
  Future<Either<Failure, NoteEntity>> addNote(NoteEntity note) async{
    try{
      final noteToInsertIntoDB = NoteModel.fromEntity(note);
      await noteLocalDatasource.add(noteToInsertIntoDB);
      return Right(note);
    }on DatabaseException catch (e){
      return Left(DatabaseFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<NoteEntity>>> fetchNotes() async{
    // TODO: implement fetchNotes
    throw UnimplementedError();
  }


}