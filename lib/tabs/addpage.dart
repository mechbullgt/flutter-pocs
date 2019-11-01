import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key key}) : super(key: key);
  @override
  _BeamState createState() => new _BeamState();
}

class _BeamState extends State<AddPage> {
  String m20Ratio = "M20 Grade 1:1.5:3";
  var m20 = [1.5, 3];
  double sandRatio = 0;
  double aggregateRatio = 0;

  void setSandRatio(int grade) {
    if (grade == 20) {
      sandRatio = m20[0];
      debugPrint('Setting Sand Ratio:' + '$sandRatio');
    }
  }

  double getSandRatio(int grade) {
    double currentRatio;
    if (grade == 20) {
      currentRatio = sandRatio;
      debugPrint('Getting Sand Ratio:' + '$currentRatio');
    }
    return currentRatio;
  }

  void setAggregateRatio(int grade) {
    if (grade == 20) {
      aggregateRatio = (m20[1]).toDouble();
      debugPrint('Setting Aggregate Ratio:' + '$aggregateRatio');
    }
  }

  double getArrgregateRatio(double grade) {
    double currentRatio;
    if (grade == 20) {
      currentRatio = aggregateRatio;
      debugPrint('Getting Aggregate Ratio:' + '$currentRatio');
    }
    return currentRatio;
  }

  double _cementCounter = 0;
  double _sandCounter = 0;
  double _aggregateCounter = 0;

  void _incrementMethod(int grade) {
    setState(() {
      switch (grade) {
        case 20:
          {
            _cementCounter += 1;
            _sandCounter = _cementCounter * getSandRatio(20);
            _aggregateCounter = _cementCounter * getArrgregateRatio(20);
          }
          break;
        case 2:
          {
            _sandCounter += 1;
          }
          break;
        case 3:
          {
            _aggregateCounter += 1;
          }
          break;
      }
    });
  }

  void _decrementorMethod(int options) {
    setState(() {
      switch (options) {
        case 20:
          {
            if (_cementCounter > 0) {
              _cementCounter -= 1;
              _sandCounter = _cementCounter * getSandRatio(20);
              _aggregateCounter = _cementCounter * getArrgregateRatio(20);
            }
          }
          break;
        case 2:
          {
            if (_sandCounter > 0) {
              _sandCounter -= 1;
            }
          }
          break;
        case 3:
          {
            if (_aggregateCounter > 0) {
              _aggregateCounter -= 1;
            }
          }
          break;
      }
    });
  }

  void _incrementToastAction(BuildContext context, int x) {
    switch (x) {
      case 20:
        {
          _incrementMethod(20);
          // Fluttertoast.showToast(
          //     msg: "Cement +1",
          //     toastLength: Toast.LENGTH_SHORT,
          //     gravity: ToastGravity.CENTER,
          //     backgroundColor: Colors.grey[300],
          //     textColor: Colors.black,
          //     fontSize: 16.0);
        }
        break;
      case 2:
        {
          _incrementMethod(x);
        }
        break;
      case 3:
        {
          _incrementMethod(x);
        }
        break;
    }
  }

  void _decrementorAction(BuildContext context, int y) {
    switch (y) {
      case 20:
        {
          _decrementorMethod(20);
        }
        break;
      case 2:
        {
          _decrementorMethod(2);
        }
        break;
      case 3:
        {
          _decrementorMethod(3);
        }
        break;
    }
  }

  void feedNumbers(int grade) {
    if (grade == 20) {
      setSandRatio(20);
      setAggregateRatio(20);
      Fluttertoast.showToast(
        msg: "Selected Concrete Grade M20",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.grey[300],
        textColor: Colors.black,
        fontSize: 16.0,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Container firstContainer = new Container(
        child: new Row(
      children: <Widget>[
        new RaisedButton(
          padding: const EdgeInsets.all(8.0),
          textColor: Colors.white,
          color: Colors.blue,
          onPressed: () {
            debugPrint("Print from Raised button");
            feedNumbers(20);
          },
          child: new Text("Grade M20"),
        )
      ],
    ));

    Container belowFirstContainer = new Container(
      child: new Text('$_cementCounter',
          style: TextStyle(
              height: 0, fontSize: 30, color: Color.fromRGBO(64, 64, 64, 100))),
    );

    Container secondContainer = new Container(
        child: new Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        new FlatButton(
          child: new Text('Cement +1'),
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0)),
          color: Colors.green[300],
          onPressed: () {
            _incrementToastAction(context, 20);
          },
        ),
        new FlatButton(
          child: new Text('Cement -1'),
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0)),
          color: Colors.red[100],
          onPressed: () {
            _decrementorAction(context, 20);
          },
        ),
      ],
    ));

    Container thirdContainer = new Container(
        child: new Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        new Text('Sand \n $_sandCounter',
            style: TextStyle(
                height: 1.5,
                fontSize: 20,
                color: Color.fromRGBO(64, 64, 64, 100))),
        new Text('Aggregate \n $_aggregateCounter',
            style: TextStyle(
                height: 1.5,
                fontSize: 20,
                color: Color.fromRGBO(64, 64, 64, 100))),
      ],
    ));

    return Scaffold(
        body: Center(
            child: Container(
          padding: new EdgeInsets.all(5.0),
          alignment: Alignment.center,
          margin: EdgeInsets.all(40),
          constraints: BoxConstraints(
              maxHeight: 400, maxWidth: 400, minHeight: 300, minWidth: 200),
          child: Center(
            child: Column(
              children: <Widget>[
                firstContainer,
                SizedBox(
                  height: 50,
                ),
                belowFirstContainer,
                secondContainer,
                thirdContainer,
              ],
            ),
          ),
        )));
  }
}
