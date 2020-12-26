import 'package:corona_nepal/locators.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../blocs/affected_bloc.dart';
import '../../models/nepalCases.dart';
import '../../utils/cap.dart';
import 'affected_details.dart';

class AffectedList extends StatefulWidget {
  @override
  _AffectedListState createState() => _AffectedListState();
}

class _AffectedListState extends State<AffectedList> {
  List<Marker> _markerlist = [];
  AffectedBloc affectedBloc;
  @override
  void initState() {
    affectedBloc = locator<AffectedBloc>();
    super.initState();
    affectedBloc.getAffected();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Affected In Nepal"),
          bottom: PreferredSize(
              child: ListTile(
                dense: true,
                leading: Text(
                  'Province',
                  style: Theme.of(context).primaryTextTheme.bodyText1,
                ),
                title: Text('Infected Gender [Age]',
                    style: Theme.of(context).primaryTextTheme.subtitle1),
                subtitle: Text('Infected ID',
                    style: Theme.of(context).primaryTextTheme.bodyText1),
              ),
              preferredSize: Size.fromHeight(50)),
        ),
        body: StreamBuilder<AffectedInNepal>(
            stream: affectedBloc.subject.stream,
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
                            affectedBloc.getAffected();
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
                    final data = snapshot.data.data[i];
                    return Container(
                      decoration: BoxDecoration(
                          color: data.currentState == "recovered"
                              ? Colors.green[100]
                              : Colors.blue[100]),
                      child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.blue[300],
                            child: Text("${data.province}",
                                style: TextStyle(
                                  color: Colors.black,
                                )),
                          ),
                          title: Text(
                              "${(data.gender ?? "n/A").cap()}" +
                                  " [${data.age}]",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(fontWeight: FontWeight.bold)),
                          subtitle: Hero(
                            tag: data.label,
                            transitionOnUserGestures: true,
                            child: Material(
                              type: MaterialType.transparency,
                              child: Text(data.label,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      .copyWith(fontSize: 14)),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        AffectedDetails(affected: data)));
                          }),
                    );
                  },
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
            }));
  }
}
