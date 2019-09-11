import 'package:flutter/material.dart';
import 'package:myapp/widget/drawer.dart';
import 'package:myapp/model/amc.dart';
import 'package:myapp/model/fund.dart';
import 'package:myapp/services/amc.dart';

class AMCScreen extends StatelessWidget {
  final String routeName = "/amcScreen";
  final AMC amc;
  AMCScreen({Key key, @required this.amc}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context, false),
        ),
        title: Text(amc.name),
      ),
      body: AMCFetchFund(
        amc: amc,
      ),
      drawer: AppDrawer(),
    );
  }
}

class AMCFetchFund extends StatefulWidget {
  final AMC amc;
  AMCFetchFund({Key key, @required this.amc}) : super(key: key);

  @override
  _AMCFetchFundState createState() => new _AMCFetchFundState();
}

class _AMCFetchFundState extends State<AMCFetchFund> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AMCService.getFunds(widget.amc),
      builder: (BuildContext context, AsyncSnapshot<List<Fund>> snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('${snapshot.data[index].name}'),
                );
              });
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}

class FundData extends StatelessWidget {
  final Fund fund;
  FundData({Key key, @required this.fund}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
