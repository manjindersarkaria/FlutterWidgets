import 'package:flutter/material.dart';

class MyDropDown extends StatefulWidget {
  const MyDropDown({super.key});

  @override
  State<MyDropDown> createState() => _MyDropDownState();
}

class _MyDropDownState extends State<MyDropDown> {
  String _dropdownValue = '1';

  final _items = ['1', '2', '3', '4', '5'];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 80,
      decoration: BoxDecoration(
          color: Color(0xffEBEDFE), borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: DropdownButton(
          items: _items.map((String item) {
            return DropdownMenuItem(value: item, child: Text(item));
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              _dropdownValue = newValue!;
            });
          },
          value: _dropdownValue,
          borderRadius: BorderRadius.circular(10),
          icon: const Icon(Icons.keyboard_arrow_down),
          iconSize: 50,
          style: TextStyle(fontSize: 30, color: Colors.black),
          underline: Container(),
        ),
      ),
    );
  }
}
