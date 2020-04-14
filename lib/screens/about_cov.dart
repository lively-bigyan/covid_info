import 'package:corona_nepal/blocs/faq_bloc.dart';
import 'package:corona_nepal/blocs/myth_bloc.dart';
import 'package:corona_nepal/models/faq.dart';
import 'package:corona_nepal/models/myths.dart';
import 'package:flutter/material.dart';

class AboutCov extends StatefulWidget {
  @override
  _AboutCovState createState() => _AboutCovState();
}

class _AboutCovState extends State<AboutCov> {
  bool _isNepali = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mythBloc.getMyth();
    faqBloc.getFAQ();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text("COVID-19 Info"),
          bottom: TabBar(
            isScrollable: true,
            labelStyle: Theme.of(context)
                .textTheme
                .display2
                .copyWith(fontSize: 20, fontWeight: FontWeight.w600),
            indicatorWeight: 5,
            indicatorColor: Color(0xffffa45c),
            unselectedLabelColor: Colors.grey[400],
            labelColor: Colors.white,
            tabs: [
              Tab(text: "Symptoms"),
              Tab(text: "Prevention"),
              Tab(text: "FAQ"),
              Tab(text: "Myths/Reality"),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ListView(
              padding: EdgeInsets.fromLTRB(20, 10, 10, 20),
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Text(
                    "Patients start to show symptoms within 2-14 days if infected. " +
                        "In rare cases, symptoms can surface after 21 days too.",
                    style: Theme.of(context).textTheme.subhead),
                SizedBox(
                  height: 16,
                ),
                Text('Common Symptoms:',
                    style: Theme.of(context).textTheme.headline),
                Text('1. ' + 'Fever', style: Theme.of(context).textTheme.title),
                Text('2. Cough [Dry]',
                    style: Theme.of(context).textTheme.title),
                Text('3. Tiredness/Fatigue',
                    style: Theme.of(context).textTheme.title),
                SizedBox(
                  height: 20,
                ),
                Text('Other Symptoms:',
                    style: Theme.of(context)
                        .textTheme
                        .title
                        .copyWith(fontWeight: FontWeight.bold)),
                Text('1. Shortness of Breath',
                    style: Theme.of(context).textTheme.title),
                Text('2. Aches and Pains',
                    style: Theme.of(context).textTheme.title),
                Text('3. Sore Throat',
                    style: Theme.of(context).textTheme.title),
                SizedBox(
                  height: 5,
                ),
                Text(
                    'Very few people will report diarrhoea, nausea or a runny nose.',
                    style: Theme.of(context)
                        .textTheme
                        .title
                        .copyWith(color: Colors.grey[800])),
              ],
            ),
            ListView(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              children: <Widget>[
                Text(
                    'Here are some of the prevention measures according to WHO.',
                    style: Theme.of(context).textTheme.headline),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("1. ",
                        style: Theme.of(context)
                            .textTheme
                            .title
                            .copyWith(fontWeight: FontWeight.bold)),
                    Expanded(
                      child: Text(
                          "Wash your hands regularly with soap and water, or clean them with alcohol-based hand rub.",
                          style: Theme.of(context).accentTextTheme.title),
                    ),
                  ],
                ),
                SizedBox(height: 2),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("2. ",
                        style: Theme.of(context)
                            .textTheme
                            .title
                            .copyWith(fontWeight: FontWeight.bold)),
                    Expanded(
                      child: Text(
                          "Maintain at least 1 metre distance between you and people coughing or sneezing.",
                          style: Theme.of(context).accentTextTheme.title),
                    ),
                  ],
                ),
                SizedBox(height: 2),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("3. ",
                        style: Theme.of(context)
                            .textTheme
                            .title
                            .copyWith(fontWeight: FontWeight.bold)),
                    Expanded(
                      child: Text("Avoid touching your face.",
                          style: Theme.of(context).accentTextTheme.title),
                    ),
                  ],
                ),
                SizedBox(height: 2),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("4. ",
                        style: Theme.of(context)
                            .textTheme
                            .title
                            .copyWith(fontWeight: FontWeight.bold)),
                    Expanded(
                      child: Text(
                          "Cover your mouth and nose when coughing or sneezing.",
                          style: Theme.of(context).accentTextTheme.title),
                    ),
                  ],
                ),
                SizedBox(height: 2),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("5. ",
                        style: Theme.of(context)
                            .textTheme
                            .title
                            .copyWith(fontWeight: FontWeight.bold)),
                    Expanded(
                      child: Text("Stay home if you feel unwell.",
                          style: Theme.of(context).accentTextTheme.title),
                    ),
                  ],
                ),
                SizedBox(height: 2),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("6. ",
                        style: Theme.of(context)
                            .textTheme
                            .title
                            .copyWith(fontWeight: FontWeight.bold)),
                    Expanded(
                      child: Text(
                          "Refrain from smoking and other activities that weaken the lungs.",
                          style: Theme.of(context).accentTextTheme.title),
                    ),
                  ],
                ),
                SizedBox(height: 2),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("7. ",
                        style: Theme.of(context)
                            .textTheme
                            .title
                            .copyWith(fontWeight: FontWeight.bold)),
                    Expanded(
                      child: Text(
                          "Practice physical distancing by avoiding unnecessary travel and staying away from large groups of people.",
                          style: Theme.of(context).accentTextTheme.title),
                    ),
                  ],
                ),
              ],
            ),
            StreamBuilder<FAQ>(
                stream: faqBloc.subject.stream,
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
                                mythBloc.getMyth();
                              },
                              child: Text('Retry',
                                  style: TextStyle(color: Colors.white))),
                        ],
                      ));
                    }
                    return ListView(
                      children: <Widget>[
                        Container(
                          color: Colors.blue[100],
                          child: ListTile(
                            title: Text(_isNepali
                                ? 'Click to translate to English'
                                : 'नेपाली भाषा मा हेर्नुहोस!'),
                            trailing: Icon(Icons.g_translate),
                            onTap: () {
                              setState(() {
                                _isNepali = !_isNepali;
                              });
                            },
                          ),
                        ),
                        SizedBox(height: 10),
                        ListView.separated(
                            physics: ClampingScrollPhysics(),
                            shrinkWrap: true,
                            separatorBuilder: (context, i) {
                              return Divider(
                                height: 10,
                              );
                            },
                            padding: EdgeInsets.only(
                                bottom: 20, left: 10, right: 20),
                            itemCount: snapshot.data.data.length,
                            itemBuilder: (context, i) {
                              return Column(
                                children: <Widget>[
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        ('[${i + 1}] '),
                                        style: Theme.of(context)
                                            .accentTextTheme
                                            .title
                                            .copyWith(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                      ),
                                      Expanded(
                                        child: Text(
                                          _isNepali
                                              ? snapshot.data.data[i].questionNp
                                              : snapshot.data.data[i].question,
                                          style: Theme.of(context)
                                              .accentTextTheme
                                              .title
                                              .copyWith(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20.0),
                                    child: Text(
                                      (_isNepali
                                              ? snapshot.data.data[i].answerNp
                                              : snapshot.data.data[i].answer)
                                          .replaceAll("\n", " "),
                                      style: Theme.of(context)
                                          .textTheme
                                          .body1
                                          .copyWith(
                                              color: Colors.grey[800],
                                              fontSize: 14),
                                      textAlign: TextAlign.justify,
                                    ),
                                  ),
                                ],
                              );
                            }),
                      ],
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
            StreamBuilder<Myths>(
                stream: mythBloc.subject.stream,
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
                                mythBloc.getMyth();
                              },
                              child: Text('Retry',
                                  style: TextStyle(color: Colors.white))),
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
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Icon(Icons.clear, color: Colors.red),
                                  SizedBox(width: 5),
                                  Expanded(
                                    child: Text(snapshot.data.data[i].myth
                                        .replaceAll("\n", " ")),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Icon(Icons.done, color: Colors.green),
                                  SizedBox(width: 5),
                                  Expanded(
                                    child: Text(
                                      snapshot.data.data[i].reality
                                          .replaceAll("\n", " "),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
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
                }),
          ],
        ),
      ),
    );
  }
}
