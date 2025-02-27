import 'package:flutter/material.dart';

import 'animatedDialog.dart';

class MyBottomSheet extends StatefulWidget {
  const MyBottomSheet({super.key});

  @override
  State<MyBottomSheet> createState() => _MyBottomSheetState();
}

class _MyBottomSheetState extends State<MyBottomSheet> {
  Future _displayBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        barrierColor: Colors.black87.withOpacity(0.5),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
        builder: (context) => const SizedBox(
              height: 200,
              child: Center(
                child: Text(
                  'FLUTTER GUYS',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              AnimatedDialog(),
              MaterialButton(
                  height: 50,
                  minWidth: 200,
                  color: Colors.teal,
                  child: const Text(
                    'Open Bottom Sheet',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  onPressed: () => {_displayBottomSheet(context)}),
            ],
          ),
        ));
  }
}
