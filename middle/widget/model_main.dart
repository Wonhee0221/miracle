import 'package:cloud_firestore/cloud_firestore.dart';

class Main {
  final String title;
  final String keyword;
  final String poster;
  final String contents;
  final bool like;
  final bool check;
  final DocumentReference reference;

  Main.fromMap(Map<String, dynamic>? map, {required this.reference})
      : title = map!['title'],
        keyword = map['keyword'],
        poster = map['poster'],
        contents = map['contents'],
        check = map['check'],
        like = map['like'];

  Main.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot)
      :this.fromMap(snapshot.data(), reference: snapshot.reference);

  @override
  String toString() => "Main<$title:$keyword>";
}
