import 'package:flutter/material.dart';

class MyTabBar extends StatefulWidget {
  const MyTabBar({super.key});

  @override
  State<MyTabBar> createState() => _MyTabBarState();
}

class _MyTabBarState extends State<MyTabBar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Column(
        // Or Scaffold(body: Column(...))
        children: [
          TabBar(
            tabs: [
              Tab(icon: Icon(Icons.directions_car)),
              Tab(icon: Icon(Icons.directions_transit)),
              Tab(icon: Icon(Icons.directions_bike)),
              Tab(icon: Icon(Icons.directions_boat)),
              Tab(icon: Icon(Icons.directions_bus)),
              Tab(icon: Icon(Icons.directions_railway))
            ],
            isScrollable: true,
          ),
          SizedBox(
            height: 100,
            // Important to make the TabBarView take up remaining space
            child: TabBarView(
              children: [
                Center(
                    child: Text(
                  'Car',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                )),
                Center(
                  child: Text('Transit',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                ),
                Center(
                    child: Text('Bike',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500))),
                Center(
                    child: Text('Boat',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500))),
                Center(
                    child: Text('Bus',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500))),
                Center(
                    child: Text('Railway',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
