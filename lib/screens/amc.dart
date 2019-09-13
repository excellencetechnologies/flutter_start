import 'package:flutter/material.dart';
import 'package:myapp/services/post.dart';
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
      body: Column(
        children: <Widget>[
          Flexible(
            child: FundFilterType(),
          ),
          Expanded(
            child: AMCFetchFund(
              amc: amc,
            ),
          )
        ],
      ),
      drawer: AppDrawer(),
    );
  }
}

class FundFilterType extends StatefulWidget {
  @override
  _FundFilterTypeState createState() => new _FundFilterTypeState();
}

class _FundFilterTypeState extends State<FundFilterType> {
  String categoryFilter;
  String subFilter;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Flexible(
            child: FutureBuilder(
              future: AMCService.getFundCategoryFilter(),
              builder:
                  (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
                if (snapshot.hasData) {
                  return DropdownButton<String>(
                    value: categoryFilter,
                    icon: Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        categoryFilter = newValue;
                      });
                    },
                    items: snapshot.data
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  );
                } else {
                  return CircularProgressIndicator();
                }
              },
            )),
        Flexible(
          child: categoryFilter != null
              ? FutureBuilder(
                  future: AMCService.getFundSubCategoryFilter(categoryFilter),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<String>> snapshot) {
                    if (snapshot.hasData) {
                      return DropdownButton<String>(
                        value: subFilter,
                        icon: Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 16,
                        style: TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (String newValue) {
                          setState(() {
                            subFilter = newValue;
                          });
                        },
                        items: snapshot.data
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                )
              : Container(),
        ),
        Flexible(
          child: FlatButton(
            child: Text("Reset"),
            onPressed: () {
              setState(() {
                categoryFilter = null;
                subFilter = null;
              });
            },
          ),
        )
      ],
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
