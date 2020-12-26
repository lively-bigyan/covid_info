import 'package:corona_nepal/blocs/faq_bloc.dart';
import 'package:corona_nepal/locators.dart';
import 'package:corona_nepal/models/faq.dart';
import 'package:flutter/material.dart';

class FAQTab extends StatefulWidget {
  @override
  _FAQTabState createState() => _FAQTabState();
}

class _FAQTabState extends State<FAQTab> {
  bool _isNepali = false;
  FAQBloc faqBloc;
  @override
  void initState() {
    faqBloc = locator<FAQBloc>();
    faqBloc..getFAQ();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FAQ>(
        stream: faqBloc.subject.stream,
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
                      onPressed: () {},
                      child:
                          Text('Retry', style: TextStyle(color: Colors.white))),
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
                const SizedBox(height: 10),
                ListView.separated(
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    separatorBuilder: (context, i) {
                      return Divider(
                        height: 10,
                      );
                    },
                    padding: EdgeInsets.only(bottom: 20, left: 10, right: 20),
                    itemCount: snapshot.data.data.length,
                    itemBuilder: (context, i) {
                      final faq = snapshot.data.data[i];
                      return Column(
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                ('[${i + 1}] '),
                                style: Theme.of(context)
                                    .accentTextTheme
                                    .subtitle1
                                    .copyWith(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                              ),
                              Expanded(
                                child: Text(
                                  _isNepali
                                      ? "${faq.questionNp ?? "---"}"
                                      : "${faq.question}",
                                  style: Theme.of(context)
                                      .accentTextTheme
                                      .subtitle1
                                      .copyWith(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text(
                              (_isNepali
                                      ? "${faq.answerNp ?? "---"}"
                                      : "${faq.answer}")
                                  .replaceAll("\n", " "),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(
                                      color: Colors.grey[800], fontSize: 14),
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
        });
  }
}
