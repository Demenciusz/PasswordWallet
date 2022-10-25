import 'package:flutter/material.dart';

class MyCheckBox extends StatefulWidget {
  MyCheckBox(bool this.v, this.change);
  bool v;
  final Function(bool myvalue) change;
  @override
  State<MyCheckBox> createState() => _MyCheckBoxState();
}

class _MyCheckBoxState extends State<MyCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: widget.v,
      onChanged: (bool? value) {
        setState(() {
          widget.v = value!;

          widget.change(widget.v);
        });
      },
    );
  }
}
