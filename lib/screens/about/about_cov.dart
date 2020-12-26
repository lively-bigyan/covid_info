import 'package:corona_nepal/screens/about/faq_section.dart';
import 'package:corona_nepal/screens/about/myth_section.dart';
import 'package:corona_nepal/screens/about/prevention_section.dart';
import 'package:corona_nepal/screens/about/symptoms_section.dart';
import 'package:flutter/material.dart';

class AboutCov extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text("About COVID-19"),
          bottom: TabBar(
            isScrollable: true,
            labelStyle: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(fontSize: 18, fontWeight: FontWeight.w600),
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
            SymptomsTab(),
            PreventionTab(),
            FAQTab(),
            MythTab()
          ],
        ),
      ),
    );
  }
}
