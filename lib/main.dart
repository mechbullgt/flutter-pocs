import 'package:flutter/material.dart';
import 'package:mrcounter/counter.dart';

void main() => runApp(new Center(
      child: new MyHome(),
    ));

// Stateless Widgets won't do anything to change state.
// Root of your application
class MyHome extends StatelessWidget {
  // Build method
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Ghar Depot',
      theme: new ThemeData(
        primarySwatch: Colors.purple,
      ),
      debugShowCheckedModeBanner: false,
      home: Counter(
        title: "Ghar Depot",
      ),
    );
  }
}
