import 'package:flutter/material.dart';

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
  void _cementCounterMethod() {
    setState(() {
      _cementCounter += 1;
    });
  }

  int _sandCounter = 0;
  void _sandCounterMethod() {
    setState(() {
      _sandCounter += 1;
    });
  }

  int _aggregateCounter = 0;
  void _aggregateCounterMethod() {
    setState(() {
      _aggregateCounter += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(title: new Text(widget.title)),
        body: new Container(
          padding: new EdgeInsets.all(15.0),
          margin: const EdgeInsets.only(left: 0,right: 0),
          alignment: Alignment.center,
          child: new Center(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    child: new Column(
                      children: <Widget>[
                      new Text('$_cementCounter'),
                      new FlatButton(
                        child: new Text('Cement +1'),
                        onPressed: _cementCounterMethod,
                    )
                  ],
                )),
                Container(
                    child: new Column(
                      children: <Widget>[
                      new Text('$_sandCounter'),
                      new FlatButton(
                        child: new Text('Sand +1'),
                        onPressed: _sandCounterMethod,
                    )
                  ],
                )),
                Container(
                    child: new Column(
                      children: <Widget>[
                        new Text('$_aggregateCounter'),
                        new FlatButton(
                          child: new Text('Aggregate +1'),
                          onPressed: _aggregateCounterMethod,
                        )
                  ],
                ))
              ],
            ),
          ),
        ));
  }
}
