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
      return new Text("Please Select Date");
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
      padding: new EdgeInsets.all(18.0),
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

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Center(
      child: Column(
        children: <Widget>[
          dateContainer(),
        ],
      ),
    ));
  }
}
