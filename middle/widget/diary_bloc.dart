import 'dart:async';

import 'package:carbon_fp/widget/diary.dart';
import 'package:carbon_fp/widget/db.dart';

class DiaryBloc {
  final _diaryController = StreamController<List<Diary>>.broadcast();

  get diarys => _diaryController.stream;

  DiaryBloc() {
    getDiarys();
  }

  dispose() {
    _diaryController.close();
  }

  getDiarys() async {
    _diaryController.sink.add(await DBHelper().getAllDiarys());
  }

  addDiarys(Diary diary) async {
    await DBHelper().createData(diary);
    getDiarys();
  }

  deleteDiary(int id) async {
    await DBHelper().deleteDiary(id);
    getDiarys();
  }

  deleteAll() async {
    await DBHelper().deleteAllDiarys();
    getDiarys();
  }
}
