import 'package:corona_nepal/screens/affected_page.dart';
import 'package:corona_nepal/screens/allCountries.dart';
import 'package:corona_nepal/screens/about_cov.dart';
import 'package:corona_nepal/screens/credits.dart';
import 'package:corona_nepal/screens/hospital/hospital_list.dart';
import 'package:corona_nepal/screens/news_list.dart';
import 'package:corona_nepal/screens/quiz/start_screen.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

makeDrawer(context) {
  return Drawer(
    child: Stack(
      children: <Widget>[
        Container(
          child: FlareActor(
            "assets/Liquid.flr",
            animation: "Liquid",
            fit: BoxFit.fill,
            color: Theme.of(context).primaryColor,
            alignment: Alignment.center,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("COVID-19 INFO",
                style: Theme.of(context)
                    .textTheme
                    .display1
                    .copyWith(color: Theme.of(context).primaryColor)),
            SizedBox(
              height: 50,
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
              dense: true,
              leading: Icon(Icons.flag, color: Colors.indigo),
              title: Text(
                "Global Cases",
                style: Theme.of(context).accentTextTheme.headline,
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CountryList()));
              },
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
              dense: true,
              leading: Icon(Icons.local_hospital, color: Colors.red),
              title: Text(
                "Hospitals",
                style: Theme.of(context).accentTextTheme.headline,
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HospitalList()));
              },
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
              dense: true,
              leading: Icon(
                Icons.description,
                color: Colors.blue,
              ),
              title: Text(
                "News",
                style: Theme.of(context).accentTextTheme.headline,
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NewsList()));
              },
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
              dense: true,
              leading: Icon(
                Icons.people,
                color: Colors.orange,
              ),
              title: Text(
                "Affected List",
                style: Theme.of(context).accentTextTheme.headline,
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AffectedList()));
              },
            ),
            // ListTile(
            //     contentPadding:
            //         EdgeInsets.symmetric(vertical: 0, horizontal: 20),
            //     dense: true,
            //     leading: Icon(Icons.info_outline, color: Colors.black54),
            //     title: Text("Take Quiz",
            //         style: Theme.of(context).accentTextTheme.headline),
            //     onTap: () {
            //       Navigator.pop(context);
            //       Navigator.push(context,
            //           MaterialPageRoute(builder: (context) => QuizStart()));
            //     }),
            ListTile(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                dense: true,
                leading: Icon(Icons.info_outline, color: Colors.black54),
                title: Text("About Covid-19",
                    style: Theme.of(context).accentTextTheme.headline),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AboutCov()));
                }),
            ListTile(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                dense: true,
                leading:
                    Icon(Icons.perm_device_information, color: Colors.blueGrey),
                title: Text(
                  "Credits",
                  style: Theme.of(context).accentTextTheme.headline,
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Credits()));
                }),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ],
    ),
  );
}
