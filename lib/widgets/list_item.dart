import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ListItem extends StatelessWidget {
  final GestureTapCallback onTap;
  final Widget title;
  final Widget leading;
  final Widget trailing;
  
  const ListItem({
    Key key,
    this.onTap,
    @required this.title,
    this.leading,
    this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.black12,
              width: 1.0,
            )
          )
        ),
        child: Row(
          children: <Widget>[
            // leading,
            title,
            // trailing,
          ],
        ),
      ),
    );
  }
}
