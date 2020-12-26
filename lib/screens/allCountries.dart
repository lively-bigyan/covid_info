import 'package:flutter/material.dart';

import '../blocs/countries_bloc.dart';
import '../locators.dart';
import '../models/countryModel.dart';
import 'countryStats.dart';

class CountryList extends StatefulWidget {
  @override
  _CountryListState createState() => _CountryListState();
}

class _CountryListState extends State<CountryList> {
  bool enableFilter = false;
  String filter = "";
  CountriesBloc countriesBloc;
  @override
  void initState() {
    countriesBloc = locator<CountriesBloc>();
    super.initState();
    countriesBloc.getCountries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: enableFilter
            ? Container(
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: TextField(
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      border: InputBorder.none),
                  onChanged: (val) {
                    setState(() {
                      filter = val;
                    });
                  },
                ),
              )
            : Text('Global Cases',
                style: Theme.of(context).primaryTextTheme.headline5),
        actions: <Widget>[
          IconButton(
            icon: enableFilter ? Icon(Icons.clear) : Icon(Icons.search),
            onPressed: () {
              setState(() {
                filter = "";
                enableFilter = !enableFilter;
              });
            },
          )
        ],
        bottom: PreferredSize(
            child: Wrap(
              alignment: WrapAlignment.center,
              runSpacing: 5,
              spacing: 20,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Color Index [Total cases confirmed]',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
                Wrap(
                  children: <Widget>[
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(color: Colors.red[300]),
                    ),
                    Text(
                      "  > 100,000",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                Wrap(
                  children: <Widget>[
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(color: Colors.orange[300]),
                    ),
                    Text(
                      "  > 10,000",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                Wrap(
                  children: <Widget>[
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(color: Colors.blue[200]),
                    ),
                    Text("  > 1,000", style: TextStyle(color: Colors.white)),
                  ],
                ),
                Wrap(
                  children: <Widget>[
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(color: Colors.green[100]),
                    ),
                    Text("  > 100", style: TextStyle(color: Colors.white)),
                  ],
                ),
                Wrap(
                  children: <Widget>[
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(color: Colors.white),
                    ),
                    Text("  < 100", style: TextStyle(color: Colors.white)),
                  ],
                ),
                Row(
                  children: <Widget>[
                    const SizedBox(
                      height: 5,
                    )
                  ],
                )
              ],
            ),
            preferredSize: Size.fromHeight(60)),
      ),
      body: StreamBuilder<AllCountries>(
          stream: countriesBloc.subject.stream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data.error != null &&
                  snapshot.data.error.length > 0) {
                return Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text("${snapshot.data.error}"),
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
              return ListView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: snapshot.data.data.length,
                  itemBuilder: (context, i) {
                    return (snapshot.data.data[i].country
                                .toLowerCase()
                                .contains(filter.toLowerCase()) &&
                            snapshot.data.data[i].country != "")
                        ? Container(
                            decoration: BoxDecoration(
                                color: (snapshot.data.data[i].totalCases >
                                        100000)
                                    ? Colors.red[400]
                                    : (snapshot.data.data[i].totalCases > 10000)
                                        ? Colors.orange[300]
                                        : (snapshot.data.data[i].totalCases >
                                                1000)
                                            ? Colors.blue[200]
                                            : (snapshot.data.data[i]
                                                        .totalCases >
                                                    100)
                                                ? Colors.green[100]
                                                : Colors.white),
                            child: ListTile(
                              title: Hero(
                                tag: snapshot.data.data[i].country,
                                transitionOnUserGestures: true,
                                child: Material(
                                  type: MaterialType.transparency,
                                  child: Text(
                                    snapshot.data.data[i].country,
                                    style: TextStyle(
                                        fontSize: 18,
                                        color:
                                            (snapshot.data.data[i].totalCases >
                                                    100000)
                                                ? Colors.white
                                                : Colors.black),
                                  ),
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CountryStats(
                                              country: snapshot.data.data[i],
                                            )));
                              },
                            ),
                          )
                        : Container();
                  });
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
    );
  }
}
