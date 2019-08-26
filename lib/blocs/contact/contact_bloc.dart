import 'dart:async';

import 'package:elk_chat/init_websocket.dart';
import 'package:bloc/bloc.dart';
import 'contact.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  @override
  get initialState => ContactUninitialized();

  @override
  Stream<ContactState> mapEventToState(ContactEvent event) async* {
    if (event is ClearContact) {
      // yield ContactLoaded(contacts: [], hasReachedMax: false);
      yield ContactUninitialized();
    }
    if (event is FetchContactList) {
      try {
        final contacts = await $CH.contactApi.getContacts();
        // 提示更新完成+1
        $WS.emit(UPDATING);
        yield ContactLoaded(
          contacts:
              contacts.where((i) => i.userID != event.selfUserID).toList(),
        );
        return;
      } catch (_) {
        $WS.emit(UPDATING);
        print('FetchContactList error: $_');
        yield ContactError();
      }
    }

    if (event is AddContact) {
      if (currentState is ContactLoaded) {
        var contacts = (currentState as ContactLoaded).contacts.toList();
        contacts.insert(0, event.user);
        yield ContactLoaded(contacts: contacts);
      }
    }
  }
}
