import 'package:flutter/material.dart';
import 'package:elk_chat/protocol/protobuf/koi.pb.dart';
import 'widgets.dart';

class ContactWidget extends StatelessWidget {
  final User contact;
  final Function onTap;
  final double avatarSize;

  const ContactWidget(
      {Key key, @required this.contact, @required this.avatarSize, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Row(
          children: <Widget>[
            Container(
                padding: EdgeInsets.only(left: 12, right: avatarSize / 4),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(6.0),
                    child: Avatar(
                      key: Key('${contact.avatarFileID}'),
                      width: avatarSize,
                      height: avatarSize,
                      avatarFileID: contact.avatarFileID,
                      userName: contact.userName,
                    ))),
            Container(
                padding: EdgeInsets.symmetric(vertical: avatarSize / (2)),
                child: Text(
                  contact.userName,
                  style: TextStyle(fontSize: avatarSize / (2.5)),
                ))
          ],
        ));
  }
}
