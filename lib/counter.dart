import 'package:flutter/material.dart';
import 'package:mrcounter/tabs/beams.dart';
import 'package:mrcounter/tabs/footing.dart';
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
class _CounterState extends State<Counter> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  TabBar getTabBar() {
    return TabBar(
      tabs: <Tab>[
        Tab(
          // set icon to the tab
          icon: Icon(Icons.clear_all),
          text: "Slabs",
        ),
        Tab(
          icon: Icon(Icons.crop_16_9),
          text: "Columns &\n Beams",
        ),
        Tab(
          icon: Icon(Icons.border_clear),
          text: "Footing",
        ),
      ],
      // setup the controller
      controller: _tabController,
    );
  }

  TabBarView getTabBarView(var tabs) {
    return TabBarView(
      // Add tabs as widgets
      children: tabs,
      // set the controller
      controller: _tabController,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
        bottom: getTabBar(),
      ),
      body: getTabBarView(<Widget>[Slab(),Beams(), Footing()]),
    );
  }
}
