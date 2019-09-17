import 'package:flutter/material.dart';
import 'package:myapp/model/amc.dart';
import 'package:myapp/screens/amc.dart';

class AMCListWidget extends StatelessWidget {
  final List<AMC> amcList;
  AMCListWidget(this.amcList);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: amcList.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AMCDetailScreen(
                            amc: amcList[index],
                          )));
            },
            title: Text('${amcList[index].name}'),
          );
        });
  }
}
