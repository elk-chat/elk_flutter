import 'package:elk_chat/widgets/list_item.dart';
import 'package:flutter/material.dart';
import 'package:elk_chat/protocol/protobuf/koi.pb.dart';
import 'widgets.dart';

class ContactWidget extends StatefulWidget {
  final User user;
  final Function onTap;
  final double avatarSize;

  final bool hasCheckbox;
  final bool checked;
  final Function onChange;

  ContactWidget(
      {Key key,
      this.hasCheckbox = false,
      this.checked,
      this.onChange,
      @required this.user,
      this.onTap,
      @required this.avatarSize})
      : super(key: key);

  _ContactWidgetState createState() => _ContactWidgetState();
}

class _ContactWidgetState extends State<ContactWidget> {
  bool checked = false;

  @override
  void initState() {
    checked = widget.checked;
    super.initState();
  }

  @override
  void didUpdateWidget(ContactWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.hasCheckbox && checked != widget.checked) {
      setState(() {
        checked = widget.checked;
      });
    }
  }

  void onChange(value) {
    setState(() {
      checked = value;
    });
    widget.onChange(value, widget.user);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.hasCheckbox
      ? () {
          onChange(!checked);
        }
      : widget.onTap,
      child: Material(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            widget.hasCheckbox
              ? Checkbox(value: checked, onChanged: onChange)
              : Container(),
            Flexible(
              child: ListItem(
                padding: 8.0,
                title: Text(
                  widget.user.userName,
                  style: TextStyle(
                    fontSize: widget.avatarSize / (2.5),
                    fontWeight: FontWeight.w400
                  ),
                ),
                leading: Img(
                  key: Key('${widget.user.avatarFileID}'),
                  width: widget.avatarSize,
                  height: widget.avatarSize,
                  fileID: widget.user.avatarFileID,
                  title: widget.user.userName,
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}
