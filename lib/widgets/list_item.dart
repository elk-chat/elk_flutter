import 'package:elk_chat/theme_cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ListItem extends StatelessWidget {
  final GestureTapCallback onTap;
  final Widget title;
  final Widget leading;
  final Widget trailing;
  final BoxDecoration decoration;
  final bool topBorder;
  final bool actionTip;
  final padding;
  final Color bgColor;
  
  const ListItem({
    Key key,
    this.onTap,
    @required this.title,
    this.leading,
    this.trailing,
    this.decoration,
    this.topBorder = true,
    this.padding = 12.0,
    this.actionTip = false,
    this.bgColor = const Color(0xffffffff),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> rowChildren = [];
    if(leading != null) {
      rowChildren.add(
        Padding(
          padding: EdgeInsets.only(right: 10.0),
          child: leading,
        )
      );
    }
    if(title != null) {
      rowChildren.add(
        Expanded(child: title)
      );
    }
    if(trailing != null) {
      rowChildren.add(
        Padding(
          padding: EdgeInsets.only(right: 10.0),
          child: trailing,
        )
      );
    }
    if(actionTip) {
      rowChildren.add(
        Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Icon(Icons.keyboard_arrow_right),
        )
      );
    }
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: Container(
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
          color: bgColor,
          border: Border(
            top: topBorder ? BorderSide(
              color: Themes.borderColor,
              width: 1.0,
            ) : BorderSide.none
          )
        ),
        child: Row(
          children: rowChildren,
        ),
      ),
    );
  }
}
