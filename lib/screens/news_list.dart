import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../blocs/news_bloc.dart';
import '../locators.dart';
import '../models/news.dart';

class NewsList extends StatefulWidget {
  @override
  _NewsListState createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  NewsBloc newsBloc;
  Future<void> _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to launch url'),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    newsBloc = locator<NewsBloc>();
    newsBloc.getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News'),
      ),
      body: StreamBuilder<News>(
          stream: newsBloc.subject.stream,
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
                          newsBloc.getNews();
                        },
                        child: Text('Retry',
                            style: TextStyle(color: Colors.white))),
                  ],
                ));
              }
              return ListView.builder(
                  padding: EdgeInsets.all(20),
                  itemCount: snapshot.data.data.length,
                  itemBuilder: (context, i) {
                    return GestureDetector(
                      onTap: () => _launchURL(snapshot.data.data[i].url),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text(DateFormat('MMM d, y').format(DateTime.parse(
                                  snapshot.data.data[i].updatedAt)))
                            ],
                          ),
                          const SizedBox(height: 5),
                          Container(
                              height: 150,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: CachedNetworkImageProvider(
                                        snapshot.data.data[i].imageUrl),
                                    fit: BoxFit.fill),
                              )),
                          const SizedBox(height: 10),
                          Text(snapshot.data.data[i].title,
                              style: Theme.of(context).textTheme.subtitle1),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text('Source: '),
                              Text(
                                snapshot.data.data[i].source,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .copyWith(
                                        color: Theme.of(context).primaryColor),
                              )
                            ],
                          ),
                          const Divider(height: 20),
                        ],
                      ),
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
          }),
    );
  }
}
