import 'package:flutter/material.dart';

class CustomTableRow extends StatelessWidget {
  final left, right;
  CustomTableRow({this.left, this.right});
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: <Widget>[
          Expanded(
              flex: 2,
              child: Text(
                left,
                style: Theme.of(context)
                    .textTheme
                    .subtitle2
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 16),
              )),
          VerticalDivider(
            width: 0,
          ),
          Expanded(
              flex: 4,
              child: Center(
                child: Text((right == '') ? 'n/a' : right),
              )),
        ],
      ),
    );
  }
}
