import 'package:flutter/material.dart';

import '../theme_cupertino.dart';

class Divid extends StatelessWidget {
  const Divid({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Themes.borderColor,
            width: 1.0,
          )
        )
      ),
    );
  }
}
