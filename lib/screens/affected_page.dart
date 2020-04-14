import 'package:corona_nepal/blocs/affected_bloc.dart';
import 'package:corona_nepal/models/nepalCases.dart';
import 'package:corona_nepal/screens/affectedPage/affected_details.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:corona_nepal/utils/cap.dart';

class AffectedList extends StatefulWidget {
  @override
  _AffectedListState createState() => _AffectedListState();
}

class _AffectedListState extends State<AffectedList> {
  List<Marker> _markerlist = [];
  @override
  void initState() {
    // TODO: implement initState
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
                  style: Theme.of(context).primaryTextTheme.body1,
                ),
                title: Text('Infected Gender [Age]',
                    style: Theme.of(context).primaryTextTheme.title),
                subtitle: Text('Infected ID',
                    style: Theme.of(context).primaryTextTheme.body1),
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
                      SizedBox(height: 20),
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
                _markerlist.clear();
                for (var items in snapshot.data.data)
                  _markerlist.add(
                    Marker(
                        markerId: MarkerId(items.label),
                        position: LatLng(items.point.coordinates[1],
                            items.point.coordinates[0]),
                        infoWindow: InfoWindow(title: items.label),
                        icon: BitmapDescriptor.defaultMarkerWithHue(
                          BitmapDescriptor.hueViolet,
                        )),
                  );
                return ListView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: snapshot.data.data.length,
                  itemBuilder: (context, i) {
                    return Container(
                      decoration: BoxDecoration(
                          color:
                              snapshot.data.data[i].currentState == "recovered"
                                  ? Colors.green[100]
                                  : Colors.blue[100]),
                      child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.blue[300],
                            child:
                                Text(snapshot.data.data[i].province.toString(),
                                    style: TextStyle(
                                      color: Colors.black,
                                    )),
                          ),
                          title: Text(
                              snapshot.data.data[i].gender.cap() +
                                  " [${snapshot.data.data[i].age}]",
                              style: Theme.of(context)
                                  .textTheme
                                  .body1
                                  .copyWith(fontWeight: FontWeight.bold)),
                          subtitle: Hero(
                            tag: snapshot.data.data[i].label,
                            transitionOnUserGestures: true,
                            child: Material(
                              type: MaterialType.transparency,
                              child: Text(snapshot.data.data[i].label,
                                  style: Theme.of(context)
                                      .textTheme
                                      .body2
                                      .copyWith(fontSize: 14)),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AffectedDetails(
                                          affected: snapshot.data.data[i],
                                          markers: _markerlist,
                                        )));
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
