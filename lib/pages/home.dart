import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_widgets/pages/stepWidget.dart';
import 'package:instagram_widgets/pages/datepicker.dart';
import 'package:instagram_widgets/pages/myBottomSheet.dart';

import 'myImagePicker.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    MyImagePicker(),
    StepWidget(),
    DatePicker(),
    MyBottomSheet(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedIndex,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(_selectedIndex == 0
                    ? 'assets/images/home-bold.svg'
                    : 'assets/images/home-outline.svg'),
                label: '',
              ),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(_selectedIndex == 1
                      ? 'assets/images/icons8-widget.svg'
                      : 'assets/images/search-outline.svg'),
                  label: ''),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(_selectedIndex == 2
                      ? 'assets/images/add-square-bold.svg'
                      : 'assets/images/add-square-outline.svg'),
                  label: ''),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(_selectedIndex == 3
                      ? 'assets/images/video-play-bold.svg'
                      : 'assets/images/video-play-outline.svg'),
                  label: '')
            ]),
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 120.0, 0.0, 0.0),
                child: _pages[_selectedIndex])));
  }
}
