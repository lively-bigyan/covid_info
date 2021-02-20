import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Designed and developed by:',
                    style: Theme.of(context).accentTextTheme.headline6,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        'Bigyan Ghimire',
                        style: Theme.of(context)
                            .accentTextTheme
                            .headline6
                            .copyWith(color: Theme.of(context).primaryColor),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: <Widget>[
                      Icon(FontAwesomeIcons.envelope, color: Colors.red[700]),
                      const SizedBox(width: 10),
                      Text('lively.bigyan@gmail.com'),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: <Widget>[
                      Icon(FontAwesomeIcons.facebookF, color: Colors.blue[600]),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          launch('https://www.facebook.com/lively.bigyan');
                        },
                        child: Text('facebook.com/lively.bigyan',
                            style: TextStyle(color: Colors.blue)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text('Credits',
                      style: Theme.of(context).accentTextTheme.subtitle1),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('DataSet and API credits',
                          style: Theme.of(context).textTheme.subtitle1),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text('Nepal Corona Open Data API',
                            style: TextStyle(fontSize: 16)),
                      ),
                      const SizedBox(height: 16),
                      Text('Design credits',
                          style: Theme.of(context).textTheme.subtitle1),
                      Row(
                        children: <Widget>[
                          Text('Animations: '),
                          GestureDetector(
                            onTap: () {
                              launch('https://rive.app/a/zerolive/files');
                            },
                            child: Text(
                              'Zerolive',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  .copyWith(
                                      color: Theme.of(context).primaryColor),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
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
                      const SizedBox(height: 5),
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
              ),
            )),
      ],
    ));
  }
}
