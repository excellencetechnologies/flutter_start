import 'package:flutter/material.dart';
import 'package:myapp/model/amc.dart';
import 'package:myapp/widget/amc_list.dart';


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
          )
        ],
      ),
    );
  }
}

class AMCWidget extends StatelessWidget {
  final List<AMC> amcList;
  AMCWidget(this.amcList);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AMCSummary(),
        Text(
          "AMC List",
          style: Theme.of(context).textTheme.title,
        ),
        Expanded(
          child: AMCListWidget(this.amcList),
        )
      ],
    );
  }
}
