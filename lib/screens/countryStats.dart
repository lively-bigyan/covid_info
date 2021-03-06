import 'package:flutter/material.dart';

import '../UI/customContainer.dart';
import '../blocs/countries_bloc.dart';
import '../locators.dart';
import '../utils/add_comma.dart';

class CountryStats extends StatefulWidget {
  final country;
  CountryStats({this.country});
  @override
  _CountryStatsState createState() => _CountryStatsState();
}

class _CountryStatsState extends State<CountryStats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Hero(
            transitionOnUserGestures: true,
            tag: widget.country.country,
            child: Material(
                type: MaterialType.transparency,
                child: Text(
                  widget.country.country,
                  style: Theme.of(context).primaryTextTheme.headline5,
                ))),
      ),
      body: RefreshIndicator(
        onRefresh: () async => locator<CountriesBloc>().getCountries(),
        child: ListView(
          padding: EdgeInsets.all(20),
          children: <Widget>[
            CustomContainer(
                title: 'Total Cases',
                color: Colors.blueGrey[100],
                textColor: Colors.blueGrey,
                number: widget.country.totalCases.toString().addComma()),
            const SizedBox(height: 20),
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: CustomContainer(
                        title: 'Active Cases',
                        color: Colors.indigo[100],
                        textColor: Colors.indigo,
                        number:
                            widget.country.activeCases.toString().addComma()),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: CustomContainer(
                      color: Colors.deepOrange[100],
                      textColor: Color(0xffF38460),
                      title: 'New Cases',
                      number: widget.country.newCases.toString().addComma(),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            CustomContainer(
              title: 'Critical Cases',
              color: Colors.blue[100],
              textColor: Colors.blue,
              number: widget.country.criticalCases.toString().addComma(),
            ),
            const SizedBox(height: 20),
            IntrinsicHeight(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: CustomContainer(
                        title: 'Total Deaths',
                        color: Colors.red[100],
                        textColor: Colors.red[400],
                        number:
                            widget.country.totalDeaths.toString().addComma(),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: CustomContainer(
                        color: Colors.red[100],
                        textColor: Colors.red[400],
                        title: 'New Deaths',
                        number: widget.country.newDeaths.toString().addComma(),
                      ),
                    )
                  ]),
            ),
            const SizedBox(height: 20),
            CustomContainer(
              color: Colors.green[100],
              textColor: Colors.green,
              title: 'Total Recovered',
              number: widget.country.totalRecovered.toString().addComma(),
            ),
          ],
        ),
      ),
    );
  }
}
