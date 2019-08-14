import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  final Function onChange;

  CustomCheckbox({Key key, @required this.onChange}) : super(key: key);

  Custom_CheckboxState createState() => Custom_CheckboxState();
}

class Custom_CheckboxState extends State<CustomCheckbox> {
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
        value: checked,
        onChanged: (value) {
          widget.onChange(!checked);
          setState(() {
            checked = !checked;
          });
        });
  }
}
