import 'package:flutter/material.dart';
import 'package:unitConverter/model.dart';

class WeightConverter extends StatefulWidget {
  @override
  _WeightConverterState createState() => _WeightConverterState();
}

class _WeightConverterState extends State<WeightConverter> {
  int _fromValue = 1;
  int _toValue = 1;
  double inputValue, result;
  bool foundResult = false;
  TextEditingController textEditingController = TextEditingController();

  List<ListItem> _dropdownItems = [
    ListItem(1, "miligram"),
    ListItem(2, "gram"),
    ListItem(3, "kilogram"),
    ListItem(4, "tons"),
  ];
  List<DropdownMenuItem<ListItem>> _dropdownMenuItems;
  ListItem _fromItem, _toItem;
  void initState() {
    super.initState();
    _dropdownMenuItems = buildDropDownMenuItems(_dropdownItems);
    _fromItem = _dropdownMenuItems[0].value;
    _toItem = _dropdownMenuItems[0].value;
  }

  List<DropdownMenuItem<ListItem>> buildDropDownMenuItems(List listItems) {
    List<DropdownMenuItem<ListItem>> items = List();
    for (ListItem listItem in listItems) {
      items.add(
        DropdownMenuItem(
          child: Text(listItem.name),
          value: listItem,
        ),
      );
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weight Converter'),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        width: double.infinity,
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 40,
                  margin: EdgeInsets.all(10),
                  child: Text('Value'),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  width: 200,
                  child: TextField(
                     keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: 'Enter Value'),
                    controller: textEditingController,
                  ),
                )
              ],
            ),
            Row(
              children: [
                Container(
                  width: 40,
                  margin: EdgeInsets.all(10),
                  child: Text('From'),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: DropdownButton<ListItem>(
                    value: _fromItem,
                    items: _dropdownMenuItems,
                    onChanged: (value) {
                      setState(() {
                        _fromItem = value;
                        _fromValue = value.value;
                      });
                    },
                  ),
                )
              ],
            ),
            Row(
              children: [
                Container(
                  width: 40,
                  margin: EdgeInsets.all(10),
                  child: Text('To'),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: DropdownButton<ListItem>(
                    value: _toItem,
                    items: _dropdownMenuItems,
                    onChanged: (value) {
                      setState(() {
                        _toItem = value;
                        _toValue = value.value;
                      });
                    },
                  ),
                )
              ],
            ),
            Center(
              child: Builder(
                builder: (context) => RaisedButton(
                  onPressed: () {
                    try {
                      inputValue = double.parse(textEditingController.text);
                    } catch (exception) {
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text('Invalid Input'),
                        backgroundColor: Colors.red,
                        duration: Duration(seconds: 2),
                      ));
                      return;
                    }
                    if (_fromValue == 1 && _toValue == 2) {
                      result = inputValue * 0.001;
                    }
                    if (_fromValue == 1 && _toValue == 3) {
                      result = inputValue * 0.000001;
                    }
                    if (_fromValue == 1 && _toValue == 4) {
                      result = inputValue * 1.0E-9;
                    }
                    if (_fromValue == 2 && _toValue == 1) {
                      result = inputValue * 1000;
                    }
                    if (_fromValue == 2 && _toValue == 3) {
                      result = inputValue * 0.001;
                    }
                    if (_fromValue == 2 && _toValue == 4) {
                      result = inputValue * 1.0E-6;
                    }
                    if (_fromValue == 3 && _toValue == 1) {
                      result = inputValue * 1000000;
                    }
                    if (_fromValue == 3 && _toValue == 2) {
                      result = inputValue * 1000;
                    }
                    if (_fromValue == 3 && _toValue == 4) {
                      result = inputValue * 0.001;
                    }
                    if (_fromValue == 4 && _toValue == 1) {
                      result = inputValue * 1000000000;
                    }
                    if (_fromValue == 4 && _toValue == 2) {
                      result = inputValue * 1000000;
                    }
                    if (_fromValue == 4 && _toValue == 3) {
                      result = inputValue * 1000;
                    } else if (_fromValue == _toValue) {
                      result = inputValue;
                    }
                    setState(() {
                      foundResult = true;
                    });
                  },
                  child: Text(
                    'Convert',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                  color: Colors.blue,
                ),
              ),
            ),
            if (foundResult)
              Container(
                margin: EdgeInsets.only(top: 30),
                child: Center(
                  child: Text(
                    '${result}',
                    style: TextStyle(fontSize: 20, color: Colors.red),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
