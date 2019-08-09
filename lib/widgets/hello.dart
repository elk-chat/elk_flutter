// Flutter

import 'package:flutter/widgets.dart';

class Hello extends StatelessWidget {
  final String text;
  final TextDirection direction;
  Hello({@required this.text, this.direction = TextDirection.ltr});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      'Hello $text',
      textDirection: direction,
    ));
  }
}
