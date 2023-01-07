import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yos/ui/widgets/example_widget.dart';
import 'main.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        create: (_) => ViewModel(),
        child:  ExampleWidget(),
      ),
    );
  }
}