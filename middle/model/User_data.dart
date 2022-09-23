

import 'package:cloud_firestore/cloud_firestore.dart';

class Users {
  final String title;
  final String name;
  final String profile;
  final int carbonData;
  final DocumentReference reference;

  Users.fromMap(Map<String, dynamic>? map, {required this.reference})
      : title = map!['title'],
        name = map['name'],
        profile = map['profile'],
        carbonData = map['carbonData'];

  Users.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot)
      :this.fromMap(snapshot.data(), reference: snapshot.reference);

  @override
  String toString() => "Users<$title:$name>";
}