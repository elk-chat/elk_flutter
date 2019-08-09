import 'package:elk_chat/protocol/protobuf/koi.pb.dart';
import 'package:equatable/equatable.dart';

abstract class ContactState extends Equatable {
  ContactState([List props = const []]) : super(props);
}

class ContactUninitialized extends ContactState {
  @override
  String toString() => 'ContactUninitialized';
}

class ContactError extends ContactState {
  @override
  String toString() => 'ContactError';
}

class ContactLoaded extends ContactState {
  final List<User> contacts;
  final bool hasReachedMax;

  ContactLoaded({
    this.contacts,
    this.hasReachedMax,
  }) : super([contacts, hasReachedMax]);

  ContactLoaded copyWith({
    List<User> contacts,
    bool hasReachedMax,
  }) {
    return ContactLoaded(
      contacts: contacts ?? this.contacts,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  String toString() =>
      'ContactLoaded { contacts: ${contacts.length}, hasReachedMax: $hasReachedMax }';
}
