import 'package:corona_nepal/screens/quiz/quiz_screen.dart';
import 'package:corona_nepal/utils/disclaimer.dart';
import 'package:flutter/material.dart';

class QuizStart extends StatefulWidget {
  @override
  _QuizStartState createState() => _QuizStartState();
}

class _QuizStartState extends State<QuizStart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Covid-19 Test"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Disclaimer",
              style: Theme.of(context).textTheme.display1,
            ),
            SizedBox(height: 20),
            Text(test),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => QuizPage()));
              },
              child: Container(
                height: 40,
                width: MediaQuery.of(context).size.width / 2,
                child: Material(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).primaryColor,
                  child: Center(
                    child: Text(
                      'Start',
                      style: Theme.of(context)
                          .primaryTextTheme
                          .headline
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



