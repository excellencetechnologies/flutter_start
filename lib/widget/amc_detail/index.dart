import 'package:flutter/material.dart';
import 'package:myapp/model/amc.dart';
import 'package:myapp/model/fund.dart';

class FundFilterType extends StatefulWidget {
  final List<String> categoryList;
  final List<String> subCategoryList;
  final Function(String) onChangeCategoryFilter;

  FundFilterType(
      {@required this.categoryList,
      @required this.subCategoryList,
      @required this.onChangeCategoryFilter}) {
  }

  @override
  _FundFilterTypeState createState() => new _FundFilterTypeState();
}

class _FundFilterTypeState extends State<FundFilterType> {
  String categoryFilter;
  String subFilter;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Flexible(
            child: DropdownButton<String>(
              hint: Text("Fund Type"),
          value: categoryFilter,
          isExpanded: true,
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
              this.widget.onChangeCategoryFilter(newValue);
            });
          },
          items: this
              .widget
              .categoryList
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        )),
        Flexible(
            child: DropdownButton<String>(
              hint: Text("Fund Sub Type"),
          isExpanded: true,
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
          items: this
              .widget
              .subCategoryList
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        )),
        Flexible(
          flex: 0,
          child: IconButton(
            alignment: Alignment.centerRight,
            icon: Icon(Icons.close),
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

class AMCFetchFund extends StatelessWidget {
  final AMC amc;
  final List<Fund> funds;
  AMCFetchFund({Key key, @required this.amc, @required this.funds})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: funds.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('${funds[index].name}'),
          );
        });
  }
}
