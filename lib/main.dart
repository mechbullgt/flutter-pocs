import 'package:flutter/material.dart';
import 'package:new_to/counter.dart';

void main() => runApp(new Center(
      child: new MyApp(),
    ));

// Stateless Widgets won't do anything to change state.
// Root of your application
class MyApp extends StatelessWidget {
  // Build method
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Mr. Counter',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Counter(title: "Mr. Counter",),
    );
  }
}

// class SplitCalculator extends StatelessWidget {
//   final cementSection = new Container(
//       child: new Column(children: <Widget>[
//     new FlatButton(
//       child: new Text("1",
//           textScaleFactor: 2, style: TextStyle(fontStyle: FontStyle.italic)),
//       onPressed: () {},
//     )
//   ]));

//   final sandSection = new Container(
//     child: new Text("2"),
//   );
//   final aggregateSection = new Container(
//     child: new Text("3"),
//   );

//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       body: new Container(
//         child: new Row(
//           children: <Widget>[cementSection, sandSection, aggregateSection],
//         ),
//       ),
//     );
//   }
// }

