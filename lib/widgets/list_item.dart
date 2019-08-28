import 'package:flutter/widgets.dart';

class ListItem extends StatelessWidget {
  final onTap;
  final title;
  final leading;
  
  const ListItem({
    Key key,
    @required this.onTap,
    @required this.title,
    @required this.leading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: Container(
        child: Row(
          children: <Widget>[
            title
          ],
        ),
      ),
    );
  }
}
