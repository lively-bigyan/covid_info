import 'dart:async';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

import 'blocs/countries_bloc.dart';
import 'blocs/nepal_bloc.dart';
import 'home.dart';
import 'locators.dart';

class InitScreen extends StatefulWidget {
  @override
  _InitScreenState createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
    locator<StatsBloc>().getStats();
    locator<CountriesBloc>().getCountries();
  }

  startTime() async {
    var duration = Duration(milliseconds: 3000);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  initScreen(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "COVID-19 INFO NEPAL",
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(color: Theme.of(context).primaryColor),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.5,
              height: MediaQuery.of(context).size.width / 1.5,
              child: FlareActor("assets/loading.flr",
                  alignment: Alignment.center,
                  fit: BoxFit.cover,
                  animation: "Is Loading"),
            ),
            const SizedBox(height: 10),
            Text("An unofficial covid-19 updates application."),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: initScreen(context),
    );
  }
}
