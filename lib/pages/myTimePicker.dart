import 'package:flutter/material.dart';

class MyTimePicker extends StatefulWidget {
  const MyTimePicker({super.key});

  @override
  State<MyTimePicker> createState() => _MyTimePickerState();
}

class _MyTimePickerState extends State<MyTimePicker> {
  TimeOfDay _timeOfDay = TimeOfDay.now();
  Future<void> _selectTime() async {
    TimeOfDay? _picked =
        await showTimePicker(context: context, initialTime: _timeOfDay);
    if (_picked != null) {
      setState(() {
        _timeOfDay = _picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MaterialButton(
            height: 50,
            minWidth: 200,
            color: Colors.teal,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: const Text(
              'Open Time Picker',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            onPressed: () => {_selectTime()}),
        SizedBox(
          height: 10,
        ),
        Text(
          '${_timeOfDay.hour}:${_timeOfDay.minute}',
          style: TextStyle(fontSize: 20),
        )
      ],
    );
  }
}
