import 'dart:async';
import 'package:elk_chat/protocol/api_util/api_util.dart';

import 'package:elk_chat/protocol/protobuf/koi.pb.dart';

class ContactApi {
  UserGetFullUsersReq _UserGetFullUsersReq = UserGetFullUsersReq();
  ContactGetContactsReq _ContactGetContactsReq = ContactGetContactsReq();

  Future<List<User>> getContacts() async {
    Completer _completer = Completer<List<User>>();

    getContactList(_ContactGetContactsReq, (data) {
      if (data.hasError) {
        _completer.completeError(data.res);
      } else {
        getFullUsers(data.res.contacts, _UserGetFullUsersReq, (result) {
          if (result.hasError) {
            _completer.completeError(result.res);
          } else {
            _completer.complete(result.res.users);
          }
        });
      }
    });

    return _completer.future;
  }
}
