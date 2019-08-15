import 'package:flutter/material.dart';

/// 头发丝效果空隔
class EDivider extends StatelessWidget {
  final double indent;
  final double endIndent;
  const EDivider({Key key, this.indent = 0.0, this.endIndent = 0.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: indent, right: endIndent),
      decoration: BoxDecoration(
        border:
            Border(top: const BorderSide(color: Colors.black12, width: 0.5)),
      ),
    );
  }
}
