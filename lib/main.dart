import 'package:asyn_task/body.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("ASyn Task"),
          leading: const Icon(Icons.construction),
          // backgroundColor: Colors.blue,
        ),
        body: MyBody(),
      ),
    );
  }
}
