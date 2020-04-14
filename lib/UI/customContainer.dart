import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final Color color; 
  final Color textColor;
  final title, number;
  CustomContainer({this.color, this.number, this.title, this.textColor});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          textColor.withOpacity(0.4),
          textColor.withOpacity(0.2),
          textColor.withOpacity(0.6)
        ],
        stops: [0.4,0.6,1],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color:color, width: 3),
        // color: color,
      ),
      padding: EdgeInsets.all(5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(title,
              style:
                  Theme.of(context).textTheme.headline.copyWith(color: textColor)),
          Text(number.toString(),
              style: Theme.of(context).textTheme.display1.copyWith(
                  color: textColor,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2))
        ],
      ),
    );
  }
}
