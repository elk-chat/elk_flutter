import 'package:flutter/material.dart';

class IconBadge extends StatelessWidget {
  final int count;
  final IconData icon;
  final double size;
  final Color color;

  IconBadge(
      {Key key,
      @required this.count,
      @required this.icon,
      this.size,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var children = <Widget>[
      Icon(
        icon,
        size: size,
        color: this?.color,
      )
    ];
    if (count > 0) {
      children.add(Positioned(
        right: -0.0,
        top: -0.0,
        child: Container(
          padding: EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(8),
          ),
          constraints: BoxConstraints(
            minWidth: 14,
            minHeight: 14,
          ),
          child: Text(
            '$count',
            style: TextStyle(
              color: Colors.white,
              fontSize: 9,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ));
    }
    return Stack(children: children);
  }
}
