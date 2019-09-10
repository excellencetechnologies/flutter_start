import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:myapp/model/user.dart';
// class MyButton extends StatefulWidget {
//   String jsonString =
//       "{\"name\": \"John Smith\",\"email\": \"john@example.com\"}";

//   void _parseJSON() {
//     setState() {}
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FlatButton(
//       child: Text("Test JSON"),
//       onPressed: () {
//         _parseJSON();
//       },
//     );
//   }
// }

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
                FlatButton(
                  child: Text("Test JSON"),
                  onPressed: () {
                    String jsonString =
                        "{\"name\": \"John Smith\",\"email\": \"john@example.com\"}";

                    User user = User.fromJson(jsonDecode(jsonString));

                    print('Howdy, ${user.name}!');
                    print('We sent the verification link to ${user.email}.');
                  },
                )
              ],
            ),
          ),
          Flexible(
            child: Icon(
              Icons.info,
              color: Theme.of(context).primaryColorLight,
            ),
          )
        ],
      ),
    );
  }
}
