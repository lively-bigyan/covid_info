import 'package:flutter/material.dart';

import '../../blocs/hospital_bloc.dart';
import '../../locators.dart';
import '../../models/hospitals.dart';
import 'hospital_details.dart';

class HospitalList extends StatefulWidget {
  @override
  _HospitalListState createState() => _HospitalListState();
}

class _HospitalListState extends State<HospitalList> {
  bool enableFilter = false;
  HospitalsBloc hospitalsBloc;
  String filter = "";
  @override
  void initState() {
    hospitalsBloc = locator<HospitalsBloc>();
    super.initState();
    hospitalsBloc.getHospitals();
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
            : Text('Hospitals',
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
            child: ListTile(
              dense: true,
              leading: Text(
                'Province',
                style: Theme.of(context).primaryTextTheme.bodyText1,
              ),
              title: Text('Hospital',
                  style: Theme.of(context).primaryTextTheme.headline6),
              subtitle: Text('Hospital Contact',
                  style: Theme.of(context).primaryTextTheme.bodyText1),
            ),
            preferredSize: Size.fromHeight(50)),
      ),
      body: StreamBuilder<Hospitals>(
          stream: hospitalsBloc.subject.stream,
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
                          hospitalsBloc.getHospitals();
                        },
                        child: Text('Retry',
                            style: TextStyle(color: Colors.white))),
                  ],
                ));
              }
              return ListView.builder(
                  itemCount: snapshot.data.data.length,
                  itemBuilder: (context, i) {
                    return snapshot.data.data[i].name
                            .toLowerCase()
                            .contains(filter.toLowerCase())
                        ? Column(
                            children: <Widget>[
                              ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Colors.blue[200],
                                  child: Text(snapshot.data.data[i].state),
                                ),
                                title: Hero(
                                  transitionOnUserGestures: true,
                                  tag: snapshot.data.data[i].name,
                                  child: Material(
                                    type: MaterialType.transparency,
                                    child: Text(
                                      snapshot.data.data[i].name,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          .copyWith(
                                              fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                subtitle: Text(
                                  snapshot.data.data[i].phone == ""
                                      ? "Contact: n/a"
                                      : "Contact: " +
                                          snapshot.data.data[i].phone
                                              .replaceAll(",", ", "),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      .copyWith(fontSize: 14),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HospitalDetails(
                                              hospital:
                                                  snapshot.data.data[i])));
                                },
                              ),
                              Divider(
                                color: Colors.blue,
                                height: 0,
                              )
                            ],
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
