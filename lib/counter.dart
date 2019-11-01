import 'package:flutter/material.dart';
import 'package:mrcounter/tabs/beams.dart';
import 'package:mrcounter/tabs/footing.dart';
import 'package:mrcounter/tabs/placeholder.dart';
import 'package:mrcounter/tabs/slab.dart';

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
  int _currentIndex = 0;
  // final List<Widget> _navChildren = [Footing(), Slab(),Beams()];

  final List<Widget> _navChildren = [
  PlaceholderWidget(Colors.red),
  PlaceholderWidget(Colors.green),
  PlaceholderWidget(Colors.yellow),
  ];
  void _incrementTab(index) {
    setState(() {
      _currentIndex = index;
    });
  }

  BottomNavigationBar getBottomNavBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.shifting,
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.note_add, color: Color.fromARGB(255, 0, 0, 0)),
            title: new Text(
              'Add Data',
              style: TextStyle(color: Colors.black),
            )),
        BottomNavigationBarItem(
            icon:
                Icon(Icons.remove_red_eye, color: Color.fromARGB(255, 0, 0, 0)),
            title: new Text(
              'View Data',
              style: TextStyle(color: Colors.black),
            )),
        BottomNavigationBarItem(
            icon: Icon(Icons.face, color: Color.fromARGB(255, 0, 0, 0)),
            title: new Text(
              'Future',
              style: TextStyle(color: Colors.black),
            )),
      ],
      onTap: (index) {
        print(index);
        _incrementTab(index);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(widget.title),
        ),
        body: Center(
          child: Column(
            children: _navChildren,
          ),
        ),
        bottomNavigationBar: getBottomNavBar());
  }
}
