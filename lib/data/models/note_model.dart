import 'package:equatable/equatable.dart';

import '../../domain/entities/note_entity.dart';

class NoteModel extends Equatable{
  int id;
  final String title;
  final String text;
  final DateTime date;

  NoteModel({
    required this.id,
    required this.title,
    required this.text,
    required this.date,
  });

  factory NoteModel.fromJson(Map<String, dynamic> json) => NoteModel(
    id: json['id'],
    title: json['title'],
    text: json['text'],
    date: DateTime.fromMillisecondsSinceEpoch(json['date']),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'text': text,
    'date': date.millisecondsSinceEpoch,
  };

  factory NoteModel.fromEntity(NoteEntity entity) {
    return NoteModel(
      id: entity.id,
      title: entity.title,
      text: entity.text,
      date: entity.date,
    );
  }

  NoteEntity toEntity() {
    return NoteEntity(
      id: id,
      title: title,
      text: text,
      date: date,
    );
  }

  @override
  List<Object?> get props => [
    id,
    title,
    text,
    date,
  ];

}