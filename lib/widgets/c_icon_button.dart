import 'package:flutter/material.dart';

class CupertinoIconButton extends StatelessWidget {
  final onTap;
  final icon;
  
  const CupertinoIconButton({
    Key key,
    @required this.onTap,
    @required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: Container(
        child: icon,
      ),
    );
  }
}
