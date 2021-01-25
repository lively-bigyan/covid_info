import 'package:flutter/material.dart';

class SymptomsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.fromLTRB(20, 10, 10, 20),
      children: <Widget>[
        const SizedBox(
          height: 10,
        ),
        Text(
            'Patients start to show symptoms within 2-14 days if infected. '
            'In rare cases, symptoms can surface after 21 days too.',
            style: Theme.of(context).textTheme.subtitle1),
        const SizedBox(
          height: 16,
        ),
        Text('Common Symptoms:', style: Theme.of(context).textTheme.headline6),
        Text('1. Fever', style: Theme.of(context).textTheme.subtitle1),
        Text('2. Cough [Dry]', style: Theme.of(context).textTheme.subtitle1),
        Text('3. Tiredness/Fatigue',
            style: Theme.of(context).textTheme.subtitle1),
        const SizedBox(
          height: 20,
        ),
        Text('Other Symptoms:',
            style: Theme.of(context)
                .textTheme
                .subtitle1
                .copyWith(fontWeight: FontWeight.bold)),
        Text('1. Shortness of Breath',
            style: Theme.of(context).textTheme.subtitle1),
        Text('2. Aches and Pains',
            style: Theme.of(context).textTheme.subtitle1),
        Text('3. Sore Throat', style: Theme.of(context).textTheme.subtitle1),
        const SizedBox(
          height: 5,
        ),
        Text('Very few people will report diarrhoea, nausea or a runny nose.',
            style: Theme.of(context)
                .textTheme
                .subtitle1
                .copyWith(color: Colors.grey[800])),
      ],
    );
  }
}
