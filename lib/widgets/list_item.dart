import 'package:elk_chat/theme_cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ListItem extends StatelessWidget {
  final GestureTapCallback onTap;
  final Widget title;
  final Widget leading;
  final Widget trailing;
  final BoxDecoration decoration;
  
  const ListItem({
    Key key,
    this.onTap,
    @required this.title,
    this.leading,
    this.trailing,
    this.decoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> rowChildren = [];
    if(leading != null) {
      rowChildren.add(leading);
    }
    if(title != null) {
      rowChildren.add(Center(child: title));
    }
    if(trailing != null) {
      rowChildren.add(trailing);
    }
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: Container(
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Color(0xffffffff),
          border: Border(
            top: BorderSide(
              color: Themes.borderColor,
              width: 1.0,
            )
          )
        ),
        child: Row(
          children: rowChildren,
        ),
      ),
    );
  }
}
