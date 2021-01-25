import 'package:corona_nepal/locators.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'UI/customContainer.dart';
import 'blocs/countries_bloc.dart';
import 'blocs/nepal_bloc.dart';
import 'models/countryModel.dart';
import 'models/nepal_stats.dart';
import 'screens/allCountries.dart';
import 'screens/drawer.dart';
import 'utils/add_comma.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CountriesBloc countriesBloc;
  StatsBloc statsBloc;
  @override
  void initState() {
    super.initState();
    countriesBloc = locator<CountriesBloc>();
    statsBloc = locator<StatsBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Corona Update',
              style: Theme.of(context).primaryTextTheme.headline5,
            ),
            centerTitle: true,
            bottom: TabBar(
              labelStyle: Theme.of(context)
                  .textTheme
                  .headline4
                  .copyWith(fontSize: 24, fontWeight: FontWeight.w500),
              indicatorWeight: 5,
              indicatorColor: Color(0xffffa45c),
              unselectedLabelColor: Colors.grey[400],
              labelColor: Colors.white,
              tabs: [
                Tab(
                  text: 'Nepal',
                ),
                Tab(text: 'World'),
              ],
            ),
          ),
          drawer: makeDrawer(context),
          body: TabBarView(
            children: <Widget>[
              StreamBuilder<NepalStats>(
                  stream: statsBloc.subject.stream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data.error != null &&
                          snapshot.data.error.isNotEmpty) {
                        return Center(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Text('${snapshot.data.error}'),
                            ),
                            const SizedBox(height: 20),
                            RaisedButton(
                                color: Theme.of(context).primaryColor,
                                onPressed: () {
                                  statsBloc.getStats();
                                },
                                child: Text('Retry',
                                    style: TextStyle(color: Colors.white))),
                          ],
                        ));
                      }
                      return RefreshIndicator(
                        onRefresh: () async {
                          return statsBloc.getStats();
                        },
                        child: ListView(
                          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  'Last Updated At: ',
                                  style: Theme.of(context)
                                      .accentTextTheme
                                      .bodyText1
                                      .copyWith(fontSize: 18),
                                ),
                                Text(
                                    DateFormat('d, MMM, y').format(
                                        DateTime.parse(
                                            snapshot.data.updatedAt)),
                                    style: Theme.of(context)
                                        .accentTextTheme
                                        .bodyText1
                                        .copyWith(fontSize: 18)),
                              ],
                            ),
                            const SizedBox(height: 10),
                            CustomContainer(
                                title: 'Total Tests',
                                textColor: Colors.blueGrey,
                                color: Colors.blueGrey[100],
                                number: snapshot.data.testedTotal
                                    .toString()
                                    .addComma()),
                            const SizedBox(height: 20),
                            IntrinsicHeight(
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Expanded(
                                      child: CustomContainer(
                                        title: 'Tested Positive',
                                        color: Colors.indigo[100],
                                        textColor: Colors.indigo,
                                        number: snapshot.data.testedPositive
                                            .toString()
                                            .addComma(),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: CustomContainer(
                                        color: Colors.indigo[100],
                                        textColor: Colors.indigo,
                                        title: 'Total Negative',
                                        number: snapshot.data.testedNegative
                                            .toString()
                                            .addComma(),
                                      ),
                                    ),
                                  ]),
                            ),
                            const SizedBox(height: 20),
                            CustomContainer(
                              color: Colors.red[100],
                              textColor: Colors.red,
                              title: 'Total Deaths',
                              number:
                                  snapshot.data.deaths.toString().addComma(),
                            ),
                            const SizedBox(height: 20),
                            IntrinsicHeight(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: CustomContainer(
                                      title: 'In Isolation',
                                      color: Colors.orange[100],
                                      textColor: Colors.orange,
                                      number: snapshot.data.inIsolation
                                          .toString()
                                          .addComma(),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: CustomContainer(
                                      color: Colors.orange[100],
                                      textColor: Colors.orange,
                                      title: 'Pending\nResults',
                                      number: snapshot.data.pendingResult
                                          .toString()
                                          .addComma(),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            IntrinsicHeight(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: CustomContainer(
                                      title: 'Total Recovered',
                                      color: Colors.green[100],
                                      textColor: Colors.green,
                                      number: snapshot.data.recovered
                                          .toString()
                                          .addComma(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text('${snapshot.error}'),
                      );
                    } else {
                      return Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CircularProgressIndicator(
                            strokeWidth: 2.0,
                            valueColor: AlwaysStoppedAnimation(Colors.blue),
                          ),
                          Text('Fetching Data')
                        ],
                      ));
                    }
                  }),
              StreamBuilder<AllCountries>(
                  stream: countriesBloc.subject.stream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data.error != null &&
                          snapshot.data.error.isNotEmpty) {
                        return Center(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Text('${snapshot.data.error}'),
                            ),
                            const SizedBox(height: 20),
                            RaisedButton(
                                color: Theme.of(context).primaryColor,
                                onPressed: () {
                                  countriesBloc.getCountries();
                                },
                                child: Text('Retry',
                                    style: TextStyle(color: Colors.white))),
                          ],
                        ));
                      }
                      return RefreshIndicator(
                        onRefresh: () async {
                          return countriesBloc.getCountries();
                        },
                        child: ListView(
                          children: <Widget>[
                            ListView(
                              shrinkWrap: true,
                              physics: ClampingScrollPhysics(),
                              padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      CountryList()));
                                        },
                                        child: Text('Countrywise Stats',
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle1
                                                .copyWith(
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                    fontWeight: FontWeight.w500,
                                                    decoration: TextDecoration
                                                        .underline))),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: CustomContainer(
                                          title: 'Total Cases',
                                          textColor: Colors.blueGrey,
                                          color: Colors.blueGrey[100],
                                          number: snapshot
                                              .data.data[0].totalCases
                                              .toString()
                                              .addComma()),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                IntrinsicHeight(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Expanded(
                                        child: CustomContainer(
                                            title: 'Active Cases',
                                            textColor: Colors.indigo,
                                            color: Colors.indigo[100],
                                            number: snapshot
                                                .data.data[0].activeCases
                                                .toString()
                                                .addComma()),
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: CustomContainer(
                                          color: Colors.indigo[100],
                                          textColor: Colors.indigo,
                                          title: 'New Cases',
                                          number: snapshot.data.data[0].newCases
                                              .toString()
                                              .addComma(),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 20),
                                CustomContainer(
                                  color: Colors.blue[100],
                                  textColor: Colors.blue,
                                  title: 'Critical Cases',
                                  number: snapshot.data.data[0].criticalCases
                                      .toString()
                                      .addComma(),
                                ),
                                const SizedBox(height: 20),
                                IntrinsicHeight(
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Expanded(
                                          child: CustomContainer(
                                            title: 'Total Deaths',
                                            color: Colors.red[100],
                                            textColor: Colors.red,
                                            number: snapshot
                                                .data.data[0].totalDeaths
                                                .toString()
                                                .addComma(),
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: CustomContainer(
                                            color: Colors.red[100],
                                            textColor: Colors.red,
                                            title: 'New Deaths',
                                            number: snapshot
                                                .data.data[0].newDeaths
                                                .toString()
                                                .addComma(),
                                          ),
                                        )
                                      ]),
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: CustomContainer(
                                        title: 'Total Recovered',
                                        color: Colors.green[100],
                                        textColor: Colors.green,
                                        number: snapshot
                                            .data.data[0].totalRecovered
                                            .toString()
                                            .addComma(),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text('${snapshot.error}'),
                      );
                    } else {
                      return Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CircularProgressIndicator(
                            strokeWidth: 2.0,
                            valueColor: AlwaysStoppedAnimation(Colors.blue),
                          ),
                          Text('Fetching Data')
                        ],
                      ));
                    }
                  }),
            ],
          )),
    );
  }
}

Column symptopms() {
  return Column(
    children: <Widget>[Text('')],
  );
}
