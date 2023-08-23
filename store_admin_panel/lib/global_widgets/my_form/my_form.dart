import 'package:flutter/material.dart';

OutlineInputBorder myBorder(BuildContext context, double width, [Color? col]) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: BorderSide(
        color: col ?? Theme.of(context).textTheme.bodyLarge!.color!,
        width: width),
  );
}

class MyForm extends StatelessWidget {
  const MyForm(
      {required this.controller,
      required this.label,
      this.isObsecure,
      super.key});

  final TextEditingController controller;
  final String label;
  final bool? isObsecure;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isObsecure == true ? true : false,
      style: Theme.of(context).textTheme.bodyLarge,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: Theme.of(context).textTheme.bodyLarge,
        enabledBorder: myBorder(context, 2),
        focusedBorder: myBorder(context, 5),
        focusedErrorBorder: myBorder(context, 5, Colors.red),
      ),
    );
  }
}
