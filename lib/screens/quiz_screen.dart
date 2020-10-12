import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myfirstapp_flutter/model/modelquiz.dart';

class QuizScreen extends StatefulWidget {
  static String id = "quiz";
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  ModelQuiz quiz;
  List<Result> results;

  Future getDataQuiz() async {
    var response = await http.get("https://opentdb.com/api.php?amount=20");
    var item = jsonDecode(response.body);
    quiz = ModelQuiz.fromJson(item);
    return results = quiz.results;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz"),
      ),
      body: RefreshIndicator(
          child: FutureBuilder(
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Text("Press button to get data network");
                case ConnectionState.active:
                case ConnectionState.waiting:
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                case ConnectionState.done:
                  if (snapshot.hasError) return errorData(snapshot);
                  return getListQuiz();
                  break;
                default:
              }
            },
            future: getDataQuiz(),
          ),
          onRefresh: getDataQuiz),
    );
  }

  Widget getListQuiz() {
    return ListView.builder(
      itemBuilder: (context, index) {
        Result result = results[index];
        return Card(
          elevation: 7,
          child: ExpansionTile(
            title: Column(
              children: [
                Text(
                  result.question,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                FittedBox(
                  child: Row(
                    children: [
                      FilterChip(
                          backgroundColor: Colors.grey,
                          label: Text(result.category),
                          onSelected: (b) {}),
                      SizedBox(
                        width: 10,
                      ),
                      FilterChip(
                          backgroundColor: Colors.grey,
                          label: Text(result.difficulty),
                          onSelected: (b) {}),
                    ],
                  ),
                )
              ],
            ),
            leading: CircleAvatar(
              backgroundColor: Colors.grey[100],
              child: Text(result.type.startsWith("m") ? "M" : "B"),
            ),
            children: result.incorrectAnswers
                .map((e) => JawabanSoal(result, index, e))
                .toList(),
          ),
        );
      },
      itemCount: results.length,
    );
  }

  Widget errorData(AsyncSnapshot snapshot) {}
}

class JawabanSoal extends StatefulWidget {
  Result result;
  int index;
  String e;

  JawabanSoal(this.result, this.index, this.e);

  @override
  _JawabanSoalState createState() => _JawabanSoalState();
}

class _JawabanSoalState extends State<JawabanSoal> {
  Color warna = Colors.black;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        setState(() {
          if (widget.e == widget.result.correctAnswer) {
            warna = Colors.green;
          } else {
            warna = Colors.red;
          }
        });
      },
      title: Text(
        widget.e,
        textAlign: TextAlign.center,
        style: TextStyle(color: warna, fontWeight: FontWeight.bold),
      ),
    );
  }
}
