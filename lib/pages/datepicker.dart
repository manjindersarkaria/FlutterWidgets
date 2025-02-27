import 'package:flutter/material.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({super.key});

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  Future<void> _selectDate() async {
    DateTime? _picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));
    if (_picked != null) {
      setState(() {
        _dateController.text = _picked.toString().split(" ")[0];
      });
    }
  }

  final _dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30.0),
      child: TextField(
        controller: _dateController,
        readOnly: true,
        onTap: () {
          _selectDate();
        },
        decoration: InputDecoration(
            labelStyle: TextStyle(fontSize: 14), // Adjust the font size
            floatingLabelBehavior: FloatingLabelBehavior.always,
            filled: true,
            prefixIcon: Icon(Icons.calendar_today),
            enabledBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.blue))),
      ),
    );
  }
}
