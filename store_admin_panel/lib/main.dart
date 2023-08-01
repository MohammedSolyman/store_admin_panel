import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.red,
                  )),
              Expanded(
                  flex: 4,
                  child: Container(
                    color: Colors.yellow,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
