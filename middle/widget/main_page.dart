import 'package:carbon_fp/widget/diary.dart';
import 'package:intl/intl.dart';
import 'package:carbon_fp/widget/diary_bloc.dart';
import 'package:carbon_fp/widget/db.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:toast/toast.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

final bloc = DiaryBloc();

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: PlatformScaffold(
        iosContentPadding: true,
        iosContentBottomPadding: true,
        material: (context, platform) => MaterialScaffoldData(
          floatingActionButton: FloatingActionButton(
            onPressed: () => _showAddDialog(context),
            child: Icon(Icons.add),backgroundColor: Colors.amber,
          ),
        ),
        cupertino: (context, platform) => CupertinoPageScaffoldData(
          resizeToAvoidBottomInset: true,
        ),
        appBar: PlatformAppBar(backgroundColor: Colors.amber,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/m_logo.png',
                fit: BoxFit.contain,
                height: 60,
              ),
            ],
          ),
          cupertino: (context, platform) => CupertinoNavigationBarData(
            // ios NavigatonBar Button
            transitionBetweenRoutes: false,
            trailing: PlatformTextButton(
              padding: EdgeInsets.all(4.0),
              child: Icon(
                Icons.add,
                color: Colors.black,
              ),
              onPressed: () => _showAddDialog(context),
            ),
          ),
        ),
        body: _body(),
      ),
    );
  }

  Widget _body() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 5.0),
          child: PlatformText(
            '<???????????????>',
            style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Expanded(
          child: FutureBuilder(
            future: DBHelper().getAllDiarys(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return SizedBox(
                  height: 200.0,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      var item = snapshot.data[index];
                      return Dismissible(
                        key: UniqueKey(),
                        child: _diaryListItem(item),
                        onDismissed: (direction) {
                          DBHelper().deleteDiary(index);
                          setState(() {});
                        },
                      );
                    },
                  ),
                );
              } else {
                return PlatformText('???????????? ????????? ????????????\n????????? ?????????????????? :D');
              }
            },
          ),
        ),
      ],
    );
  }

  Widget _diaryListItem(Diary diary) {
    return InkWell(
      onTap: () => _showDiary(diary),
      child: Container(
        margin: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Colors.black),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(10, 8, 8, 8),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PlatformText(
                      diary.title,
                      style: TextStyle(fontSize: 18.0),
                    ),
                    PlatformText(
                      diary.uploadDate,
                      style: TextStyle(fontSize: 13.0),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showAddDialog(BuildContext context) {
    var titleTextController = TextEditingController();
    var contentTextController = TextEditingController();

    var maxLines = 10;

    showPlatformDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)), //this right here
          child: Container(
            height: maxLines * 40.0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 15.0),
                      child: PlatformText(
                        '?????? ??????',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: PlatformTextField(
                        controller: titleTextController,
                        material: (context, platform) => MaterialTextFieldData(
                          decoration: InputDecoration(
                              alignLabelWithHint: true, hintText: '??????'),
                        ),
                        cupertino: (context, platform) =>
                            CupertinoTextFieldData(placeholder: '??????'),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: PlatformTextField(
                        controller: contentTextController,
                        keyboardType: TextInputType.multiline,
                        maxLines: 10,
                      ),
                    ),
                    SizedBox(
                      width: 320.0,
                      child: PlatformTextButton(
                        color: const Color(0xFF1BC0C5),
                        child: PlatformText(
                          "??????????????? ??????",
                          style: TextStyle(color: Colors.amber),
                        ),
                        onPressed: () {
                          if (contentTextController.text == '' ||
                              titleTextController.text == '') {
                            Toast.show('???????????? ?????? ????????? ????????????.');
                          } else {
                            writeDiary(titleTextController.text,
                                contentTextController.text);
                            Navigator.pop(context);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _showDiary(Diary diary) {
    showPlatformDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Container(
            height: 300.0,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: PlatformText(
                    diary.title,
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                Container(
                  height: 200.0,
                  width: double.infinity,
                  margin: EdgeInsets.all(8.0),
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xFF1BC0C5),
                    ),
                  ),
                  child: PlatformText(
                    diary.content,
                    style: TextStyle(fontSize: 12.0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      PlatformText(
                        'by ${diary.uploadDate}',
                        style: TextStyle(fontSize: 8.0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void writeDiary(String title, String contnent) {
    var now = DateTime.now();
    String nowDate = DateFormat('yyyy-MM-dd').format(now);

    Diary diary = Diary(
      title: title,
      content: contnent,
      uploadDate: nowDate,
      id: null,
    );
    bloc.addDiarys(diary);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    DBHelper().getAllDiarys().then((value) => value.forEach((element) {
      print(element.content);
    }));
  }
}
