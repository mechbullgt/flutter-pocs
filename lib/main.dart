import 'package:flutter/material.dart';
import 'package:mrcounter/counter.dart';

void main() => runApp(new Center(
      child: new MyHome(),
    ));

// Stateless Widgets won't do anything to change state.
// Root of your application
class MyHome extends StatefulWidget {
  MyHomeState createState() => MyHomeState();
}

// SingleTickerProviderStateMixin is used for animation
class MyHomeState extends State<MyHome> with SingleTickerProviderStateMixin {
  // Create a tab controller
  TabController controller;

  @override
  void initState() {
    super.initState();

    // Initialize the Tab Controller
    controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // Dispose of the Tab Controller
    controller.dispose();
    super.dispose();
  }

  TabBar getTabBar() {
    return TabBar(
      tabs: <Tab>[
        Tab(
          // set icon to the tab
          // icon: Icon(Icons.favorite),
          text: "Slabs",
        ),
        Tab(
          icon: Icon(Icons.adb),
        ),
        Tab(
          icon: Icon(Icons.airport_shuttle),
        ),
      ],
      // setup the controller
      controller: controller,
    );
  }

  TabBarView getTabBarView(var tabs) {
    return TabBarView(
      // Add tabs as widgets
      children: tabs,
      // set the controller
      controller: controller,
    );
  }

  // Build method
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Mr. Counter',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: Counter(
        title: "Mr Counter",
      ),
    );
  }
}
