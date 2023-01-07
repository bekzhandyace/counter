import 'package:flutter/material.dart';
import 'package:yos/ui/widgets/example_widget.dart';
import 'my_app.dart';

void main() {
  runApp(MaterialApp(
    home: MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyApp(),
    );
  }
}
