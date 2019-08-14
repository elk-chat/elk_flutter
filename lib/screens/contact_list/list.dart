import 'package:elk_chat/blocs/blocs.dart';
import 'package:elk_chat/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactList extends StatefulWidget {
  final Widget beforeWidget;
  final Function onTap;
  final Function onChange;
  final bool hasCheckbox;

  ContactList(
      {Key key,
      this.onTap,
      this.beforeWidget,
      this.hasCheckbox = false,
      this.onChange})
      : super(key: key);

  _ContactListState createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  ContactBloc _contactBloc;

  @override
  void initState() {
    super.initState();
    _contactBloc = BlocProvider.of<ContactBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactBloc, ContactState>(
      bloc: _contactBloc,
      builder: (context, state) {
        // if (state is ContactError) {
        //   return Center(
        //     child: Text('failed to fetch contacts'),
        //   );
        // }

        if (state is ContactLoaded) {
          if (state.contacts.isEmpty) {
            return Center(
              child: Text('no contacts'),
            );
          }
          var contacts = [];
          int beforeLength = 0;
          if (widget.beforeWidget != null) {
            beforeLength = 1;
            contacts.add({});
          }
          contacts.addAll(state.contacts);
          return CupertinoScrollbar(
              child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              if (beforeLength == 1 && index == 0) {
                return widget.beforeWidget;
              }
              var contact = contacts[index];

              return ContactWidget(
                  key: ValueKey(contact.userID),
                  hasCheckbox: widget.hasCheckbox,
                  onChange: widget.onChange,
                  avatarSize: 42.0,
                  contact: contact,
                  onTap: () => widget.onTap(contact));
            },
            itemCount: contacts.length,
            separatorBuilder: (BuildContext context, int index) {
              if (beforeLength == 1 && index == 0) {
                return Container();
              }
              return Container(
                margin: const EdgeInsets.only(left: 66),
                decoration: BoxDecoration(
                  border: Border(
                      top: const BorderSide(color: Colors.black12, width: 0.5)),
                ),
              );
            },
          ));
        }
        return Center(
          child: CupertinoActivityIndicator(
            radius: 10,
          ),
        );
      },
    );
  }
}
