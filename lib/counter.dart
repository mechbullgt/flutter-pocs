import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// This Widget is Stateful because it's managing the state of the counter.
class Counter extends StatefulWidget {
  Counter({Key key, this.title}) : super(key: key);

  // It's being passed in title, you can see above.
  final String title;

  // => Flutter Home Demo Page
  // Stateful Widgets don't have build methods.
  // They have createState() methods.
  // Create State returns a class that extends Flutters State class.
  @override
  _CounterState createState() => new _CounterState();

  // Stateful Widgets are rarely more complicated than this.
}

// This is the state that MyHomePage created.
class _CounterState extends State<Counter> {
  int _cementCounter = 0;
  int _sandCounter = 0;
  int _aggregateCounter = 0;

  void _incrementMethod(int options) {
    setState(() {
      switch (options) {
        case 1:
          {
            _cementCounter += 1;
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
        case 1:
          {
            if (_cementCounter > 0) {
              _cementCounter -= 1;
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

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(title: new Text(widget.title)),
        body: Builder(builder: (BuildContext context) {
          return new Container(
            padding: new EdgeInsets.all(15.0),
            margin: const EdgeInsets.only(left: 0, right: 0),
            alignment: Alignment.center,
            child: new Center(
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      child: new Column(
                    children: <Widget>[
                      new Text('$_cementCounter',
                          style: TextStyle(
                              height: 1.5,
                              fontSize: 100,
                              color: Color.fromRGBO(64, 64, 64, 100))),
                      new FlatButton(
                        child: new Text('Cement +1'),
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        color: Colors.green[300],
                        onPressed: () {
                          _incrementToastAction(context, 1);
                        },
                      ),
                      new FlatButton(
                        child: new Text('Cement -1'),
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        color: Colors.red[100],
                        onPressed: () {
                          _decrementorAction(context, 1);
                        },
                      ),
                    ],
                  )),
                  Container(
                      child: new Column(
                    children: <Widget>[
                      new Text('$_sandCounter',
                          style: TextStyle(
                              height: 1.5,
                              fontSize: 100,
                              color: Color.fromRGBO(64, 64, 64, 100))),
                      new FlatButton(
                        child: new Text('Sand +1'),
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        color: Colors.green[300],
                        onPressed: () {
                          _incrementToastAction(context, 2);
                        },
                      ),
                      new FlatButton(
                        child: new Text('Sand -1'),
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        color: Colors.red[100],
                        onPressed: () {
                          _decrementorAction(context, 2);
                        },
                      ),
                    ],
                  )),
                  Container(
                      child: new Column(
                    children: <Widget>[
                      new Text('$_aggregateCounter',
                          style: TextStyle(
                              height: 1.5,
                              fontSize: 100,
                              color: Color.fromRGBO(64, 64, 64, 100))),
                      new FlatButton(
                        child: new Text('Aggregate +1'),
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        color: Colors.green[300],
                        onPressed: () {
                          _incrementToastAction(context, 3);
                        },
                      ),
                      new FlatButton(
                        child: new Text('Aggregate -1'),
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        color: Colors.red[100],
                        onPressed: () {
                          _decrementorAction(context, 3);
                        },
                      ),
                    ],
                  ))
                ],
              ),
            ),
          );
        }));
  }

  void _cementIncrementSnackBarAction(BuildContext context) {
    _incrementMethod(1);
    Scaffold.of(context).showSnackBar(new SnackBar(
      content: new Text("Increased by 1"),
    ));
  }

  void _incrementToastAction(BuildContext context, int x) {
    switch (x) {
      case 1:{
      _incrementMethod(x);
      // Fluttertoast.showToast(
      //     msg: "Cement +1",
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.CENTER,
      //     backgroundColor: Colors.grey[300],
      //     textColor: Colors.black,
      //     fontSize: 16.0);
      } break;
      case 2:{
      _incrementMethod(x);
      } break;
      case 3:{
      _incrementMethod(x);
      }
        break;
  }
  }

  void _decrementorAction(BuildContext context, int y) {
    switch (y) {
      case 1:
        {
          _decrementorMethod(1);
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
}
