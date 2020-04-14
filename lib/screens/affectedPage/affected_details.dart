import 'package:corona_nepal/models/districtData.dart';
import 'package:corona_nepal/models/nepalCases.dart';
import 'package:flutter/material.dart';
import 'package:corona_nepal/screens/hospital/map.dart';
import 'package:intl/intl.dart';
import 'package:corona_nepal/utils/cap.dart';

class AffectedDetails extends StatelessWidget {
  final markers;
  final Key _mapKey = UniqueKey();
  final Data affected;
  AffectedDetails({this.affected, this.markers});
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
              Text("Reported On: ", style: Theme.of(context).textTheme.subhead),
              Text(
                  DateFormat("MMMM d, y")
                      .format(DateTime.parse(affected.reportedOn)),
                  style: Theme.of(context).textTheme.title.copyWith(
                      fontSize: 16,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: <Widget>[
              Text('Case Id: ', style: Theme.of(context).textTheme.subhead),
              Hero(
                  tag: affected.id,
                  transitionOnUserGestures: true,
                  child: Material(
                      type: MaterialType.transparency,
                      child: Text(affected.label,
                          style: Theme.of(context).textTheme.title.copyWith(
                              fontSize: 16,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.bold)))),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: <Widget>[
              Text('Name: ', style: Theme.of(context).textTheme.subhead),
              Text('Not disclosed',
                  style: Theme.of(context).textTheme.title.copyWith(
                      fontSize: 16,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.bold))
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text('Gender: ', style: Theme.of(context).textTheme.subhead),
                  Text(affected.gender.cap(),
                      style: Theme.of(context).textTheme.title.copyWith(
                          fontSize: 16,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(width: 20),
              Row(
                children: <Widget>[
                  Text('Age: ', style: Theme.of(context).textTheme.subhead),
                  Text(affected.age.toString(),
                      style: Theme.of(context).textTheme.title.copyWith(
                          fontSize: 16,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.bold)),
                ],
              )
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: <Widget>[
              Text('Case Status: ', style: Theme.of(context).textTheme.subhead),
              Text(affected.currentState.toString().cap(),
                  style: Theme.of(context)
                      .textTheme
                      .title
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
          SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(color: Colors.orange[50]),
            child: ListTile(
                title: Text("Find in Maps"),
                trailing: Icon(Icons.directions),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Map(
                              label: "Infected Location",
                              allMarkers: markers,
                              key: _mapKey,
                              longitude: affected.point.coordinates[0],
                              latitude: affected.point.coordinates[1])));
                }),
          ),
        ],
      ),
    );
  }
}
