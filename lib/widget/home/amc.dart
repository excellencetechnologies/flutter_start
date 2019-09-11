import 'package:flutter/material.dart';
import 'package:myapp/model/post.dart';
import 'package:myapp/model/amc.dart';
import 'package:myapp/services/post.dart';
import 'package:myapp/services/amc.dart';

class MyDynamicData extends StatefulWidget {
  @override
  State<MyDynamicData> createState() {
    return MyDynamicDataState();
  }
}

class MyDynamicDataState extends State<MyDynamicData> {
  String textToDisplay = "";
  bool showLoader = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        showLoader ? CircularProgressIndicator() : Container(),
        Text("$textToDisplay "),
        FlatButton(
          child: Text("Test JSON"),
          onPressed: () async {
            setState(() {
              showLoader = true;
              textToDisplay = "";
            });
            Post post = await PostService.fetchPost();
            print(post.id);
            setState(() {
              showLoader = false;
              textToDisplay = post.title;
            });
          },
        )
      ],
    );
  }
}

class AMCList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new FutureBuilder<List<AMC>>(
      future: AMCService.getAMCList(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return CircularProgressIndicator();
        List<AMC> amcs = snapshot.data;
        return ListView.builder(
            itemCount: amcs.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  print("tapped");
                  Navigator.pushNamed(context, '/amc');
                },
                title: Text('${amcs[index].name}'),
              );
            });
      },
    );
  }
}

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
            child: MyDynamicData(),
          )
        ],
      ),
    );
  }
}

class AMCWidget extends StatelessWidget {
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
          child: AMCList(),
        )
      ],
    );
  }
}
