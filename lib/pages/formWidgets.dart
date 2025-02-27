import 'package:flutter/material.dart';

import 'package:instagram_widgets/pages/datepicker.dart';
import 'package:instagram_widgets/pages/myDropdown.dart';

import 'myTabBar.dart';
import 'myTimePicker.dart';

class FormWidgets extends StatefulWidget {
  const FormWidgets({super.key});

  @override
  State<FormWidgets> createState() => _FormWidgetsState();
}

class _FormWidgetsState extends State<FormWidgets> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyTimePicker(),
        SizedBox(
          height: 20,
        ),
        DatePicker(),
        SizedBox(
          height: 20,
        ),
        MyDropDown(),
        SizedBox(
          height: 20,
        ),
        MyTabBar()
      ],
    );
  }
}
