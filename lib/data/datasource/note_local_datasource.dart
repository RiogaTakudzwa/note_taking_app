import 'package:note_taking_app/data/datasource/local_data/database_helper.dart';

import '../models/note_model.dart';

abstract class NoteLocalDatasource{
  Future<NoteModel> add(NoteModel note);
}

class NoteLocalDatasourceImplementation implements NoteLocalDatasource{
  final DatabaseHelper databaseHelper = DatabaseHelper.instance;

  @override
  Future<NoteModel> add(NoteModel note) => databaseHelper.add(note);
}