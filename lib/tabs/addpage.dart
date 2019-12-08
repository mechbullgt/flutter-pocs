import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key key}) : super(key: key);
  @override
  _AddPageState createState() => new _AddPageState();
}

class _AddPageState extends State<AddPage> {
  var formattedDate;
  var formattedDateWeekDay;
  static String _pickedDateString = '';
  int locationIndex;
  var siteLocations = <String>['Rainbow', 'Khurana', 'Sao', 'Bhadoria'];
  int labourIndex;
  var labourList = <String>['Ram', 'Sukru', 'Babu', 'Bansi'];

  Future _selectDate() async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2019),
        lastDate: new DateTime(2030));
    if (picked != null) setState(() => _pickedDateString = picked.toString());
  }

  dynamic checkDateString() {
    if (_pickedDateString.length < 1) {
      return new Text("\t\t" + "Please Select Date");
    }
    var date = DateTime.parse(_pickedDateString);
    formattedDate = "${date.day} / ${date.month} / ${date.year}";
    switch (date.weekday) {
      case 1:
        formattedDateWeekDay = "Monday";
        break;
      case 2:
        formattedDateWeekDay = "Tuesday";
        break;
      case 3:
        formattedDateWeekDay = "Wednesday";
        break;
      case 4:
        formattedDateWeekDay = "Thursday";
        break;
      case 5:
        formattedDateWeekDay = "Friday";
        break;
      case 6:
        formattedDateWeekDay = "Saturday";
        break;
      case 7:
        formattedDateWeekDay = "Sunday";
        break;
    }
    print(formattedDate);
    return new Text("\t\t\t" + formattedDateWeekDay + " " + formattedDate);
  }

  Container dateContainer() {
    return Container(
      padding: new EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: new Center(
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new InkWell(
                onTap: () {
                  Feedback.forTap(context);
                  _selectDate();
                },
                child: Icon(
                  Icons.date_range,
                  size: 30,
                )),
            checkDateString(),
          ],
        ),
      ),
    );
  }

  Container siteLocationDropDownContainer() {
    return new Container(
      padding: new EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Center(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            new Icon(
              Icons.location_city,
              size: 30,
            ),
            DropdownButton<String>(
              hint: new Text('\t\t' + 'Pickup a site'),
              value:
                  locationIndex == null ? null : siteLocations[locationIndex],
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
                  locationIndex = siteLocations.indexOf(newValue);
                });
              },
              items:
                  siteLocations.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text("\t\t\t" + value),
                );
              }).toList(),
            ),
          ])),
    );
  }

  dynamic addLabourController() {
    print("Add Labour");
    return new DropdownButton<String>(
      hint: new Text('\t\Select Name'),
      value: labourIndex == null ? null : labourList[labourIndex],
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
          labourIndex = labourList.indexOf(newValue);
        });
      },
      items: labourList.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text("\t\t\t" + value),
        );
      }).toList(),
    );
  }

// _updateLabourWidgetsList(){
//   setState(() {

//   });
// }

// List<Widget> labourWidgets=<Widget>[
//           new RaisedButton(
//             color: Colors.blue,
//             padding: const EdgeInsets.all(8.0),
//             child: Row(children: <Widget>[
//               Icon(Icons.person_add),
//               Text('\t\tAdd Labour')
//             ]),
//             onPressed: _updateLabourWidgetsList,
//           ),
//         ];

  Container addLabourContainer() {
    return Container(
      child: Column(children: <Widget>[
        Text(
          "Add Labour Details Below",
          textScaleFactor: 1.2,
        ),
        Column(children: <Widget>[
          addLabourController(),
          addLabourController(),
          addLabourController(),
          addLabourController(),
          addLabourController(),
          addLabourController(),
        ]),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Column(
        children: <Widget>[
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                dateContainer(),
                siteLocationDropDownContainer(),
              ]),
          addLabourContainer()
        ],
      ),
    );
  }
}
