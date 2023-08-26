import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    required this.icon,
    required this.txt,
    this.func,
    this.contextFunc,
    super.key,
  });

  final IconData icon;
  final String txt;
  final Function? func;
  final Function(BuildContext context)? contextFunc;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          func == null ? contextFunc!(context) : func!();
        },
        child: Row(
          children: [Icon(icon), Text(txt)],
        ));
  }
}

class MyButtonAsync extends StatelessWidget {
  const MyButtonAsync({
    required this.icon,
    required this.txt,
    required this.contextFunc,
    super.key,
  });

  final IconData icon;
  final String txt;
  //final Function? func;
  final Function(BuildContext context) contextFunc;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () async {
          contextFunc(context);
        },
        child: Row(
          children: [Icon(icon), Text(txt)],
        ));
  }
}
