import 'package:flutter/material.dart';
import 'package:elk_chat/protocol/protobuf/koi.pb.dart';
import 'widgets.dart';

class ContactWidget extends StatefulWidget {
  final User contact;
  final Function onTap;
  final double avatarSize;

  final bool hasCheckbox;
  final Function onChange;

  ContactWidget(
      {Key key,
      this.hasCheckbox = false,
      this.onChange,
      this.contact,
      this.onTap,
      this.avatarSize})
      : super(key: key);

  _ContactWidgetState createState() => _ContactWidgetState();
}

class _ContactWidgetState extends State<ContactWidget> {
  bool checked = false;

  void onChange(value) {
    setState(() {
      checked = value;
    });
    widget.onChange(value, widget.contact);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: widget.hasCheckbox
            ? () {
                onChange(!checked);
              }
            : widget.onTap,
        child: Row(
          children: <Widget>[
            widget.hasCheckbox
                ? Checkbox(value: checked, onChanged: onChange)
                : Container(),
            Container(
                padding:
                    EdgeInsets.only(left: 12, right: widget.avatarSize / 4),
                child: Img(
                  key: Key('${widget.contact.avatarFileID}'),
                  width: widget.avatarSize,
                  height: widget.avatarSize,
                  fileID: widget.contact.avatarFileID,
                  title: widget.contact.userName,
                )),
            Container(
                padding:
                    EdgeInsets.symmetric(vertical: widget.avatarSize / (2)),
                child: Text(
                  widget.contact.userName,
                  style: TextStyle(
                      fontSize: widget.avatarSize / (2.5),
                      fontWeight: FontWeight.w400),
                ))
          ],
        ));
  }
}