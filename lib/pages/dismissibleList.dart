import 'package:flutter/material.dart';

class DismissibleList extends StatefulWidget {
  const DismissibleList({super.key});

  @override
  State<DismissibleList> createState() => _DismissibleListState();
}

class _DismissibleListState extends State<DismissibleList> {
  List<String> items = [
    "Dart",
    "Kotlin",
    "Java",
    "Swift",
    "Python",
    "Go",
    "Java Script",
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Dismissible(
              background: Container(
                height: 50,
                color: Colors.red,
                margin: EdgeInsets.only(top: 10),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Delete',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              confirmDismiss: (DismissDirection direction) async {
                if (direction == DismissDirection.startToEnd) {
                  return await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text(
                              'Are you sure you want to delete this cart?'),
                          actions: <Widget>[
                            ElevatedButton(
                                onPressed: () =>
                                    Navigator.of(context).pop(true),
                                child: const Text("Yes")),
                            ElevatedButton(
                                onPressed: () =>
                                    Navigator.of(context).pop(false),
                                child: const Text("No"))
                          ],
                        );
                      });
                } else {
                  return await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('You are about to save this cart?'),
                          actions: <Widget>[
                            ElevatedButton(
                                onPressed: () =>
                                    Navigator.of(context).pop(true),
                                child: const Text("Yes")),
                            ElevatedButton(
                                onPressed: () =>
                                    Navigator.of(context).pop(false),
                                child: const Text("No"))
                          ],
                        );
                      });
                }
                return null;
              },
              secondaryBackground: Container(
                height: 50,
                color: Colors.green,
                margin: EdgeInsets.only(top: 10),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Save',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.right,
                  ),
                ),
              ),
              key: ValueKey<String>(items[index]),
              child: Container(
                  color: Color(0xffEBEDFE),
                  margin: const EdgeInsets.only(top: 10),
                  height: 50,
                  child: Center(child: Text(items[index]))));
        });
  }
}
