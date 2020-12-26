import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/nepalCases.dart';
import '../../utils/cap.dart';

class AffectedDetails extends StatelessWidget {
  final Data affected;
  AffectedDetails({this.affected});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text("Reported On: ",
                  style: Theme.of(context).textTheme.subtitle1),
              Text(
                  (affected.reportedOn != null)
                      ? DateFormat("MMMM d, y").format(
                          DateTime.parse(affected.reportedOn.toString()))
                      : "---",
                  style: Theme.of(context).textTheme.subtitle1.copyWith(
                      fontSize: 16,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: <Widget>[
              Text('Case Id: ', style: Theme.of(context).textTheme.subtitle1),
              Hero(
                  tag: affected.id,
                  transitionOnUserGestures: true,
                  child: Material(
                      type: MaterialType.transparency,
                      child: Text(affected.label,
                          style: Theme.of(context).textTheme.subtitle1.copyWith(
                              fontSize: 16,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.bold)))),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: <Widget>[
              Text('Name: ', style: Theme.of(context).textTheme.subtitle1),
              Text('Not disclosed',
                  style: Theme.of(context).textTheme.subtitle1.copyWith(
                      fontSize: 16,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.bold))
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text('Gender: ',
                      style: Theme.of(context).textTheme.subtitle1),
                  Text(affected.gender.cap(),
                      style: Theme.of(context).textTheme.subtitle1.copyWith(
                          fontSize: 16,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(width: 20),
              Row(
                children: <Widget>[
                  Text('Age: ', style: Theme.of(context).textTheme.subtitle1),
                  Text(affected.age.toString(),
                      style: Theme.of(context).textTheme.subtitle1.copyWith(
                          fontSize: 16,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.bold)),
                ],
              )
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: <Widget>[
              Text('Case Status: ',
                  style: Theme.of(context).textTheme.subtitle1),
              Text(affected.currentState.toString().cap(),
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      .copyWith(
                          fontSize: 16,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.bold)
                      .copyWith(
                          color: affected.currentState.toString() == "recovered"
                              ? Colors.green
                              : Colors.orange)),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
