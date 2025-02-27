import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:instagram_widgets/pages/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SemanticsBinding.instance.ensureSemantics();
  runApp(MaterialApp(initialRoute: '/', routes: {'/': (context) => Home()}));
}
