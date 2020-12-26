import 'package:flutter/material.dart';

class PreventionTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      children: <Widget>[
        Text('Here are some of the prevention measures according to WHO.',
            style: Theme.of(context).textTheme.headline6),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("1. ",
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    .copyWith(fontWeight: FontWeight.bold)),
            Expanded(
              child: Text(
                  "Wash your hands regularly with soap and water, or clean them with alcohol-based hand rub.",
                  style: Theme.of(context).accentTextTheme.subtitle1),
            ),
          ],
        ),
        const SizedBox(height: 2),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("2. ",
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    .copyWith(fontWeight: FontWeight.bold)),
            Expanded(
              child: Text(
                  "Maintain at least 1 metre distance between you and people coughing or sneezing.",
                  style: Theme.of(context).accentTextTheme.subtitle1),
            ),
          ],
        ),
        const SizedBox(height: 2),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("3. ",
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    .copyWith(fontWeight: FontWeight.bold)),
            Expanded(
              child: Text("Avoid touching your face.",
                  style: Theme.of(context).accentTextTheme.subtitle1),
            ),
          ],
        ),
        const SizedBox(height: 2),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("4. ",
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    .copyWith(fontWeight: FontWeight.bold)),
            Expanded(
              child: Text(
                  "Cover your mouth and nose when coughing or sneezing.",
                  style: Theme.of(context).accentTextTheme.subtitle1),
            ),
          ],
        ),
        const SizedBox(height: 2),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("5. ",
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    .copyWith(fontWeight: FontWeight.bold)),
            Expanded(
              child: Text("Stay home if you feel unwell.",
                  style: Theme.of(context).accentTextTheme.subtitle1),
            ),
          ],
        ),
        const SizedBox(height: 2),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("6. ",
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    .copyWith(fontWeight: FontWeight.bold)),
            Expanded(
              child: Text(
                  "Refrain from smoking and other activities that weaken the lungs.",
                  style: Theme.of(context).accentTextTheme.subtitle1),
            ),
          ],
        ),
        const SizedBox(height: 2),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("7. ",
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    .copyWith(fontWeight: FontWeight.bold)),
            Expanded(
              child: Text(
                  "Practice physical distancing by avoiding unnecessary travel and staying away from large groups of people.",
                  style: Theme.of(context).accentTextTheme.subtitle1),
            ),
          ],
        ),
      ],
    );
  }
}
