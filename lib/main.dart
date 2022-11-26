import 'package:flutter/material.dart';
import 'package:yos/example_widget.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('my Appp'),
        backgroundColor: Colors.blue,
      ),
      body: ExampleWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
    );
  }
}
