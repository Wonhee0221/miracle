import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';



class Todo {
  // 여기가 바뀝니다.
  String title;
 // late String image;
  late String carbon;
  Todo(this.title, this.carbon);
}

class TodoListPage extends StatefulWidget {
  const TodoListPage({Key? key}) : super(key: key);
  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  // 할 일 문자열 조작을 위한 컨트롤러
  final _todoController = TextEditingController();
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  File? _image;
  final picker = ImagePicker();


  Future getImage(ImageSource imageSource) async {
    final pickedXFile = await picker.pickImage(source: imageSource);

    setState(() {
      _image = XFile(pickedXFile!.path) as File?;
      setState(() {
        if (pickedXFile != null) {
          _image = File(pickedXFile.path);
         AddCarbon();
        } else {
          print('No image selected.');
        }


        });
    }
    );
  }
  Future uploadFile() async {
    if (_image == null) return;
    final fileName = basename(_image!.path);
    final destination = 'files/$fileName';

    try {
      final ref = firebase_storage.FirebaseStorage.instance
          .ref(destination)
          .child('file/');
      await ref.putFile(_image!);
    } catch (e) {
      print('error occured');
    }
  }

  Future Popmenu() async {

  }
  Future AddCarbon() async => FirebaseFirestore.instance
        .collection('todo')
        .add({'title': '삼겹살', 'carbon': '2 kgCO2e'});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('오늘 먹은 음식 탄소의 양은?'),backgroundColor: Colors.amber
        ),
        body:
        Padding(
          padding: const EdgeInsets.all(8.0),
          child:
          Container(
            child: Column(
              children: [
                StreamBuilder<QuerySnapshot>(
                    stream:
                    FirebaseFirestore.instance.collection('todo').snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const CircularProgressIndicator();
                      }
                      final documnets = snapshot.data!.docs;
                      return Expanded(
                        child: ListView(
                          children: documnets
                              .map((doc) => _buildItemWidget(doc))
                              .toList(),
                        ),
                      );
                    }),
              ],
            ),
          ),
        ),
        floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                foregroundColor: Colors.amber,
                child: const Icon(Icons.photo),
                onPressed: () {
                  getImage(ImageSource.gallery);
                  FirebaseFirestore.instance
                      .collection('todo')
                      .add({'title': '삼겹살', 'carbon': '2 kgCO2e'});
                },
              ),
              const SizedBox(
                height: 5,
              ),
              FloatingActionButton(
                  foregroundColor: Colors.amber,
                  child: const Icon(Icons.camera),
                  onPressed: () {
                    getImage(ImageSource.camera);
                    FirebaseFirestore.instance
                        .collection('todo')
                        .add({'title': '삼겹살', 'carbon': '2 kgCO2e'});

                  })

            ]));
  }

  Widget _buildItemWidget(DocumentSnapshot doc) {
    // 스냅샷 독을 이용합니다.
    final todo = Todo(doc['title'], doc['carbon']);
    return ListTile(
      title: Text(
          todo.title
      ),
      subtitle: Text(
        todo.carbon,
      ),
      trailing: IconButton(
        icon: const Icon(Icons.delete_forever),
        onPressed: () => _deleteTodo(doc),
      ),
    );
  }

  // 할 일 추가 메서드 : 파이어 스토어 버전
  void _addTodo(Todo todo) {
    FirebaseFirestore.instance
        .collection('todo')
        .add({'title': '삼겹살', 'carbon': '2 kgCO2e'});



    // 할 일 입력 필드를 피움
  }

  // 할 일 삭제 메서드 : 파이어 스토어 버전
  void _deleteTodo(DocumentSnapshot doc) {
    FirebaseFirestore.instance.collection('todo').doc(doc.id).delete();
  }

}



