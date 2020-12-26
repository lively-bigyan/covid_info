import 'package:corona_nepal/blocs/myth_bloc.dart';
import 'package:corona_nepal/locators.dart';
import 'package:corona_nepal/models/myths.dart';
import 'package:flutter/material.dart';

class MythTab extends StatefulWidget {
  @override
  _MythTabState createState() => _MythTabState();
}

class _MythTabState extends State<MythTab> {
  MythBloc mythBloc;
  @override
  void initState() {
    mythBloc = locator<MythBloc>();
    super.initState();
    mythBloc..getMyth();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Myths>(
        stream: mythBloc.subject.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.error != null && snapshot.data.error.length > 0) {
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
                        mythBloc.getMyth();
                      },
                      child:
                          Text('Retry', style: TextStyle(color: Colors.white))),
                ],
              ));
            }
            return ListView.separated(
                separatorBuilder: (context, i) {
                  return Divider(
                    height: 20,
                    thickness: 2,
                  );
                },
                padding: EdgeInsets.only(top: 20, right: 20, left: 10),
                itemCount: snapshot.data.data.length,
                itemBuilder: (context, i) {
                  final myths = snapshot.data.data[i];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(Icons.clear, color: Colors.red),
                          const SizedBox(width: 5),
                          Expanded(
                            child: Text(
                              myths.myth.replaceAll("\n", " "),
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Icon(Icons.done, color: Colors.green),
                          const SizedBox(width: 5),
                          Expanded(
                            child: Text(
                              myths.reality.replaceAll("\n", " "),
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
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
        });
  }
}
