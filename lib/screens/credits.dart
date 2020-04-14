import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Credits extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      scrollDirection: Axis.vertical,
      slivers: <Widget>[
        SliverAppBar(
          iconTheme: IconThemeData(color: Colors.white),
          expandedHeight: 200.0,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: Text(
              'Credits',
              style: TextStyle(color: Colors.white),
            ),
            background: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/designed.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.black12, Colors.black54],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter)),
              ),
            ),
          ),
          floating: true,
          pinned: true,
          elevation: 0,
        ),
        SliverFillRemaining(
            hasScrollBody: false,
            child: ListView(
              padding: EdgeInsets.all(20),
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              children: <Widget>[
                Text(
                  'Designed and developed by:',
                  style: Theme.of(context).accentTextTheme.title,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      'Bigyan Ghimire',
                      style: Theme.of(context)
                          .accentTextTheme
                          .headline
                          .copyWith(color: Theme.of(context).primaryColor),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: <Widget>[
                    Icon(Icons.mail, color: Colors.red[700]),
                    SizedBox(width: 10),
                    Text('lively.bigyan@gmail.com'),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: <Widget>[
                    Icon(Icons.textsms, color: Colors.blue[600]),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        launch('https://www.facebook.com/lively.bigyan');
                      },
                      child: Text('facebook.com/lively.bigyan',
                          style: TextStyle(color: Colors.blue)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text('Credits', style: Theme.of(context).accentTextTheme.title),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('DataSet and API credits',
                        style: Theme.of(context).textTheme.subhead),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text('Nepal Corona Open Data API',
                          style: TextStyle(fontSize: 16)),
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text('api.covid19api.com')),
                    SizedBox(height: 16),
                    Text('Design credits',
                        style: Theme.of(context).textTheme.subhead),
                    Row(
                      children: <Widget>[
                        Text('Animations: '),
                        GestureDetector(
                          onTap: () {
                            launch('https://rive.app/a/zerolive/files');
                          },
                          child: Text(
                            'Zerolive',
                            style: Theme.of(context).textTheme.subhead.copyWith(color:Theme.of(context).primaryColor),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: <Widget>[
                        Text('Hospital illustration: '),
                        GestureDetector(
                            onTap: () {
                              launch('https://dribbble.com/almigor');
                            },
                            child: Text(
                              'Aleksandar Savic',
                              style: TextStyle(color: Colors.blue[700]),
                            )),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: <Widget>[
                        Text('Credit Page Illustration: '),
                        GestureDetector(
                          onTap: () {
                            launch('https://undraw.co/illustrations');
                          },
                          child: Text(
                            'UnDraw illustrations',
                            style: TextStyle(color: Colors.blue[700]),
                          ),
                        ),
                      ],
                    ),
                    
                  ],
                )
              ],
            )),
      ],
    ));
  }
}
