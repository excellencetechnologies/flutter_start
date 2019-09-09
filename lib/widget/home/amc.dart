import 'package:flutter/material.dart';

class AMCSummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Mutual Fund AMC's",
                  style: Theme.of(context).textTheme.title,
                ),
                Text("21 AMC's in DB"),
                Text("15 AMC's in DB"),
                Text("17th July, last amc cron pass"),
              ],
            ),
          ),
          Flexible(
            child: Icon(Icons.info, color: Theme.of(context).primaryColorLight,),
          )
        ],
      ),
    );
  }
}
