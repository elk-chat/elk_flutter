import 'dart:async';

import 'package:elk_chat/init_websocket.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import 'package:bloc/bloc.dart';
import 'contact.dart';
import '../../repositorys/contact_repository.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  final ContactRepository contactRepository;

  ContactBloc({@required this.contactRepository});

  @override
  Stream<ContactState> transform(
    Stream<ContactEvent> events,
    Stream<ContactState> Function(ContactEvent event) next,
  ) {
    return super.transform(
      (events as Observable<ContactEvent>).debounceTime(
        Duration(milliseconds: 500),
      ),
      next,
    );
  }

  @override
  get initialState => ContactUninitialized();

  @override
  Stream<ContactState> mapEventToState(ContactEvent event) async* {
    if (event is ClearContact) {
      // yield ContactLoaded(contacts: [], hasReachedMax: false);
      yield ContactUninitialized();
    }
    if (event is FetchContactList && !_hasReachedMax(currentState)) {
      try {
        final contacts = await contactRepository.getContacts();
        // 提示更新完成+1
        $WS.emit(UPDATING);
        yield ContactLoaded(
            contacts:
                contacts.where((i) => i.userID != event.selfUserID).toList(),
            hasReachedMax: false);
        return;
      } catch (_) {
        $WS.emit(UPDATING);
        print('FetchContactList error: $_');
        yield ContactError();
      }
    }
  }

  bool _hasReachedMax(ContactState state) =>
      state is ContactLoaded && state.hasReachedMax;
}
