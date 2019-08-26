///
//  Generated code. Do not modify.
//  source: lib/protocol/protobuf/koi.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core show bool, Deprecated, double, int, List, Map, override, pragma, String;

import 'package:fixnum/fixnum.dart';
import 'package:protobuf/protobuf.dart' as $pb;

class Error extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Error', package: const $pb.PackageName('kproto'))
    ..aOS(1, 'code')
    ..aOS(2, 'message')
    ..hasRequiredFields = false
  ;

  Error._() : super();
  factory Error() => create();
  factory Error.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Error.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Error clone() => Error()..mergeFromMessage(this);
  Error copyWith(void Function(Error) updates) => super.copyWith((message) => updates(message as Error));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Error create() => Error._();
  Error createEmptyInstance() => create();
  static $pb.PbList<Error> createRepeated() => $pb.PbList<Error>();
  static Error getDefault() => _defaultInstance ??= create()..freeze();
  static Error _defaultInstance;

  $core.String get code => $_getS(0, '');
  set code($core.String v) { $_setString(0, v); }
  $core.bool hasCode() => $_has(0);
  void clearCode() => clearField(1);

  $core.String get message => $_getS(1, '');
  set message($core.String v) { $_setString(1, v); }
  $core.bool hasMessage() => $_has(1);
  void clearMessage() => clearField(2);
}

class Success extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Success', package: const $pb.PackageName('kproto'))
    ..hasRequiredFields = false
  ;

  Success._() : super();
  factory Success() => create();
  factory Success.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Success.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Success clone() => Success()..mergeFromMessage(this);
  Success copyWith(void Function(Success) updates) => super.copyWith((message) => updates(message as Success));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Success create() => Success._();
  Success createEmptyInstance() => create();
  static $pb.PbList<Success> createRepeated() => $pb.PbList<Success>();
  static Success getDefault() => _defaultInstance ??= create()..freeze();
  static Success _defaultInstance;
}

class Paging extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Paging', package: const $pb.PackageName('kproto'))
    ..aInt64(1, 'allCount')
    ..aInt64(2, 'pageIndex')
    ..aInt64(3, 'pageSize')
    ..hasRequiredFields = false
  ;

  Paging._() : super();
  factory Paging() => create();
  factory Paging.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Paging.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Paging clone() => Paging()..mergeFromMessage(this);
  Paging copyWith(void Function(Paging) updates) => super.copyWith((message) => updates(message as Paging));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Paging create() => Paging._();
  Paging createEmptyInstance() => create();
  static $pb.PbList<Paging> createRepeated() => $pb.PbList<Paging>();
  static Paging getDefault() => _defaultInstance ??= create()..freeze();
  static Paging _defaultInstance;

  Int64 get allCount => $_getI64(0);
  set allCount(Int64 v) { $_setInt64(0, v); }
  $core.bool hasAllCount() => $_has(0);
  void clearAllCount() => clearField(1);

  Int64 get pageIndex => $_getI64(1);
  set pageIndex(Int64 v) { $_setInt64(1, v); }
  $core.bool hasPageIndex() => $_has(1);
  void clearPageIndex() => clearField(2);

  Int64 get pageSize => $_getI64(2);
  set pageSize(Int64 v) { $_setInt64(2, v); }
  $core.bool hasPageSize() => $_has(2);
  void clearPageSize() => clearField(3);
}

class TimeRange extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('TimeRange', package: const $pb.PackageName('kproto'))
    ..aInt64(1, 'startTime')
    ..aInt64(2, 'endTime')
    ..hasRequiredFields = false
  ;

  TimeRange._() : super();
  factory TimeRange() => create();
  factory TimeRange.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TimeRange.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  TimeRange clone() => TimeRange()..mergeFromMessage(this);
  TimeRange copyWith(void Function(TimeRange) updates) => super.copyWith((message) => updates(message as TimeRange));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TimeRange create() => TimeRange._();
  TimeRange createEmptyInstance() => create();
  static $pb.PbList<TimeRange> createRepeated() => $pb.PbList<TimeRange>();
  static TimeRange getDefault() => _defaultInstance ??= create()..freeze();
  static TimeRange _defaultInstance;

  Int64 get startTime => $_getI64(0);
  set startTime(Int64 v) { $_setInt64(0, v); }
  $core.bool hasStartTime() => $_has(0);
  void clearStartTime() => clearField(1);

  Int64 get endTime => $_getI64(1);
  set endTime(Int64 v) { $_setInt64(1, v); }
  $core.bool hasEndTime() => $_has(1);
  void clearEndTime() => clearField(2);
}

class StateAck extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('StateAck', package: const $pb.PackageName('kproto'))
    ..aInt64(1, 'chatID')
    ..a<Int64>(2, 'messageID', $pb.PbFieldType.OU6, Int64.ZERO)
    ..a<Int64>(3, 'state', $pb.PbFieldType.OU6, Int64.ZERO)
    ..hasRequiredFields = false
  ;

  StateAck._() : super();
  factory StateAck() => create();
  factory StateAck.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StateAck.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  StateAck clone() => StateAck()..mergeFromMessage(this);
  StateAck copyWith(void Function(StateAck) updates) => super.copyWith((message) => updates(message as StateAck));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static StateAck create() => StateAck._();
  StateAck createEmptyInstance() => create();
  static $pb.PbList<StateAck> createRepeated() => $pb.PbList<StateAck>();
  static StateAck getDefault() => _defaultInstance ??= create()..freeze();
  static StateAck _defaultInstance;

  Int64 get chatID => $_getI64(0);
  set chatID(Int64 v) { $_setInt64(0, v); }
  $core.bool hasChatID() => $_has(0);
  void clearChatID() => clearField(1);

  Int64 get messageID => $_getI64(1);
  set messageID(Int64 v) { $_setInt64(1, v); }
  $core.bool hasMessageID() => $_has(1);
  void clearMessageID() => clearField(2);

  Int64 get state => $_getI64(2);
  set state(Int64 v) { $_setInt64(2, v); }
  $core.bool hasState() => $_has(2);
  void clearState() => clearField(3);
}

class StateUpdate extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('StateUpdate', package: const $pb.PackageName('kproto'))
    ..aInt64(1, 'chatID')
    ..aInt64(2, 'senderID')
    ..a<Int64>(3, 'messageID', $pb.PbFieldType.OU6, Int64.ZERO)
    ..a<$core.int>(4, 'messageType', $pb.PbFieldType.O3)
    ..a<Int64>(5, 'state', $pb.PbFieldType.OU6, Int64.ZERO)
    ..aInt64(6, 'actionTime')
    ..a<UpdateMessage>(7, 'updateMessage', $pb.PbFieldType.OM, UpdateMessage.getDefault, UpdateMessage.create)
    ..hasRequiredFields = false
  ;

  StateUpdate._() : super();
  factory StateUpdate() => create();
  factory StateUpdate.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StateUpdate.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  StateUpdate clone() => StateUpdate()..mergeFromMessage(this);
  StateUpdate copyWith(void Function(StateUpdate) updates) => super.copyWith((message) => updates(message as StateUpdate));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static StateUpdate create() => StateUpdate._();
  StateUpdate createEmptyInstance() => create();
  static $pb.PbList<StateUpdate> createRepeated() => $pb.PbList<StateUpdate>();
  static StateUpdate getDefault() => _defaultInstance ??= create()..freeze();
  static StateUpdate _defaultInstance;

  Int64 get chatID => $_getI64(0);
  set chatID(Int64 v) { $_setInt64(0, v); }
  $core.bool hasChatID() => $_has(0);
  void clearChatID() => clearField(1);

  Int64 get senderID => $_getI64(1);
  set senderID(Int64 v) { $_setInt64(1, v); }
  $core.bool hasSenderID() => $_has(1);
  void clearSenderID() => clearField(2);

  Int64 get messageID => $_getI64(2);
  set messageID(Int64 v) { $_setInt64(2, v); }
  $core.bool hasMessageID() => $_has(2);
  void clearMessageID() => clearField(3);

  $core.int get messageType => $_get(3, 0);
  set messageType($core.int v) { $_setSignedInt32(3, v); }
  $core.bool hasMessageType() => $_has(3);
  void clearMessageType() => clearField(4);

  Int64 get state => $_getI64(4);
  set state(Int64 v) { $_setInt64(4, v); }
  $core.bool hasState() => $_has(4);
  void clearState() => clearField(5);

  Int64 get actionTime => $_getI64(5);
  set actionTime(Int64 v) { $_setInt64(5, v); }
  $core.bool hasActionTime() => $_has(5);
  void clearActionTime() => clearField(6);

  UpdateMessage get updateMessage => $_getN(6);
  set updateMessage(UpdateMessage v) { setField(7, v); }
  $core.bool hasUpdateMessage() => $_has(6);
  void clearUpdateMessage() => clearField(7);
}

class UpdateMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UpdateMessage', package: const $pb.PackageName('kproto'))
    ..a<UpdateMessageChatAddMember>(1, 'updateMessageChatAddMember', $pb.PbFieldType.OM, UpdateMessageChatAddMember.getDefault, UpdateMessageChatAddMember.create)
    ..a<UpdateMessageChatSendMessage>(2, 'updateMessageChatSendMessage', $pb.PbFieldType.OM, UpdateMessageChatSendMessage.getDefault, UpdateMessageChatSendMessage.create)
    ..a<UpdateMessageChatReadMessage>(3, 'updateMessageChatReadMessage', $pb.PbFieldType.OM, UpdateMessageChatReadMessage.getDefault, UpdateMessageChatReadMessage.create)
    ..a<UpdateMessageChatDeleteMember>(4, 'updateMessageChatDeleteMember', $pb.PbFieldType.OM, UpdateMessageChatDeleteMember.getDefault, UpdateMessageChatDeleteMember.create)
    ..a<UpdateMessageChatSetTyping>(5, 'updateMessageChatSetTyping', $pb.PbFieldType.OM, UpdateMessageChatSetTyping.getDefault, UpdateMessageChatSetTyping.create)
    ..a<UpdateMessageChatDeleteMessage>(6, 'updateMessageChatDeleteMessage', $pb.PbFieldType.OM, UpdateMessageChatDeleteMessage.getDefault, UpdateMessageChatDeleteMessage.create)
    ..a<UpdateMessageChatPinMessage>(7, 'updateMessageChatPinMessage', $pb.PbFieldType.OM, UpdateMessageChatPinMessage.getDefault, UpdateMessageChatPinMessage.create)
    ..hasRequiredFields = false
  ;

  UpdateMessage._() : super();
  factory UpdateMessage() => create();
  factory UpdateMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UpdateMessage clone() => UpdateMessage()..mergeFromMessage(this);
  UpdateMessage copyWith(void Function(UpdateMessage) updates) => super.copyWith((message) => updates(message as UpdateMessage));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateMessage create() => UpdateMessage._();
  UpdateMessage createEmptyInstance() => create();
  static $pb.PbList<UpdateMessage> createRepeated() => $pb.PbList<UpdateMessage>();
  static UpdateMessage getDefault() => _defaultInstance ??= create()..freeze();
  static UpdateMessage _defaultInstance;

  UpdateMessageChatAddMember get updateMessageChatAddMember => $_getN(0);
  set updateMessageChatAddMember(UpdateMessageChatAddMember v) { setField(1, v); }
  $core.bool hasUpdateMessageChatAddMember() => $_has(0);
  void clearUpdateMessageChatAddMember() => clearField(1);

  UpdateMessageChatSendMessage get updateMessageChatSendMessage => $_getN(1);
  set updateMessageChatSendMessage(UpdateMessageChatSendMessage v) { setField(2, v); }
  $core.bool hasUpdateMessageChatSendMessage() => $_has(1);
  void clearUpdateMessageChatSendMessage() => clearField(2);

  UpdateMessageChatReadMessage get updateMessageChatReadMessage => $_getN(2);
  set updateMessageChatReadMessage(UpdateMessageChatReadMessage v) { setField(3, v); }
  $core.bool hasUpdateMessageChatReadMessage() => $_has(2);
  void clearUpdateMessageChatReadMessage() => clearField(3);

  UpdateMessageChatDeleteMember get updateMessageChatDeleteMember => $_getN(3);
  set updateMessageChatDeleteMember(UpdateMessageChatDeleteMember v) { setField(4, v); }
  $core.bool hasUpdateMessageChatDeleteMember() => $_has(3);
  void clearUpdateMessageChatDeleteMember() => clearField(4);

  UpdateMessageChatSetTyping get updateMessageChatSetTyping => $_getN(4);
  set updateMessageChatSetTyping(UpdateMessageChatSetTyping v) { setField(5, v); }
  $core.bool hasUpdateMessageChatSetTyping() => $_has(4);
  void clearUpdateMessageChatSetTyping() => clearField(5);

  UpdateMessageChatDeleteMessage get updateMessageChatDeleteMessage => $_getN(5);
  set updateMessageChatDeleteMessage(UpdateMessageChatDeleteMessage v) { setField(6, v); }
  $core.bool hasUpdateMessageChatDeleteMessage() => $_has(5);
  void clearUpdateMessageChatDeleteMessage() => clearField(6);

  UpdateMessageChatPinMessage get updateMessageChatPinMessage => $_getN(6);
  set updateMessageChatPinMessage(UpdateMessageChatPinMessage v) { setField(7, v); }
  $core.bool hasUpdateMessageChatPinMessage() => $_has(6);
  void clearUpdateMessageChatPinMessage() => clearField(7);
}

class UpdateMessageChatAddMember extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UpdateMessageChatAddMember', package: const $pb.PackageName('kproto'))
    ..aInt64(1, 'chatID')
    ..aOS(2, 'senderName')
    ..aOS(3, 'addedMemeberName')
    ..hasRequiredFields = false
  ;

  UpdateMessageChatAddMember._() : super();
  factory UpdateMessageChatAddMember() => create();
  factory UpdateMessageChatAddMember.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateMessageChatAddMember.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UpdateMessageChatAddMember clone() => UpdateMessageChatAddMember()..mergeFromMessage(this);
  UpdateMessageChatAddMember copyWith(void Function(UpdateMessageChatAddMember) updates) => super.copyWith((message) => updates(message as UpdateMessageChatAddMember));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateMessageChatAddMember create() => UpdateMessageChatAddMember._();
  UpdateMessageChatAddMember createEmptyInstance() => create();
  static $pb.PbList<UpdateMessageChatAddMember> createRepeated() => $pb.PbList<UpdateMessageChatAddMember>();
  static UpdateMessageChatAddMember getDefault() => _defaultInstance ??= create()..freeze();
  static UpdateMessageChatAddMember _defaultInstance;

  Int64 get chatID => $_getI64(0);
  set chatID(Int64 v) { $_setInt64(0, v); }
  $core.bool hasChatID() => $_has(0);
  void clearChatID() => clearField(1);

  $core.String get senderName => $_getS(1, '');
  set senderName($core.String v) { $_setString(1, v); }
  $core.bool hasSenderName() => $_has(1);
  void clearSenderName() => clearField(2);

  $core.String get addedMemeberName => $_getS(2, '');
  set addedMemeberName($core.String v) { $_setString(2, v); }
  $core.bool hasAddedMemeberName() => $_has(2);
  void clearAddedMemeberName() => clearField(3);
}

class UpdateMessageChatDeleteMember extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UpdateMessageChatDeleteMember', package: const $pb.PackageName('kproto'))
    ..aInt64(1, 'chatID')
    ..aOS(2, 'senderName')
    ..aOS(3, 'deletedMemeberName')
    ..hasRequiredFields = false
  ;

  UpdateMessageChatDeleteMember._() : super();
  factory UpdateMessageChatDeleteMember() => create();
  factory UpdateMessageChatDeleteMember.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateMessageChatDeleteMember.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UpdateMessageChatDeleteMember clone() => UpdateMessageChatDeleteMember()..mergeFromMessage(this);
  UpdateMessageChatDeleteMember copyWith(void Function(UpdateMessageChatDeleteMember) updates) => super.copyWith((message) => updates(message as UpdateMessageChatDeleteMember));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateMessageChatDeleteMember create() => UpdateMessageChatDeleteMember._();
  UpdateMessageChatDeleteMember createEmptyInstance() => create();
  static $pb.PbList<UpdateMessageChatDeleteMember> createRepeated() => $pb.PbList<UpdateMessageChatDeleteMember>();
  static UpdateMessageChatDeleteMember getDefault() => _defaultInstance ??= create()..freeze();
  static UpdateMessageChatDeleteMember _defaultInstance;

  Int64 get chatID => $_getI64(0);
  set chatID(Int64 v) { $_setInt64(0, v); }
  $core.bool hasChatID() => $_has(0);
  void clearChatID() => clearField(1);

  $core.String get senderName => $_getS(1, '');
  set senderName($core.String v) { $_setString(1, v); }
  $core.bool hasSenderName() => $_has(1);
  void clearSenderName() => clearField(2);

  $core.String get deletedMemeberName => $_getS(2, '');
  set deletedMemeberName($core.String v) { $_setString(2, v); }
  $core.bool hasDeletedMemeberName() => $_has(2);
  void clearDeletedMemeberName() => clearField(3);
}

class UpdateMessageChatSendMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UpdateMessageChatSendMessage', package: const $pb.PackageName('kproto'))
    ..a<ChatMessage>(1, 'chatMessage', $pb.PbFieldType.OM, ChatMessage.getDefault, ChatMessage.create)
    ..hasRequiredFields = false
  ;

  UpdateMessageChatSendMessage._() : super();
  factory UpdateMessageChatSendMessage() => create();
  factory UpdateMessageChatSendMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateMessageChatSendMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UpdateMessageChatSendMessage clone() => UpdateMessageChatSendMessage()..mergeFromMessage(this);
  UpdateMessageChatSendMessage copyWith(void Function(UpdateMessageChatSendMessage) updates) => super.copyWith((message) => updates(message as UpdateMessageChatSendMessage));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateMessageChatSendMessage create() => UpdateMessageChatSendMessage._();
  UpdateMessageChatSendMessage createEmptyInstance() => create();
  static $pb.PbList<UpdateMessageChatSendMessage> createRepeated() => $pb.PbList<UpdateMessageChatSendMessage>();
  static UpdateMessageChatSendMessage getDefault() => _defaultInstance ??= create()..freeze();
  static UpdateMessageChatSendMessage _defaultInstance;

  ChatMessage get chatMessage => $_getN(0);
  set chatMessage(ChatMessage v) { setField(1, v); }
  $core.bool hasChatMessage() => $_has(0);
  void clearChatMessage() => clearField(1);
}

class UpdateMessageChatDeleteMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UpdateMessageChatDeleteMessage', package: const $pb.PackageName('kproto'))
    ..aInt64(1, 'chatID')
    ..aOS(2, 'senderName')
    ..a<Int64>(3, 'stateDeleted', $pb.PbFieldType.OU6, Int64.ZERO)
    ..hasRequiredFields = false
  ;

  UpdateMessageChatDeleteMessage._() : super();
  factory UpdateMessageChatDeleteMessage() => create();
  factory UpdateMessageChatDeleteMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateMessageChatDeleteMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UpdateMessageChatDeleteMessage clone() => UpdateMessageChatDeleteMessage()..mergeFromMessage(this);
  UpdateMessageChatDeleteMessage copyWith(void Function(UpdateMessageChatDeleteMessage) updates) => super.copyWith((message) => updates(message as UpdateMessageChatDeleteMessage));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateMessageChatDeleteMessage create() => UpdateMessageChatDeleteMessage._();
  UpdateMessageChatDeleteMessage createEmptyInstance() => create();
  static $pb.PbList<UpdateMessageChatDeleteMessage> createRepeated() => $pb.PbList<UpdateMessageChatDeleteMessage>();
  static UpdateMessageChatDeleteMessage getDefault() => _defaultInstance ??= create()..freeze();
  static UpdateMessageChatDeleteMessage _defaultInstance;

  Int64 get chatID => $_getI64(0);
  set chatID(Int64 v) { $_setInt64(0, v); }
  $core.bool hasChatID() => $_has(0);
  void clearChatID() => clearField(1);

  $core.String get senderName => $_getS(1, '');
  set senderName($core.String v) { $_setString(1, v); }
  $core.bool hasSenderName() => $_has(1);
  void clearSenderName() => clearField(2);

  Int64 get stateDeleted => $_getI64(2);
  set stateDeleted(Int64 v) { $_setInt64(2, v); }
  $core.bool hasStateDeleted() => $_has(2);
  void clearStateDeleted() => clearField(3);
}

class UpdateMessageChatReadMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UpdateMessageChatReadMessage', package: const $pb.PackageName('kproto'))
    ..aInt64(1, 'chatID')
    ..aOS(2, 'senderName')
    ..a<Int64>(3, 'stateRead', $pb.PbFieldType.OU6, Int64.ZERO)
    ..hasRequiredFields = false
  ;

  UpdateMessageChatReadMessage._() : super();
  factory UpdateMessageChatReadMessage() => create();
  factory UpdateMessageChatReadMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateMessageChatReadMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UpdateMessageChatReadMessage clone() => UpdateMessageChatReadMessage()..mergeFromMessage(this);
  UpdateMessageChatReadMessage copyWith(void Function(UpdateMessageChatReadMessage) updates) => super.copyWith((message) => updates(message as UpdateMessageChatReadMessage));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateMessageChatReadMessage create() => UpdateMessageChatReadMessage._();
  UpdateMessageChatReadMessage createEmptyInstance() => create();
  static $pb.PbList<UpdateMessageChatReadMessage> createRepeated() => $pb.PbList<UpdateMessageChatReadMessage>();
  static UpdateMessageChatReadMessage getDefault() => _defaultInstance ??= create()..freeze();
  static UpdateMessageChatReadMessage _defaultInstance;

  Int64 get chatID => $_getI64(0);
  set chatID(Int64 v) { $_setInt64(0, v); }
  $core.bool hasChatID() => $_has(0);
  void clearChatID() => clearField(1);

  $core.String get senderName => $_getS(1, '');
  set senderName($core.String v) { $_setString(1, v); }
  $core.bool hasSenderName() => $_has(1);
  void clearSenderName() => clearField(2);

  Int64 get stateRead => $_getI64(2);
  set stateRead(Int64 v) { $_setInt64(2, v); }
  $core.bool hasStateRead() => $_has(2);
  void clearStateRead() => clearField(3);
}

class UpdateMessageChatSetTyping extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UpdateMessageChatSetTyping', package: const $pb.PackageName('kproto'))
    ..aInt64(1, 'chatID')
    ..aOS(2, 'senderName')
    ..hasRequiredFields = false
  ;

  UpdateMessageChatSetTyping._() : super();
  factory UpdateMessageChatSetTyping() => create();
  factory UpdateMessageChatSetTyping.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateMessageChatSetTyping.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UpdateMessageChatSetTyping clone() => UpdateMessageChatSetTyping()..mergeFromMessage(this);
  UpdateMessageChatSetTyping copyWith(void Function(UpdateMessageChatSetTyping) updates) => super.copyWith((message) => updates(message as UpdateMessageChatSetTyping));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateMessageChatSetTyping create() => UpdateMessageChatSetTyping._();
  UpdateMessageChatSetTyping createEmptyInstance() => create();
  static $pb.PbList<UpdateMessageChatSetTyping> createRepeated() => $pb.PbList<UpdateMessageChatSetTyping>();
  static UpdateMessageChatSetTyping getDefault() => _defaultInstance ??= create()..freeze();
  static UpdateMessageChatSetTyping _defaultInstance;

  Int64 get chatID => $_getI64(0);
  set chatID(Int64 v) { $_setInt64(0, v); }
  $core.bool hasChatID() => $_has(0);
  void clearChatID() => clearField(1);

  $core.String get senderName => $_getS(1, '');
  set senderName($core.String v) { $_setString(1, v); }
  $core.bool hasSenderName() => $_has(1);
  void clearSenderName() => clearField(2);
}

class UpdateMessageChatPinMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UpdateMessageChatPinMessage', package: const $pb.PackageName('kproto'))
    ..aInt64(1, 'chatID')
    ..a<Int64>(2, 'pinState', $pb.PbFieldType.OU6, Int64.ZERO)
    ..hasRequiredFields = false
  ;

  UpdateMessageChatPinMessage._() : super();
  factory UpdateMessageChatPinMessage() => create();
  factory UpdateMessageChatPinMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateMessageChatPinMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UpdateMessageChatPinMessage clone() => UpdateMessageChatPinMessage()..mergeFromMessage(this);
  UpdateMessageChatPinMessage copyWith(void Function(UpdateMessageChatPinMessage) updates) => super.copyWith((message) => updates(message as UpdateMessageChatPinMessage));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateMessageChatPinMessage create() => UpdateMessageChatPinMessage._();
  UpdateMessageChatPinMessage createEmptyInstance() => create();
  static $pb.PbList<UpdateMessageChatPinMessage> createRepeated() => $pb.PbList<UpdateMessageChatPinMessage>();
  static UpdateMessageChatPinMessage getDefault() => _defaultInstance ??= create()..freeze();
  static UpdateMessageChatPinMessage _defaultInstance;

  Int64 get chatID => $_getI64(0);
  set chatID(Int64 v) { $_setInt64(0, v); }
  $core.bool hasChatID() => $_has(0);
  void clearChatID() => clearField(1);

  Int64 get pinState => $_getI64(1);
  set pinState(Int64 v) { $_setInt64(1, v); }
  $core.bool hasPinState() => $_has(1);
  void clearPinState() => clearField(2);
}

class InitConnectionReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('InitConnectionReq', package: const $pb.PackageName('kproto'))
    ..hasRequiredFields = false
  ;

  InitConnectionReq._() : super();
  factory InitConnectionReq() => create();
  factory InitConnectionReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory InitConnectionReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  InitConnectionReq clone() => InitConnectionReq()..mergeFromMessage(this);
  InitConnectionReq copyWith(void Function(InitConnectionReq) updates) => super.copyWith((message) => updates(message as InitConnectionReq));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static InitConnectionReq create() => InitConnectionReq._();
  InitConnectionReq createEmptyInstance() => create();
  static $pb.PbList<InitConnectionReq> createRepeated() => $pb.PbList<InitConnectionReq>();
  static InitConnectionReq getDefault() => _defaultInstance ??= create()..freeze();
  static InitConnectionReq _defaultInstance;
}

class InitConnectionResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('InitConnectionResp', package: const $pb.PackageName('kproto'))
    ..hasRequiredFields = false
  ;

  InitConnectionResp._() : super();
  factory InitConnectionResp() => create();
  factory InitConnectionResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory InitConnectionResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  InitConnectionResp clone() => InitConnectionResp()..mergeFromMessage(this);
  InitConnectionResp copyWith(void Function(InitConnectionResp) updates) => super.copyWith((message) => updates(message as InitConnectionResp));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static InitConnectionResp create() => InitConnectionResp._();
  InitConnectionResp createEmptyInstance() => create();
  static $pb.PbList<InitConnectionResp> createRepeated() => $pb.PbList<InitConnectionResp>();
  static InitConnectionResp getDefault() => _defaultInstance ??= create()..freeze();
  static InitConnectionResp _defaultInstance;
}

class AuthPGReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('AuthPGReq', package: const $pb.PackageName('kproto'))
    ..hasRequiredFields = false
  ;

  AuthPGReq._() : super();
  factory AuthPGReq() => create();
  factory AuthPGReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AuthPGReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  AuthPGReq clone() => AuthPGReq()..mergeFromMessage(this);
  AuthPGReq copyWith(void Function(AuthPGReq) updates) => super.copyWith((message) => updates(message as AuthPGReq));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AuthPGReq create() => AuthPGReq._();
  AuthPGReq createEmptyInstance() => create();
  static $pb.PbList<AuthPGReq> createRepeated() => $pb.PbList<AuthPGReq>();
  static AuthPGReq getDefault() => _defaultInstance ??= create()..freeze();
  static AuthPGReq _defaultInstance;
}

class AuthPGResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('AuthPGResp', package: const $pb.PackageName('kproto'))
    ..a<$core.List<$core.int>>(1, 'p', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, 'g', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  AuthPGResp._() : super();
  factory AuthPGResp() => create();
  factory AuthPGResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AuthPGResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  AuthPGResp clone() => AuthPGResp()..mergeFromMessage(this);
  AuthPGResp copyWith(void Function(AuthPGResp) updates) => super.copyWith((message) => updates(message as AuthPGResp));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AuthPGResp create() => AuthPGResp._();
  AuthPGResp createEmptyInstance() => create();
  static $pb.PbList<AuthPGResp> createRepeated() => $pb.PbList<AuthPGResp>();
  static AuthPGResp getDefault() => _defaultInstance ??= create()..freeze();
  static AuthPGResp _defaultInstance;

  $core.List<$core.int> get p => $_getN(0);
  set p($core.List<$core.int> v) { $_setBytes(0, v); }
  $core.bool hasP() => $_has(0);
  void clearP() => clearField(1);

  $core.List<$core.int> get g => $_getN(1);
  set g($core.List<$core.int> v) { $_setBytes(1, v); }
  $core.bool hasG() => $_has(1);
  void clearG() => clearField(2);
}

class AuthKeyExchangeReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('AuthKeyExchangeReq', package: const $pb.PackageName('kproto'))
    ..a<$core.List<$core.int>>(1, 'e', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  AuthKeyExchangeReq._() : super();
  factory AuthKeyExchangeReq() => create();
  factory AuthKeyExchangeReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AuthKeyExchangeReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  AuthKeyExchangeReq clone() => AuthKeyExchangeReq()..mergeFromMessage(this);
  AuthKeyExchangeReq copyWith(void Function(AuthKeyExchangeReq) updates) => super.copyWith((message) => updates(message as AuthKeyExchangeReq));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AuthKeyExchangeReq create() => AuthKeyExchangeReq._();
  AuthKeyExchangeReq createEmptyInstance() => create();
  static $pb.PbList<AuthKeyExchangeReq> createRepeated() => $pb.PbList<AuthKeyExchangeReq>();
  static AuthKeyExchangeReq getDefault() => _defaultInstance ??= create()..freeze();
  static AuthKeyExchangeReq _defaultInstance;

  $core.List<$core.int> get e => $_getN(0);
  set e($core.List<$core.int> v) { $_setBytes(0, v); }
  $core.bool hasE() => $_has(0);
  void clearE() => clearField(1);
}

class AuthKeyExchangeResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('AuthKeyExchangeResp', package: const $pb.PackageName('kproto'))
    ..a<$core.List<$core.int>>(1, 'f', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  AuthKeyExchangeResp._() : super();
  factory AuthKeyExchangeResp() => create();
  factory AuthKeyExchangeResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AuthKeyExchangeResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  AuthKeyExchangeResp clone() => AuthKeyExchangeResp()..mergeFromMessage(this);
  AuthKeyExchangeResp copyWith(void Function(AuthKeyExchangeResp) updates) => super.copyWith((message) => updates(message as AuthKeyExchangeResp));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AuthKeyExchangeResp create() => AuthKeyExchangeResp._();
  AuthKeyExchangeResp createEmptyInstance() => create();
  static $pb.PbList<AuthKeyExchangeResp> createRepeated() => $pb.PbList<AuthKeyExchangeResp>();
  static AuthKeyExchangeResp getDefault() => _defaultInstance ??= create()..freeze();
  static AuthKeyExchangeResp _defaultInstance;

  $core.List<$core.int> get f => $_getN(0);
  set f($core.List<$core.int> v) { $_setBytes(0, v); }
  $core.bool hasF() => $_has(0);
  void clearF() => clearField(1);
}

class HeartbeatReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('HeartbeatReq', package: const $pb.PackageName('kproto'))
    ..hasRequiredFields = false
  ;

  HeartbeatReq._() : super();
  factory HeartbeatReq() => create();
  factory HeartbeatReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory HeartbeatReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  HeartbeatReq clone() => HeartbeatReq()..mergeFromMessage(this);
  HeartbeatReq copyWith(void Function(HeartbeatReq) updates) => super.copyWith((message) => updates(message as HeartbeatReq));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HeartbeatReq create() => HeartbeatReq._();
  HeartbeatReq createEmptyInstance() => create();
  static $pb.PbList<HeartbeatReq> createRepeated() => $pb.PbList<HeartbeatReq>();
  static HeartbeatReq getDefault() => _defaultInstance ??= create()..freeze();
  static HeartbeatReq _defaultInstance;
}

class HeartbeatResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('HeartbeatResp', package: const $pb.PackageName('kproto'))
    ..hasRequiredFields = false
  ;

  HeartbeatResp._() : super();
  factory HeartbeatResp() => create();
  factory HeartbeatResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory HeartbeatResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  HeartbeatResp clone() => HeartbeatResp()..mergeFromMessage(this);
  HeartbeatResp copyWith(void Function(HeartbeatResp) updates) => super.copyWith((message) => updates(message as HeartbeatResp));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HeartbeatResp create() => HeartbeatResp._();
  HeartbeatResp createEmptyInstance() => create();
  static $pb.PbList<HeartbeatResp> createRepeated() => $pb.PbList<HeartbeatResp>();
  static HeartbeatResp getDefault() => _defaultInstance ??= create()..freeze();
  static HeartbeatResp _defaultInstance;
}

class RequestVerificationCodeReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('RequestVerificationCodeReq', package: const $pb.PackageName('kproto'))
    ..hasRequiredFields = false
  ;

  RequestVerificationCodeReq._() : super();
  factory RequestVerificationCodeReq() => create();
  factory RequestVerificationCodeReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RequestVerificationCodeReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  RequestVerificationCodeReq clone() => RequestVerificationCodeReq()..mergeFromMessage(this);
  RequestVerificationCodeReq copyWith(void Function(RequestVerificationCodeReq) updates) => super.copyWith((message) => updates(message as RequestVerificationCodeReq));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RequestVerificationCodeReq create() => RequestVerificationCodeReq._();
  RequestVerificationCodeReq createEmptyInstance() => create();
  static $pb.PbList<RequestVerificationCodeReq> createRepeated() => $pb.PbList<RequestVerificationCodeReq>();
  static RequestVerificationCodeReq getDefault() => _defaultInstance ??= create()..freeze();
  static RequestVerificationCodeReq _defaultInstance;
}

class RequestVerificationCodeResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('RequestVerificationCodeResp', package: const $pb.PackageName('kproto'))
    ..hasRequiredFields = false
  ;

  RequestVerificationCodeResp._() : super();
  factory RequestVerificationCodeResp() => create();
  factory RequestVerificationCodeResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RequestVerificationCodeResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  RequestVerificationCodeResp clone() => RequestVerificationCodeResp()..mergeFromMessage(this);
  RequestVerificationCodeResp copyWith(void Function(RequestVerificationCodeResp) updates) => super.copyWith((message) => updates(message as RequestVerificationCodeResp));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RequestVerificationCodeResp create() => RequestVerificationCodeResp._();
  RequestVerificationCodeResp createEmptyInstance() => create();
  static $pb.PbList<RequestVerificationCodeResp> createRepeated() => $pb.PbList<RequestVerificationCodeResp>();
  static RequestVerificationCodeResp getDefault() => _defaultInstance ??= create()..freeze();
  static RequestVerificationCodeResp _defaultInstance;
}

class CheckAppUpdateReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('CheckAppUpdateReq', package: const $pb.PackageName('kproto'))
    ..hasRequiredFields = false
  ;

  CheckAppUpdateReq._() : super();
  factory CheckAppUpdateReq() => create();
  factory CheckAppUpdateReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CheckAppUpdateReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  CheckAppUpdateReq clone() => CheckAppUpdateReq()..mergeFromMessage(this);
  CheckAppUpdateReq copyWith(void Function(CheckAppUpdateReq) updates) => super.copyWith((message) => updates(message as CheckAppUpdateReq));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CheckAppUpdateReq create() => CheckAppUpdateReq._();
  CheckAppUpdateReq createEmptyInstance() => create();
  static $pb.PbList<CheckAppUpdateReq> createRepeated() => $pb.PbList<CheckAppUpdateReq>();
  static CheckAppUpdateReq getDefault() => _defaultInstance ??= create()..freeze();
  static CheckAppUpdateReq _defaultInstance;
}

class CheckAppUpdateResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('CheckAppUpdateResp', package: const $pb.PackageName('kproto'))
    ..hasRequiredFields = false
  ;

  CheckAppUpdateResp._() : super();
  factory CheckAppUpdateResp() => create();
  factory CheckAppUpdateResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CheckAppUpdateResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  CheckAppUpdateResp clone() => CheckAppUpdateResp()..mergeFromMessage(this);
  CheckAppUpdateResp copyWith(void Function(CheckAppUpdateResp) updates) => super.copyWith((message) => updates(message as CheckAppUpdateResp));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CheckAppUpdateResp create() => CheckAppUpdateResp._();
  CheckAppUpdateResp createEmptyInstance() => create();
  static $pb.PbList<CheckAppUpdateResp> createRepeated() => $pb.PbList<CheckAppUpdateResp>();
  static CheckAppUpdateResp getDefault() => _defaultInstance ??= create()..freeze();
  static CheckAppUpdateResp _defaultInstance;
}

class User extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('User', package: const $pb.PackageName('kproto'))
    ..aInt64(1, 'userID')
    ..aOS(2, 'userName')
    ..aInt64(3, 'avatarFileID')
    ..hasRequiredFields = false
  ;

  User._() : super();
  factory User() => create();
  factory User.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory User.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  User clone() => User()..mergeFromMessage(this);
  User copyWith(void Function(User) updates) => super.copyWith((message) => updates(message as User));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static User create() => User._();
  User createEmptyInstance() => create();
  static $pb.PbList<User> createRepeated() => $pb.PbList<User>();
  static User getDefault() => _defaultInstance ??= create()..freeze();
  static User _defaultInstance;

  Int64 get userID => $_getI64(0);
  set userID(Int64 v) { $_setInt64(0, v); }
  $core.bool hasUserID() => $_has(0);
  void clearUserID() => clearField(1);

  $core.String get userName => $_getS(1, '');
  set userName($core.String v) { $_setString(1, v); }
  $core.bool hasUserName() => $_has(1);
  void clearUserName() => clearField(2);

  Int64 get avatarFileID => $_getI64(2);
  set avatarFileID(Int64 v) { $_setInt64(2, v); }
  $core.bool hasAvatarFileID() => $_has(2);
  void clearAvatarFileID() => clearField(3);
}

class UserRegisterReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UserRegisterReq', package: const $pb.PackageName('kproto'))
    ..aOS(1, 'userName')
    ..aOS(2, 'password')
    ..hasRequiredFields = false
  ;

  UserRegisterReq._() : super();
  factory UserRegisterReq() => create();
  factory UserRegisterReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserRegisterReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UserRegisterReq clone() => UserRegisterReq()..mergeFromMessage(this);
  UserRegisterReq copyWith(void Function(UserRegisterReq) updates) => super.copyWith((message) => updates(message as UserRegisterReq));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserRegisterReq create() => UserRegisterReq._();
  UserRegisterReq createEmptyInstance() => create();
  static $pb.PbList<UserRegisterReq> createRepeated() => $pb.PbList<UserRegisterReq>();
  static UserRegisterReq getDefault() => _defaultInstance ??= create()..freeze();
  static UserRegisterReq _defaultInstance;

  $core.String get userName => $_getS(0, '');
  set userName($core.String v) { $_setString(0, v); }
  $core.bool hasUserName() => $_has(0);
  void clearUserName() => clearField(1);

  $core.String get password => $_getS(1, '');
  set password($core.String v) { $_setString(1, v); }
  $core.bool hasPassword() => $_has(1);
  void clearPassword() => clearField(2);
}

class UserRegisterResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UserRegisterResp', package: const $pb.PackageName('kproto'))
    ..a<User>(1, 'user', $pb.PbFieldType.OM, User.getDefault, User.create)
    ..hasRequiredFields = false
  ;

  UserRegisterResp._() : super();
  factory UserRegisterResp() => create();
  factory UserRegisterResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserRegisterResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UserRegisterResp clone() => UserRegisterResp()..mergeFromMessage(this);
  UserRegisterResp copyWith(void Function(UserRegisterResp) updates) => super.copyWith((message) => updates(message as UserRegisterResp));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserRegisterResp create() => UserRegisterResp._();
  UserRegisterResp createEmptyInstance() => create();
  static $pb.PbList<UserRegisterResp> createRepeated() => $pb.PbList<UserRegisterResp>();
  static UserRegisterResp getDefault() => _defaultInstance ??= create()..freeze();
  static UserRegisterResp _defaultInstance;

  User get user => $_getN(0);
  set user(User v) { setField(1, v); }
  $core.bool hasUser() => $_has(0);
  void clearUser() => clearField(1);
}

class UserLoginReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UserLoginReq', package: const $pb.PackageName('kproto'))
    ..aOS(1, 'userName')
    ..aOS(2, 'password')
    ..aOS(3, 'token')
    ..aOS(4, 'clientApplication')
    ..hasRequiredFields = false
  ;

  UserLoginReq._() : super();
  factory UserLoginReq() => create();
  factory UserLoginReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserLoginReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UserLoginReq clone() => UserLoginReq()..mergeFromMessage(this);
  UserLoginReq copyWith(void Function(UserLoginReq) updates) => super.copyWith((message) => updates(message as UserLoginReq));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserLoginReq create() => UserLoginReq._();
  UserLoginReq createEmptyInstance() => create();
  static $pb.PbList<UserLoginReq> createRepeated() => $pb.PbList<UserLoginReq>();
  static UserLoginReq getDefault() => _defaultInstance ??= create()..freeze();
  static UserLoginReq _defaultInstance;

  $core.String get userName => $_getS(0, '');
  set userName($core.String v) { $_setString(0, v); }
  $core.bool hasUserName() => $_has(0);
  void clearUserName() => clearField(1);

  $core.String get password => $_getS(1, '');
  set password($core.String v) { $_setString(1, v); }
  $core.bool hasPassword() => $_has(1);
  void clearPassword() => clearField(2);

  $core.String get token => $_getS(2, '');
  set token($core.String v) { $_setString(2, v); }
  $core.bool hasToken() => $_has(2);
  void clearToken() => clearField(3);

  $core.String get clientApplication => $_getS(3, '');
  set clientApplication($core.String v) { $_setString(3, v); }
  $core.bool hasClientApplication() => $_has(3);
  void clearClientApplication() => clearField(4);
}

class UserLoginResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UserLoginResp', package: const $pb.PackageName('kproto'))
    ..a<Int64>(1, 'sessionID', $pb.PbFieldType.OU6, Int64.ZERO)
    ..aOS(2, 'token')
    ..a<User>(3, 'user', $pb.PbFieldType.OM, User.getDefault, User.create)
    ..hasRequiredFields = false
  ;

  UserLoginResp._() : super();
  factory UserLoginResp() => create();
  factory UserLoginResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserLoginResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UserLoginResp clone() => UserLoginResp()..mergeFromMessage(this);
  UserLoginResp copyWith(void Function(UserLoginResp) updates) => super.copyWith((message) => updates(message as UserLoginResp));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserLoginResp create() => UserLoginResp._();
  UserLoginResp createEmptyInstance() => create();
  static $pb.PbList<UserLoginResp> createRepeated() => $pb.PbList<UserLoginResp>();
  static UserLoginResp getDefault() => _defaultInstance ??= create()..freeze();
  static UserLoginResp _defaultInstance;

  Int64 get sessionID => $_getI64(0);
  set sessionID(Int64 v) { $_setInt64(0, v); }
  $core.bool hasSessionID() => $_has(0);
  void clearSessionID() => clearField(1);

  $core.String get token => $_getS(1, '');
  set token($core.String v) { $_setString(1, v); }
  $core.bool hasToken() => $_has(1);
  void clearToken() => clearField(2);

  User get user => $_getN(2);
  set user(User v) { setField(3, v); }
  $core.bool hasUser() => $_has(2);
  void clearUser() => clearField(3);
}

class BotLoginReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('BotLoginReq', package: const $pb.PackageName('kproto'))
    ..aOS(1, 'botToken')
    ..hasRequiredFields = false
  ;

  BotLoginReq._() : super();
  factory BotLoginReq() => create();
  factory BotLoginReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BotLoginReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  BotLoginReq clone() => BotLoginReq()..mergeFromMessage(this);
  BotLoginReq copyWith(void Function(BotLoginReq) updates) => super.copyWith((message) => updates(message as BotLoginReq));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BotLoginReq create() => BotLoginReq._();
  BotLoginReq createEmptyInstance() => create();
  static $pb.PbList<BotLoginReq> createRepeated() => $pb.PbList<BotLoginReq>();
  static BotLoginReq getDefault() => _defaultInstance ??= create()..freeze();
  static BotLoginReq _defaultInstance;

  $core.String get botToken => $_getS(0, '');
  set botToken($core.String v) { $_setString(0, v); }
  $core.bool hasBotToken() => $_has(0);
  void clearBotToken() => clearField(1);
}

class BotLoginResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('BotLoginResp', package: const $pb.PackageName('kproto'))
    ..a<Int64>(1, 'sessionID', $pb.PbFieldType.OU6, Int64.ZERO)
    ..aOS(2, 'token')
    ..a<User>(3, 'user', $pb.PbFieldType.OM, User.getDefault, User.create)
    ..hasRequiredFields = false
  ;

  BotLoginResp._() : super();
  factory BotLoginResp() => create();
  factory BotLoginResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BotLoginResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  BotLoginResp clone() => BotLoginResp()..mergeFromMessage(this);
  BotLoginResp copyWith(void Function(BotLoginResp) updates) => super.copyWith((message) => updates(message as BotLoginResp));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BotLoginResp create() => BotLoginResp._();
  BotLoginResp createEmptyInstance() => create();
  static $pb.PbList<BotLoginResp> createRepeated() => $pb.PbList<BotLoginResp>();
  static BotLoginResp getDefault() => _defaultInstance ??= create()..freeze();
  static BotLoginResp _defaultInstance;

  Int64 get sessionID => $_getI64(0);
  set sessionID(Int64 v) { $_setInt64(0, v); }
  $core.bool hasSessionID() => $_has(0);
  void clearSessionID() => clearField(1);

  $core.String get token => $_getS(1, '');
  set token($core.String v) { $_setString(1, v); }
  $core.bool hasToken() => $_has(1);
  void clearToken() => clearField(2);

  User get user => $_getN(2);
  set user(User v) { setField(3, v); }
  $core.bool hasUser() => $_has(2);
  void clearUser() => clearField(3);
}

class UserLogoutReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UserLogoutReq', package: const $pb.PackageName('kproto'))
    ..hasRequiredFields = false
  ;

  UserLogoutReq._() : super();
  factory UserLogoutReq() => create();
  factory UserLogoutReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserLogoutReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UserLogoutReq clone() => UserLogoutReq()..mergeFromMessage(this);
  UserLogoutReq copyWith(void Function(UserLogoutReq) updates) => super.copyWith((message) => updates(message as UserLogoutReq));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserLogoutReq create() => UserLogoutReq._();
  UserLogoutReq createEmptyInstance() => create();
  static $pb.PbList<UserLogoutReq> createRepeated() => $pb.PbList<UserLogoutReq>();
  static UserLogoutReq getDefault() => _defaultInstance ??= create()..freeze();
  static UserLogoutReq _defaultInstance;
}

class UserLogoutResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UserLogoutResp', package: const $pb.PackageName('kproto'))
    ..hasRequiredFields = false
  ;

  UserLogoutResp._() : super();
  factory UserLogoutResp() => create();
  factory UserLogoutResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserLogoutResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UserLogoutResp clone() => UserLogoutResp()..mergeFromMessage(this);
  UserLogoutResp copyWith(void Function(UserLogoutResp) updates) => super.copyWith((message) => updates(message as UserLogoutResp));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserLogoutResp create() => UserLogoutResp._();
  UserLogoutResp createEmptyInstance() => create();
  static $pb.PbList<UserLogoutResp> createRepeated() => $pb.PbList<UserLogoutResp>();
  static UserLogoutResp getDefault() => _defaultInstance ??= create()..freeze();
  static UserLogoutResp _defaultInstance;
}

class UserUpdateProfileReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UserUpdateProfileReq', package: const $pb.PackageName('kproto'))
    ..aInt64(1, 'avatarFileID')
    ..hasRequiredFields = false
  ;

  UserUpdateProfileReq._() : super();
  factory UserUpdateProfileReq() => create();
  factory UserUpdateProfileReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserUpdateProfileReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UserUpdateProfileReq clone() => UserUpdateProfileReq()..mergeFromMessage(this);
  UserUpdateProfileReq copyWith(void Function(UserUpdateProfileReq) updates) => super.copyWith((message) => updates(message as UserUpdateProfileReq));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserUpdateProfileReq create() => UserUpdateProfileReq._();
  UserUpdateProfileReq createEmptyInstance() => create();
  static $pb.PbList<UserUpdateProfileReq> createRepeated() => $pb.PbList<UserUpdateProfileReq>();
  static UserUpdateProfileReq getDefault() => _defaultInstance ??= create()..freeze();
  static UserUpdateProfileReq _defaultInstance;

  Int64 get avatarFileID => $_getI64(0);
  set avatarFileID(Int64 v) { $_setInt64(0, v); }
  $core.bool hasAvatarFileID() => $_has(0);
  void clearAvatarFileID() => clearField(1);
}

class UserUpdateProfileResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UserUpdateProfileResp', package: const $pb.PackageName('kproto'))
    ..hasRequiredFields = false
  ;

  UserUpdateProfileResp._() : super();
  factory UserUpdateProfileResp() => create();
  factory UserUpdateProfileResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserUpdateProfileResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UserUpdateProfileResp clone() => UserUpdateProfileResp()..mergeFromMessage(this);
  UserUpdateProfileResp copyWith(void Function(UserUpdateProfileResp) updates) => super.copyWith((message) => updates(message as UserUpdateProfileResp));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserUpdateProfileResp create() => UserUpdateProfileResp._();
  UserUpdateProfileResp createEmptyInstance() => create();
  static $pb.PbList<UserUpdateProfileResp> createRepeated() => $pb.PbList<UserUpdateProfileResp>();
  static UserUpdateProfileResp getDefault() => _defaultInstance ??= create()..freeze();
  static UserUpdateProfileResp _defaultInstance;
}

class UserChangePasswordReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UserChangePasswordReq', package: const $pb.PackageName('kproto'))
    ..aOS(1, 'oldPassword')
    ..aOS(2, 'newPassword')
    ..hasRequiredFields = false
  ;

  UserChangePasswordReq._() : super();
  factory UserChangePasswordReq() => create();
  factory UserChangePasswordReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserChangePasswordReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UserChangePasswordReq clone() => UserChangePasswordReq()..mergeFromMessage(this);
  UserChangePasswordReq copyWith(void Function(UserChangePasswordReq) updates) => super.copyWith((message) => updates(message as UserChangePasswordReq));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserChangePasswordReq create() => UserChangePasswordReq._();
  UserChangePasswordReq createEmptyInstance() => create();
  static $pb.PbList<UserChangePasswordReq> createRepeated() => $pb.PbList<UserChangePasswordReq>();
  static UserChangePasswordReq getDefault() => _defaultInstance ??= create()..freeze();
  static UserChangePasswordReq _defaultInstance;

  $core.String get oldPassword => $_getS(0, '');
  set oldPassword($core.String v) { $_setString(0, v); }
  $core.bool hasOldPassword() => $_has(0);
  void clearOldPassword() => clearField(1);

  $core.String get newPassword => $_getS(1, '');
  set newPassword($core.String v) { $_setString(1, v); }
  $core.bool hasNewPassword() => $_has(1);
  void clearNewPassword() => clearField(2);
}

class UserChangePasswordResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UserChangePasswordResp', package: const $pb.PackageName('kproto'))
    ..hasRequiredFields = false
  ;

  UserChangePasswordResp._() : super();
  factory UserChangePasswordResp() => create();
  factory UserChangePasswordResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserChangePasswordResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UserChangePasswordResp clone() => UserChangePasswordResp()..mergeFromMessage(this);
  UserChangePasswordResp copyWith(void Function(UserChangePasswordResp) updates) => super.copyWith((message) => updates(message as UserChangePasswordResp));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserChangePasswordResp create() => UserChangePasswordResp._();
  UserChangePasswordResp createEmptyInstance() => create();
  static $pb.PbList<UserChangePasswordResp> createRepeated() => $pb.PbList<UserChangePasswordResp>();
  static UserChangePasswordResp getDefault() => _defaultInstance ??= create()..freeze();
  static UserChangePasswordResp _defaultInstance;
}

class UserGetFullUserReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UserGetFullUserReq', package: const $pb.PackageName('kproto'))
    ..aInt64(1, 'userID')
    ..hasRequiredFields = false
  ;

  UserGetFullUserReq._() : super();
  factory UserGetFullUserReq() => create();
  factory UserGetFullUserReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserGetFullUserReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UserGetFullUserReq clone() => UserGetFullUserReq()..mergeFromMessage(this);
  UserGetFullUserReq copyWith(void Function(UserGetFullUserReq) updates) => super.copyWith((message) => updates(message as UserGetFullUserReq));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserGetFullUserReq create() => UserGetFullUserReq._();
  UserGetFullUserReq createEmptyInstance() => create();
  static $pb.PbList<UserGetFullUserReq> createRepeated() => $pb.PbList<UserGetFullUserReq>();
  static UserGetFullUserReq getDefault() => _defaultInstance ??= create()..freeze();
  static UserGetFullUserReq _defaultInstance;

  Int64 get userID => $_getI64(0);
  set userID(Int64 v) { $_setInt64(0, v); }
  $core.bool hasUserID() => $_has(0);
  void clearUserID() => clearField(1);
}

class UserGetFullUserResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UserGetFullUserResp', package: const $pb.PackageName('kproto'))
    ..a<User>(1, 'user', $pb.PbFieldType.OM, User.getDefault, User.create)
    ..hasRequiredFields = false
  ;

  UserGetFullUserResp._() : super();
  factory UserGetFullUserResp() => create();
  factory UserGetFullUserResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserGetFullUserResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UserGetFullUserResp clone() => UserGetFullUserResp()..mergeFromMessage(this);
  UserGetFullUserResp copyWith(void Function(UserGetFullUserResp) updates) => super.copyWith((message) => updates(message as UserGetFullUserResp));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserGetFullUserResp create() => UserGetFullUserResp._();
  UserGetFullUserResp createEmptyInstance() => create();
  static $pb.PbList<UserGetFullUserResp> createRepeated() => $pb.PbList<UserGetFullUserResp>();
  static UserGetFullUserResp getDefault() => _defaultInstance ??= create()..freeze();
  static UserGetFullUserResp _defaultInstance;

  User get user => $_getN(0);
  set user(User v) { setField(1, v); }
  $core.bool hasUser() => $_has(0);
  void clearUser() => clearField(1);
}

class UserGetFullUsersReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UserGetFullUsersReq', package: const $pb.PackageName('kproto'))
    ..p<Int64>(1, 'userIDs', $pb.PbFieldType.P6)
    ..hasRequiredFields = false
  ;

  UserGetFullUsersReq._() : super();
  factory UserGetFullUsersReq() => create();
  factory UserGetFullUsersReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserGetFullUsersReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UserGetFullUsersReq clone() => UserGetFullUsersReq()..mergeFromMessage(this);
  UserGetFullUsersReq copyWith(void Function(UserGetFullUsersReq) updates) => super.copyWith((message) => updates(message as UserGetFullUsersReq));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserGetFullUsersReq create() => UserGetFullUsersReq._();
  UserGetFullUsersReq createEmptyInstance() => create();
  static $pb.PbList<UserGetFullUsersReq> createRepeated() => $pb.PbList<UserGetFullUsersReq>();
  static UserGetFullUsersReq getDefault() => _defaultInstance ??= create()..freeze();
  static UserGetFullUsersReq _defaultInstance;

  $core.List<Int64> get userIDs => $_getList(0);
}

class UserGetFullUsersResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UserGetFullUsersResp', package: const $pb.PackageName('kproto'))
    ..pc<User>(1, 'users', $pb.PbFieldType.PM,User.create)
    ..hasRequiredFields = false
  ;

  UserGetFullUsersResp._() : super();
  factory UserGetFullUsersResp() => create();
  factory UserGetFullUsersResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserGetFullUsersResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UserGetFullUsersResp clone() => UserGetFullUsersResp()..mergeFromMessage(this);
  UserGetFullUsersResp copyWith(void Function(UserGetFullUsersResp) updates) => super.copyWith((message) => updates(message as UserGetFullUsersResp));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserGetFullUsersResp create() => UserGetFullUsersResp._();
  UserGetFullUsersResp createEmptyInstance() => create();
  static $pb.PbList<UserGetFullUsersResp> createRepeated() => $pb.PbList<UserGetFullUsersResp>();
  static UserGetFullUsersResp getDefault() => _defaultInstance ??= create()..freeze();
  static UserGetFullUsersResp _defaultInstance;

  $core.List<User> get users => $_getList(0);
}

class UserGetUsersCondition extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UserGetUsersCondition', package: const $pb.PackageName('kproto'))
    ..aOS(1, 'userName')
    ..hasRequiredFields = false
  ;

  UserGetUsersCondition._() : super();
  factory UserGetUsersCondition() => create();
  factory UserGetUsersCondition.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserGetUsersCondition.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UserGetUsersCondition clone() => UserGetUsersCondition()..mergeFromMessage(this);
  UserGetUsersCondition copyWith(void Function(UserGetUsersCondition) updates) => super.copyWith((message) => updates(message as UserGetUsersCondition));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserGetUsersCondition create() => UserGetUsersCondition._();
  UserGetUsersCondition createEmptyInstance() => create();
  static $pb.PbList<UserGetUsersCondition> createRepeated() => $pb.PbList<UserGetUsersCondition>();
  static UserGetUsersCondition getDefault() => _defaultInstance ??= create()..freeze();
  static UserGetUsersCondition _defaultInstance;

  $core.String get userName => $_getS(0, '');
  set userName($core.String v) { $_setString(0, v); }
  $core.bool hasUserName() => $_has(0);
  void clearUserName() => clearField(1);
}

class UserGetUsersReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UserGetUsersReq', package: const $pb.PackageName('kproto'))
    ..a<Paging>(1, 'paging', $pb.PbFieldType.OM, Paging.getDefault, Paging.create)
    ..a<UserGetUsersCondition>(2, 'condition', $pb.PbFieldType.OM, UserGetUsersCondition.getDefault, UserGetUsersCondition.create)
    ..hasRequiredFields = false
  ;

  UserGetUsersReq._() : super();
  factory UserGetUsersReq() => create();
  factory UserGetUsersReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserGetUsersReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UserGetUsersReq clone() => UserGetUsersReq()..mergeFromMessage(this);
  UserGetUsersReq copyWith(void Function(UserGetUsersReq) updates) => super.copyWith((message) => updates(message as UserGetUsersReq));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserGetUsersReq create() => UserGetUsersReq._();
  UserGetUsersReq createEmptyInstance() => create();
  static $pb.PbList<UserGetUsersReq> createRepeated() => $pb.PbList<UserGetUsersReq>();
  static UserGetUsersReq getDefault() => _defaultInstance ??= create()..freeze();
  static UserGetUsersReq _defaultInstance;

  Paging get paging => $_getN(0);
  set paging(Paging v) { setField(1, v); }
  $core.bool hasPaging() => $_has(0);
  void clearPaging() => clearField(1);

  UserGetUsersCondition get condition => $_getN(1);
  set condition(UserGetUsersCondition v) { setField(2, v); }
  $core.bool hasCondition() => $_has(1);
  void clearCondition() => clearField(2);
}

class UserGetUsersResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UserGetUsersResp', package: const $pb.PackageName('kproto'))
    ..a<Paging>(1, 'paging', $pb.PbFieldType.OM, Paging.getDefault, Paging.create)
    ..pc<User>(2, 'users', $pb.PbFieldType.PM,User.create)
    ..hasRequiredFields = false
  ;

  UserGetUsersResp._() : super();
  factory UserGetUsersResp() => create();
  factory UserGetUsersResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserGetUsersResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UserGetUsersResp clone() => UserGetUsersResp()..mergeFromMessage(this);
  UserGetUsersResp copyWith(void Function(UserGetUsersResp) updates) => super.copyWith((message) => updates(message as UserGetUsersResp));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserGetUsersResp create() => UserGetUsersResp._();
  UserGetUsersResp createEmptyInstance() => create();
  static $pb.PbList<UserGetUsersResp> createRepeated() => $pb.PbList<UserGetUsersResp>();
  static UserGetUsersResp getDefault() => _defaultInstance ??= create()..freeze();
  static UserGetUsersResp _defaultInstance;

  Paging get paging => $_getN(0);
  set paging(Paging v) { setField(1, v); }
  $core.bool hasPaging() => $_has(0);
  void clearPaging() => clearField(1);

  $core.List<User> get users => $_getList(1);
}

class ChatUserState extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ChatUserState', package: const $pb.PackageName('kproto'))
    ..aInt64(1, 'chatID')
    ..aInt64(2, 'userID')
    ..a<Int64>(3, 'state', $pb.PbFieldType.OU6, Int64.ZERO)
    ..a<Int64>(4, 'stateRead', $pb.PbFieldType.OU6, Int64.ZERO)
    ..hasRequiredFields = false
  ;

  ChatUserState._() : super();
  factory ChatUserState() => create();
  factory ChatUserState.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatUserState.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ChatUserState clone() => ChatUserState()..mergeFromMessage(this);
  ChatUserState copyWith(void Function(ChatUserState) updates) => super.copyWith((message) => updates(message as ChatUserState));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ChatUserState create() => ChatUserState._();
  ChatUserState createEmptyInstance() => create();
  static $pb.PbList<ChatUserState> createRepeated() => $pb.PbList<ChatUserState>();
  static ChatUserState getDefault() => _defaultInstance ??= create()..freeze();
  static ChatUserState _defaultInstance;

  Int64 get chatID => $_getI64(0);
  set chatID(Int64 v) { $_setInt64(0, v); }
  $core.bool hasChatID() => $_has(0);
  void clearChatID() => clearField(1);

  Int64 get userID => $_getI64(1);
  set userID(Int64 v) { $_setInt64(1, v); }
  $core.bool hasUserID() => $_has(1);
  void clearUserID() => clearField(2);

  Int64 get state => $_getI64(2);
  set state(Int64 v) { $_setInt64(2, v); }
  $core.bool hasState() => $_has(2);
  void clearState() => clearField(3);

  Int64 get stateRead => $_getI64(3);
  set stateRead(Int64 v) { $_setInt64(3, v); }
  $core.bool hasStateRead() => $_has(3);
  void clearStateRead() => clearField(4);
}

class UserGetChatUserStateReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UserGetChatUserStateReq', package: const $pb.PackageName('kproto'))
    ..aInt64(1, 'chatID')
    ..hasRequiredFields = false
  ;

  UserGetChatUserStateReq._() : super();
  factory UserGetChatUserStateReq() => create();
  factory UserGetChatUserStateReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserGetChatUserStateReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UserGetChatUserStateReq clone() => UserGetChatUserStateReq()..mergeFromMessage(this);
  UserGetChatUserStateReq copyWith(void Function(UserGetChatUserStateReq) updates) => super.copyWith((message) => updates(message as UserGetChatUserStateReq));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserGetChatUserStateReq create() => UserGetChatUserStateReq._();
  UserGetChatUserStateReq createEmptyInstance() => create();
  static $pb.PbList<UserGetChatUserStateReq> createRepeated() => $pb.PbList<UserGetChatUserStateReq>();
  static UserGetChatUserStateReq getDefault() => _defaultInstance ??= create()..freeze();
  static UserGetChatUserStateReq _defaultInstance;

  Int64 get chatID => $_getI64(0);
  set chatID(Int64 v) { $_setInt64(0, v); }
  $core.bool hasChatID() => $_has(0);
  void clearChatID() => clearField(1);
}

class UserGetChatUserStateResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UserGetChatUserStateResp', package: const $pb.PackageName('kproto'))
    ..a<ChatUserState>(1, 'state', $pb.PbFieldType.OM, ChatUserState.getDefault, ChatUserState.create)
    ..hasRequiredFields = false
  ;

  UserGetChatUserStateResp._() : super();
  factory UserGetChatUserStateResp() => create();
  factory UserGetChatUserStateResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserGetChatUserStateResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UserGetChatUserStateResp clone() => UserGetChatUserStateResp()..mergeFromMessage(this);
  UserGetChatUserStateResp copyWith(void Function(UserGetChatUserStateResp) updates) => super.copyWith((message) => updates(message as UserGetChatUserStateResp));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserGetChatUserStateResp create() => UserGetChatUserStateResp._();
  UserGetChatUserStateResp createEmptyInstance() => create();
  static $pb.PbList<UserGetChatUserStateResp> createRepeated() => $pb.PbList<UserGetChatUserStateResp>();
  static UserGetChatUserStateResp getDefault() => _defaultInstance ??= create()..freeze();
  static UserGetChatUserStateResp _defaultInstance;

  ChatUserState get state => $_getN(0);
  set state(ChatUserState v) { setField(1, v); }
  $core.bool hasState() => $_has(0);
  void clearState() => clearField(1);
}

class UserAddBlockedUserReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UserAddBlockedUserReq', package: const $pb.PackageName('kproto'))
    ..aInt64(1, 'userID')
    ..hasRequiredFields = false
  ;

  UserAddBlockedUserReq._() : super();
  factory UserAddBlockedUserReq() => create();
  factory UserAddBlockedUserReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserAddBlockedUserReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UserAddBlockedUserReq clone() => UserAddBlockedUserReq()..mergeFromMessage(this);
  UserAddBlockedUserReq copyWith(void Function(UserAddBlockedUserReq) updates) => super.copyWith((message) => updates(message as UserAddBlockedUserReq));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserAddBlockedUserReq create() => UserAddBlockedUserReq._();
  UserAddBlockedUserReq createEmptyInstance() => create();
  static $pb.PbList<UserAddBlockedUserReq> createRepeated() => $pb.PbList<UserAddBlockedUserReq>();
  static UserAddBlockedUserReq getDefault() => _defaultInstance ??= create()..freeze();
  static UserAddBlockedUserReq _defaultInstance;

  Int64 get userID => $_getI64(0);
  set userID(Int64 v) { $_setInt64(0, v); }
  $core.bool hasUserID() => $_has(0);
  void clearUserID() => clearField(1);
}

class UserAddBlockedUserResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UserAddBlockedUserResp', package: const $pb.PackageName('kproto'))
    ..hasRequiredFields = false
  ;

  UserAddBlockedUserResp._() : super();
  factory UserAddBlockedUserResp() => create();
  factory UserAddBlockedUserResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserAddBlockedUserResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UserAddBlockedUserResp clone() => UserAddBlockedUserResp()..mergeFromMessage(this);
  UserAddBlockedUserResp copyWith(void Function(UserAddBlockedUserResp) updates) => super.copyWith((message) => updates(message as UserAddBlockedUserResp));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserAddBlockedUserResp create() => UserAddBlockedUserResp._();
  UserAddBlockedUserResp createEmptyInstance() => create();
  static $pb.PbList<UserAddBlockedUserResp> createRepeated() => $pb.PbList<UserAddBlockedUserResp>();
  static UserAddBlockedUserResp getDefault() => _defaultInstance ??= create()..freeze();
  static UserAddBlockedUserResp _defaultInstance;
}

class UserDeleteBlockedUserReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UserDeleteBlockedUserReq', package: const $pb.PackageName('kproto'))
    ..aInt64(1, 'userID')
    ..hasRequiredFields = false
  ;

  UserDeleteBlockedUserReq._() : super();
  factory UserDeleteBlockedUserReq() => create();
  factory UserDeleteBlockedUserReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserDeleteBlockedUserReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UserDeleteBlockedUserReq clone() => UserDeleteBlockedUserReq()..mergeFromMessage(this);
  UserDeleteBlockedUserReq copyWith(void Function(UserDeleteBlockedUserReq) updates) => super.copyWith((message) => updates(message as UserDeleteBlockedUserReq));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserDeleteBlockedUserReq create() => UserDeleteBlockedUserReq._();
  UserDeleteBlockedUserReq createEmptyInstance() => create();
  static $pb.PbList<UserDeleteBlockedUserReq> createRepeated() => $pb.PbList<UserDeleteBlockedUserReq>();
  static UserDeleteBlockedUserReq getDefault() => _defaultInstance ??= create()..freeze();
  static UserDeleteBlockedUserReq _defaultInstance;

  Int64 get userID => $_getI64(0);
  set userID(Int64 v) { $_setInt64(0, v); }
  $core.bool hasUserID() => $_has(0);
  void clearUserID() => clearField(1);
}

class UserDeleteBlockedUserResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UserDeleteBlockedUserResp', package: const $pb.PackageName('kproto'))
    ..hasRequiredFields = false
  ;

  UserDeleteBlockedUserResp._() : super();
  factory UserDeleteBlockedUserResp() => create();
  factory UserDeleteBlockedUserResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserDeleteBlockedUserResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UserDeleteBlockedUserResp clone() => UserDeleteBlockedUserResp()..mergeFromMessage(this);
  UserDeleteBlockedUserResp copyWith(void Function(UserDeleteBlockedUserResp) updates) => super.copyWith((message) => updates(message as UserDeleteBlockedUserResp));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserDeleteBlockedUserResp create() => UserDeleteBlockedUserResp._();
  UserDeleteBlockedUserResp createEmptyInstance() => create();
  static $pb.PbList<UserDeleteBlockedUserResp> createRepeated() => $pb.PbList<UserDeleteBlockedUserResp>();
  static UserDeleteBlockedUserResp getDefault() => _defaultInstance ??= create()..freeze();
  static UserDeleteBlockedUserResp _defaultInstance;
}

class ChatUserSettings extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ChatUserSettings', package: const $pb.PackageName('kproto'))
    ..aInt64(1, 'chatID')
    ..aInt64(2, 'userID')
    ..a<$core.int>(3, 'invisible', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  ChatUserSettings._() : super();
  factory ChatUserSettings() => create();
  factory ChatUserSettings.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatUserSettings.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ChatUserSettings clone() => ChatUserSettings()..mergeFromMessage(this);
  ChatUserSettings copyWith(void Function(ChatUserSettings) updates) => super.copyWith((message) => updates(message as ChatUserSettings));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ChatUserSettings create() => ChatUserSettings._();
  ChatUserSettings createEmptyInstance() => create();
  static $pb.PbList<ChatUserSettings> createRepeated() => $pb.PbList<ChatUserSettings>();
  static ChatUserSettings getDefault() => _defaultInstance ??= create()..freeze();
  static ChatUserSettings _defaultInstance;

  Int64 get chatID => $_getI64(0);
  set chatID(Int64 v) { $_setInt64(0, v); }
  $core.bool hasChatID() => $_has(0);
  void clearChatID() => clearField(1);

  Int64 get userID => $_getI64(1);
  set userID(Int64 v) { $_setInt64(1, v); }
  $core.bool hasUserID() => $_has(1);
  void clearUserID() => clearField(2);

  $core.int get invisible => $_get(2, 0);
  set invisible($core.int v) { $_setSignedInt32(2, v); }
  $core.bool hasInvisible() => $_has(2);
  void clearInvisible() => clearField(3);
}

class UserSetChatUserSettingsReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UserSetChatUserSettingsReq', package: const $pb.PackageName('kproto'))
    ..a<ChatUserSettings>(1, 'chatUserSettings', $pb.PbFieldType.OM, ChatUserSettings.getDefault, ChatUserSettings.create)
    ..hasRequiredFields = false
  ;

  UserSetChatUserSettingsReq._() : super();
  factory UserSetChatUserSettingsReq() => create();
  factory UserSetChatUserSettingsReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserSetChatUserSettingsReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UserSetChatUserSettingsReq clone() => UserSetChatUserSettingsReq()..mergeFromMessage(this);
  UserSetChatUserSettingsReq copyWith(void Function(UserSetChatUserSettingsReq) updates) => super.copyWith((message) => updates(message as UserSetChatUserSettingsReq));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserSetChatUserSettingsReq create() => UserSetChatUserSettingsReq._();
  UserSetChatUserSettingsReq createEmptyInstance() => create();
  static $pb.PbList<UserSetChatUserSettingsReq> createRepeated() => $pb.PbList<UserSetChatUserSettingsReq>();
  static UserSetChatUserSettingsReq getDefault() => _defaultInstance ??= create()..freeze();
  static UserSetChatUserSettingsReq _defaultInstance;

  ChatUserSettings get chatUserSettings => $_getN(0);
  set chatUserSettings(ChatUserSettings v) { setField(1, v); }
  $core.bool hasChatUserSettings() => $_has(0);
  void clearChatUserSettings() => clearField(1);
}

class UserSetChatUserSettingsResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UserSetChatUserSettingsResp', package: const $pb.PackageName('kproto'))
    ..hasRequiredFields = false
  ;

  UserSetChatUserSettingsResp._() : super();
  factory UserSetChatUserSettingsResp() => create();
  factory UserSetChatUserSettingsResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserSetChatUserSettingsResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UserSetChatUserSettingsResp clone() => UserSetChatUserSettingsResp()..mergeFromMessage(this);
  UserSetChatUserSettingsResp copyWith(void Function(UserSetChatUserSettingsResp) updates) => super.copyWith((message) => updates(message as UserSetChatUserSettingsResp));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserSetChatUserSettingsResp create() => UserSetChatUserSettingsResp._();
  UserSetChatUserSettingsResp createEmptyInstance() => create();
  static $pb.PbList<UserSetChatUserSettingsResp> createRepeated() => $pb.PbList<UserSetChatUserSettingsResp>();
  static UserSetChatUserSettingsResp getDefault() => _defaultInstance ??= create()..freeze();
  static UserSetChatUserSettingsResp _defaultInstance;
}

class UserGetChatUserSettingsReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UserGetChatUserSettingsReq', package: const $pb.PackageName('kproto'))
    ..aInt64(1, 'chatID')
    ..hasRequiredFields = false
  ;

  UserGetChatUserSettingsReq._() : super();
  factory UserGetChatUserSettingsReq() => create();
  factory UserGetChatUserSettingsReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserGetChatUserSettingsReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UserGetChatUserSettingsReq clone() => UserGetChatUserSettingsReq()..mergeFromMessage(this);
  UserGetChatUserSettingsReq copyWith(void Function(UserGetChatUserSettingsReq) updates) => super.copyWith((message) => updates(message as UserGetChatUserSettingsReq));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserGetChatUserSettingsReq create() => UserGetChatUserSettingsReq._();
  UserGetChatUserSettingsReq createEmptyInstance() => create();
  static $pb.PbList<UserGetChatUserSettingsReq> createRepeated() => $pb.PbList<UserGetChatUserSettingsReq>();
  static UserGetChatUserSettingsReq getDefault() => _defaultInstance ??= create()..freeze();
  static UserGetChatUserSettingsReq _defaultInstance;

  Int64 get chatID => $_getI64(0);
  set chatID(Int64 v) { $_setInt64(0, v); }
  $core.bool hasChatID() => $_has(0);
  void clearChatID() => clearField(1);
}

class UserGetChatUserSettingsResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UserGetChatUserSettingsResp', package: const $pb.PackageName('kproto'))
    ..a<ChatUserSettings>(1, 'chatUserSettings', $pb.PbFieldType.OM, ChatUserSettings.getDefault, ChatUserSettings.create)
    ..hasRequiredFields = false
  ;

  UserGetChatUserSettingsResp._() : super();
  factory UserGetChatUserSettingsResp() => create();
  factory UserGetChatUserSettingsResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserGetChatUserSettingsResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UserGetChatUserSettingsResp clone() => UserGetChatUserSettingsResp()..mergeFromMessage(this);
  UserGetChatUserSettingsResp copyWith(void Function(UserGetChatUserSettingsResp) updates) => super.copyWith((message) => updates(message as UserGetChatUserSettingsResp));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserGetChatUserSettingsResp create() => UserGetChatUserSettingsResp._();
  UserGetChatUserSettingsResp createEmptyInstance() => create();
  static $pb.PbList<UserGetChatUserSettingsResp> createRepeated() => $pb.PbList<UserGetChatUserSettingsResp>();
  static UserGetChatUserSettingsResp getDefault() => _defaultInstance ??= create()..freeze();
  static UserGetChatUserSettingsResp _defaultInstance;

  ChatUserSettings get chatUserSettings => $_getN(0);
  set chatUserSettings(ChatUserSettings v) { setField(1, v); }
  $core.bool hasChatUserSettings() => $_has(0);
  void clearChatUserSettings() => clearField(1);
}

class UserGetChatUserSuperscriptReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UserGetChatUserSuperscriptReq', package: const $pb.PackageName('kproto'))
    ..aInt64(1, 'chatID')
    ..hasRequiredFields = false
  ;

  UserGetChatUserSuperscriptReq._() : super();
  factory UserGetChatUserSuperscriptReq() => create();
  factory UserGetChatUserSuperscriptReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserGetChatUserSuperscriptReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UserGetChatUserSuperscriptReq clone() => UserGetChatUserSuperscriptReq()..mergeFromMessage(this);
  UserGetChatUserSuperscriptReq copyWith(void Function(UserGetChatUserSuperscriptReq) updates) => super.copyWith((message) => updates(message as UserGetChatUserSuperscriptReq));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserGetChatUserSuperscriptReq create() => UserGetChatUserSuperscriptReq._();
  UserGetChatUserSuperscriptReq createEmptyInstance() => create();
  static $pb.PbList<UserGetChatUserSuperscriptReq> createRepeated() => $pb.PbList<UserGetChatUserSuperscriptReq>();
  static UserGetChatUserSuperscriptReq getDefault() => _defaultInstance ??= create()..freeze();
  static UserGetChatUserSuperscriptReq _defaultInstance;

  Int64 get chatID => $_getI64(0);
  set chatID(Int64 v) { $_setInt64(0, v); }
  $core.bool hasChatID() => $_has(0);
  void clearChatID() => clearField(1);
}

class UserGetChatUserSuperscriptResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UserGetChatUserSuperscriptResp', package: const $pb.PackageName('kproto'))
    ..a<Int64>(1, 'superscriptNumber', $pb.PbFieldType.OU6, Int64.ZERO)
    ..hasRequiredFields = false
  ;

  UserGetChatUserSuperscriptResp._() : super();
  factory UserGetChatUserSuperscriptResp() => create();
  factory UserGetChatUserSuperscriptResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserGetChatUserSuperscriptResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UserGetChatUserSuperscriptResp clone() => UserGetChatUserSuperscriptResp()..mergeFromMessage(this);
  UserGetChatUserSuperscriptResp copyWith(void Function(UserGetChatUserSuperscriptResp) updates) => super.copyWith((message) => updates(message as UserGetChatUserSuperscriptResp));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserGetChatUserSuperscriptResp create() => UserGetChatUserSuperscriptResp._();
  UserGetChatUserSuperscriptResp createEmptyInstance() => create();
  static $pb.PbList<UserGetChatUserSuperscriptResp> createRepeated() => $pb.PbList<UserGetChatUserSuperscriptResp>();
  static UserGetChatUserSuperscriptResp getDefault() => _defaultInstance ??= create()..freeze();
  static UserGetChatUserSuperscriptResp _defaultInstance;

  Int64 get superscriptNumber => $_getI64(0);
  set superscriptNumber(Int64 v) { $_setInt64(0, v); }
  $core.bool hasSuperscriptNumber() => $_has(0);
  void clearSuperscriptNumber() => clearField(1);
}

class UserSetOptionReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UserSetOptionReq', package: const $pb.PackageName('kproto'))
    ..aOS(1, 'name')
    ..aOS(2, 'value')
    ..hasRequiredFields = false
  ;

  UserSetOptionReq._() : super();
  factory UserSetOptionReq() => create();
  factory UserSetOptionReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserSetOptionReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UserSetOptionReq clone() => UserSetOptionReq()..mergeFromMessage(this);
  UserSetOptionReq copyWith(void Function(UserSetOptionReq) updates) => super.copyWith((message) => updates(message as UserSetOptionReq));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserSetOptionReq create() => UserSetOptionReq._();
  UserSetOptionReq createEmptyInstance() => create();
  static $pb.PbList<UserSetOptionReq> createRepeated() => $pb.PbList<UserSetOptionReq>();
  static UserSetOptionReq getDefault() => _defaultInstance ??= create()..freeze();
  static UserSetOptionReq _defaultInstance;

  $core.String get name => $_getS(0, '');
  set name($core.String v) { $_setString(0, v); }
  $core.bool hasName() => $_has(0);
  void clearName() => clearField(1);

  $core.String get value => $_getS(1, '');
  set value($core.String v) { $_setString(1, v); }
  $core.bool hasValue() => $_has(1);
  void clearValue() => clearField(2);
}

class UserSetOptionResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UserSetOptionResp', package: const $pb.PackageName('kproto'))
    ..hasRequiredFields = false
  ;

  UserSetOptionResp._() : super();
  factory UserSetOptionResp() => create();
  factory UserSetOptionResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserSetOptionResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UserSetOptionResp clone() => UserSetOptionResp()..mergeFromMessage(this);
  UserSetOptionResp copyWith(void Function(UserSetOptionResp) updates) => super.copyWith((message) => updates(message as UserSetOptionResp));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserSetOptionResp create() => UserSetOptionResp._();
  UserSetOptionResp createEmptyInstance() => create();
  static $pb.PbList<UserSetOptionResp> createRepeated() => $pb.PbList<UserSetOptionResp>();
  static UserSetOptionResp getDefault() => _defaultInstance ??= create()..freeze();
  static UserSetOptionResp _defaultInstance;
}

class UserGetOptionReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UserGetOptionReq', package: const $pb.PackageName('kproto'))
    ..aOS(1, 'name')
    ..hasRequiredFields = false
  ;

  UserGetOptionReq._() : super();
  factory UserGetOptionReq() => create();
  factory UserGetOptionReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserGetOptionReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UserGetOptionReq clone() => UserGetOptionReq()..mergeFromMessage(this);
  UserGetOptionReq copyWith(void Function(UserGetOptionReq) updates) => super.copyWith((message) => updates(message as UserGetOptionReq));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserGetOptionReq create() => UserGetOptionReq._();
  UserGetOptionReq createEmptyInstance() => create();
  static $pb.PbList<UserGetOptionReq> createRepeated() => $pb.PbList<UserGetOptionReq>();
  static UserGetOptionReq getDefault() => _defaultInstance ??= create()..freeze();
  static UserGetOptionReq _defaultInstance;

  $core.String get name => $_getS(0, '');
  set name($core.String v) { $_setString(0, v); }
  $core.bool hasName() => $_has(0);
  void clearName() => clearField(1);
}

class UserGetOptionResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UserGetOptionResp', package: const $pb.PackageName('kproto'))
    ..aOS(1, 'name')
    ..aOS(2, 'value')
    ..hasRequiredFields = false
  ;

  UserGetOptionResp._() : super();
  factory UserGetOptionResp() => create();
  factory UserGetOptionResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserGetOptionResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UserGetOptionResp clone() => UserGetOptionResp()..mergeFromMessage(this);
  UserGetOptionResp copyWith(void Function(UserGetOptionResp) updates) => super.copyWith((message) => updates(message as UserGetOptionResp));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserGetOptionResp create() => UserGetOptionResp._();
  UserGetOptionResp createEmptyInstance() => create();
  static $pb.PbList<UserGetOptionResp> createRepeated() => $pb.PbList<UserGetOptionResp>();
  static UserGetOptionResp getDefault() => _defaultInstance ??= create()..freeze();
  static UserGetOptionResp _defaultInstance;

  $core.String get name => $_getS(0, '');
  set name($core.String v) { $_setString(0, v); }
  $core.bool hasName() => $_has(0);
  void clearName() => clearField(1);

  $core.String get value => $_getS(1, '');
  set value($core.String v) { $_setString(1, v); }
  $core.bool hasValue() => $_has(1);
  void clearValue() => clearField(2);
}

class ContactAddReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ContactAddReq', package: const $pb.PackageName('kproto'))
    ..aInt64(1, 'userID')
    ..hasRequiredFields = false
  ;

  ContactAddReq._() : super();
  factory ContactAddReq() => create();
  factory ContactAddReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ContactAddReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ContactAddReq clone() => ContactAddReq()..mergeFromMessage(this);
  ContactAddReq copyWith(void Function(ContactAddReq) updates) => super.copyWith((message) => updates(message as ContactAddReq));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ContactAddReq create() => ContactAddReq._();
  ContactAddReq createEmptyInstance() => create();
  static $pb.PbList<ContactAddReq> createRepeated() => $pb.PbList<ContactAddReq>();
  static ContactAddReq getDefault() => _defaultInstance ??= create()..freeze();
  static ContactAddReq _defaultInstance;

  Int64 get userID => $_getI64(0);
  set userID(Int64 v) { $_setInt64(0, v); }
  $core.bool hasUserID() => $_has(0);
  void clearUserID() => clearField(1);
}

class ContactAddResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ContactAddResp', package: const $pb.PackageName('kproto'))
    ..hasRequiredFields = false
  ;

  ContactAddResp._() : super();
  factory ContactAddResp() => create();
  factory ContactAddResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ContactAddResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ContactAddResp clone() => ContactAddResp()..mergeFromMessage(this);
  ContactAddResp copyWith(void Function(ContactAddResp) updates) => super.copyWith((message) => updates(message as ContactAddResp));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ContactAddResp create() => ContactAddResp._();
  ContactAddResp createEmptyInstance() => create();
  static $pb.PbList<ContactAddResp> createRepeated() => $pb.PbList<ContactAddResp>();
  static ContactAddResp getDefault() => _defaultInstance ??= create()..freeze();
  static ContactAddResp _defaultInstance;
}

class ContactUpdateReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ContactUpdateReq', package: const $pb.PackageName('kproto'))
    ..hasRequiredFields = false
  ;

  ContactUpdateReq._() : super();
  factory ContactUpdateReq() => create();
  factory ContactUpdateReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ContactUpdateReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ContactUpdateReq clone() => ContactUpdateReq()..mergeFromMessage(this);
  ContactUpdateReq copyWith(void Function(ContactUpdateReq) updates) => super.copyWith((message) => updates(message as ContactUpdateReq));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ContactUpdateReq create() => ContactUpdateReq._();
  ContactUpdateReq createEmptyInstance() => create();
  static $pb.PbList<ContactUpdateReq> createRepeated() => $pb.PbList<ContactUpdateReq>();
  static ContactUpdateReq getDefault() => _defaultInstance ??= create()..freeze();
  static ContactUpdateReq _defaultInstance;
}

class ContactUpdateResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ContactUpdateResp', package: const $pb.PackageName('kproto'))
    ..hasRequiredFields = false
  ;

  ContactUpdateResp._() : super();
  factory ContactUpdateResp() => create();
  factory ContactUpdateResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ContactUpdateResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ContactUpdateResp clone() => ContactUpdateResp()..mergeFromMessage(this);
  ContactUpdateResp copyWith(void Function(ContactUpdateResp) updates) => super.copyWith((message) => updates(message as ContactUpdateResp));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ContactUpdateResp create() => ContactUpdateResp._();
  ContactUpdateResp createEmptyInstance() => create();
  static $pb.PbList<ContactUpdateResp> createRepeated() => $pb.PbList<ContactUpdateResp>();
  static ContactUpdateResp getDefault() => _defaultInstance ??= create()..freeze();
  static ContactUpdateResp _defaultInstance;
}

class ContactDeleteReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ContactDeleteReq', package: const $pb.PackageName('kproto'))
    ..aInt64(1, 'userID')
    ..hasRequiredFields = false
  ;

  ContactDeleteReq._() : super();
  factory ContactDeleteReq() => create();
  factory ContactDeleteReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ContactDeleteReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ContactDeleteReq clone() => ContactDeleteReq()..mergeFromMessage(this);
  ContactDeleteReq copyWith(void Function(ContactDeleteReq) updates) => super.copyWith((message) => updates(message as ContactDeleteReq));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ContactDeleteReq create() => ContactDeleteReq._();
  ContactDeleteReq createEmptyInstance() => create();
  static $pb.PbList<ContactDeleteReq> createRepeated() => $pb.PbList<ContactDeleteReq>();
  static ContactDeleteReq getDefault() => _defaultInstance ??= create()..freeze();
  static ContactDeleteReq _defaultInstance;

  Int64 get userID => $_getI64(0);
  set userID(Int64 v) { $_setInt64(0, v); }
  $core.bool hasUserID() => $_has(0);
  void clearUserID() => clearField(1);
}

class ContactDeleteResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ContactDeleteResp', package: const $pb.PackageName('kproto'))
    ..hasRequiredFields = false
  ;

  ContactDeleteResp._() : super();
  factory ContactDeleteResp() => create();
  factory ContactDeleteResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ContactDeleteResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ContactDeleteResp clone() => ContactDeleteResp()..mergeFromMessage(this);
  ContactDeleteResp copyWith(void Function(ContactDeleteResp) updates) => super.copyWith((message) => updates(message as ContactDeleteResp));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ContactDeleteResp create() => ContactDeleteResp._();
  ContactDeleteResp createEmptyInstance() => create();
  static $pb.PbList<ContactDeleteResp> createRepeated() => $pb.PbList<ContactDeleteResp>();
  static ContactDeleteResp getDefault() => _defaultInstance ??= create()..freeze();
  static ContactDeleteResp _defaultInstance;
}

class ContactGetContactsReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ContactGetContactsReq', package: const $pb.PackageName('kproto'))
    ..hasRequiredFields = false
  ;

  ContactGetContactsReq._() : super();
  factory ContactGetContactsReq() => create();
  factory ContactGetContactsReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ContactGetContactsReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ContactGetContactsReq clone() => ContactGetContactsReq()..mergeFromMessage(this);
  ContactGetContactsReq copyWith(void Function(ContactGetContactsReq) updates) => super.copyWith((message) => updates(message as ContactGetContactsReq));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ContactGetContactsReq create() => ContactGetContactsReq._();
  ContactGetContactsReq createEmptyInstance() => create();
  static $pb.PbList<ContactGetContactsReq> createRepeated() => $pb.PbList<ContactGetContactsReq>();
  static ContactGetContactsReq getDefault() => _defaultInstance ??= create()..freeze();
  static ContactGetContactsReq _defaultInstance;
}

class ContactGetContactsResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ContactGetContactsResp', package: const $pb.PackageName('kproto'))
    ..pc<Member>(1, 'contacts', $pb.PbFieldType.PM,Member.create)
    ..hasRequiredFields = false
  ;

  ContactGetContactsResp._() : super();
  factory ContactGetContactsResp() => create();
  factory ContactGetContactsResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ContactGetContactsResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ContactGetContactsResp clone() => ContactGetContactsResp()..mergeFromMessage(this);
  ContactGetContactsResp copyWith(void Function(ContactGetContactsResp) updates) => super.copyWith((message) => updates(message as ContactGetContactsResp));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ContactGetContactsResp create() => ContactGetContactsResp._();
  ContactGetContactsResp createEmptyInstance() => create();
  static $pb.PbList<ContactGetContactsResp> createRepeated() => $pb.PbList<ContactGetContactsResp>();
  static ContactGetContactsResp getDefault() => _defaultInstance ??= create()..freeze();
  static ContactGetContactsResp _defaultInstance;

  $core.List<Member> get contacts => $_getList(0);
}

class Chat extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Chat', package: const $pb.PackageName('kproto'))
    ..aInt64(1, 'chatID')
    ..aInt64(2, 'createAt')
    ..aInt64(3, 'updatedAt')
    ..a<$core.int>(4, 'chatType', $pb.PbFieldType.O3)
    ..aOS(5, 'title')
    ..aInt64(6, 'avatarFileID')
    ..a<$core.int>(7, 'disabled', $pb.PbFieldType.O3)
    ..aInt64(8, 'creatorID')
    ..a<Int64>(9, 'pinState', $pb.PbFieldType.OU6, Int64.ZERO)
    ..hasRequiredFields = false
  ;

  Chat._() : super();
  factory Chat() => create();
  factory Chat.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Chat.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Chat clone() => Chat()..mergeFromMessage(this);
  Chat copyWith(void Function(Chat) updates) => super.copyWith((message) => updates(message as Chat));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Chat create() => Chat._();
  Chat createEmptyInstance() => create();
  static $pb.PbList<Chat> createRepeated() => $pb.PbList<Chat>();
  static Chat getDefault() => _defaultInstance ??= create()..freeze();
  static Chat _defaultInstance;

  Int64 get chatID => $_getI64(0);
  set chatID(Int64 v) { $_setInt64(0, v); }
  $core.bool hasChatID() => $_has(0);
  void clearChatID() => clearField(1);

  Int64 get createAt => $_getI64(1);
  set createAt(Int64 v) { $_setInt64(1, v); }
  $core.bool hasCreateAt() => $_has(1);
  void clearCreateAt() => clearField(2);

  Int64 get updatedAt => $_getI64(2);
  set updatedAt(Int64 v) { $_setInt64(2, v); }
  $core.bool hasUpdatedAt() => $_has(2);
  void clearUpdatedAt() => clearField(3);

  $core.int get chatType => $_get(3, 0);
  set chatType($core.int v) { $_setSignedInt32(3, v); }
  $core.bool hasChatType() => $_has(3);
  void clearChatType() => clearField(4);

  $core.String get title => $_getS(4, '');
  set title($core.String v) { $_setString(4, v); }
  $core.bool hasTitle() => $_has(4);
  void clearTitle() => clearField(5);

  Int64 get avatarFileID => $_getI64(5);
  set avatarFileID(Int64 v) { $_setInt64(5, v); }
  $core.bool hasAvatarFileID() => $_has(5);
  void clearAvatarFileID() => clearField(6);

  $core.int get disabled => $_get(6, 0);
  set disabled($core.int v) { $_setSignedInt32(6, v); }
  $core.bool hasDisabled() => $_has(6);
  void clearDisabled() => clearField(7);

  Int64 get creatorID => $_getI64(7);
  set creatorID(Int64 v) { $_setInt64(7, v); }
  $core.bool hasCreatorID() => $_has(7);
  void clearCreatorID() => clearField(8);

  Int64 get pinState => $_getI64(8);
  set pinState(Int64 v) { $_setInt64(8, v); }
  $core.bool hasPinState() => $_has(8);
  void clearPinState() => clearField(9);
}

class ChatCreateReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ChatCreateReq', package: const $pb.PackageName('kproto'))
    ..aOS(1, 'title')
    ..hasRequiredFields = false
  ;

  ChatCreateReq._() : super();
  factory ChatCreateReq() => create();
  factory ChatCreateReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatCreateReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ChatCreateReq clone() => ChatCreateReq()..mergeFromMessage(this);
  ChatCreateReq copyWith(void Function(ChatCreateReq) updates) => super.copyWith((message) => updates(message as ChatCreateReq));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ChatCreateReq create() => ChatCreateReq._();
  ChatCreateReq createEmptyInstance() => create();
  static $pb.PbList<ChatCreateReq> createRepeated() => $pb.PbList<ChatCreateReq>();
  static ChatCreateReq getDefault() => _defaultInstance ??= create()..freeze();
  static ChatCreateReq _defaultInstance;

  $core.String get title => $_getS(0, '');
  set title($core.String v) { $_setString(0, v); }
  $core.bool hasTitle() => $_has(0);
  void clearTitle() => clearField(1);
}

class ChatCreateResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ChatCreateResp', package: const $pb.PackageName('kproto'))
    ..a<Chat>(1, 'chat', $pb.PbFieldType.OM, Chat.getDefault, Chat.create)
    ..hasRequiredFields = false
  ;

  ChatCreateResp._() : super();
  factory ChatCreateResp() => create();
  factory ChatCreateResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatCreateResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ChatCreateResp clone() => ChatCreateResp()..mergeFromMessage(this);
  ChatCreateResp copyWith(void Function(ChatCreateResp) updates) => super.copyWith((message) => updates(message as ChatCreateResp));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ChatCreateResp create() => ChatCreateResp._();
  ChatCreateResp createEmptyInstance() => create();
  static $pb.PbList<ChatCreateResp> createRepeated() => $pb.PbList<ChatCreateResp>();
  static ChatCreateResp getDefault() => _defaultInstance ??= create()..freeze();
  static ChatCreateResp _defaultInstance;

  Chat get chat => $_getN(0);
  set chat(Chat v) { setField(1, v); }
  $core.bool hasChat() => $_has(0);
  void clearChat() => clearField(1);
}

class ChatInitiateReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ChatInitiateReq', package: const $pb.PackageName('kproto'))
    ..aInt64(1, 'peerID')
    ..hasRequiredFields = false
  ;

  ChatInitiateReq._() : super();
  factory ChatInitiateReq() => create();
  factory ChatInitiateReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatInitiateReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ChatInitiateReq clone() => ChatInitiateReq()..mergeFromMessage(this);
  ChatInitiateReq copyWith(void Function(ChatInitiateReq) updates) => super.copyWith((message) => updates(message as ChatInitiateReq));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ChatInitiateReq create() => ChatInitiateReq._();
  ChatInitiateReq createEmptyInstance() => create();
  static $pb.PbList<ChatInitiateReq> createRepeated() => $pb.PbList<ChatInitiateReq>();
  static ChatInitiateReq getDefault() => _defaultInstance ??= create()..freeze();
  static ChatInitiateReq _defaultInstance;

  Int64 get peerID => $_getI64(0);
  set peerID(Int64 v) { $_setInt64(0, v); }
  $core.bool hasPeerID() => $_has(0);
  void clearPeerID() => clearField(1);
}

class ChatInitiateResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ChatInitiateResp', package: const $pb.PackageName('kproto'))
    ..a<Chat>(1, 'chat', $pb.PbFieldType.OM, Chat.getDefault, Chat.create)
    ..hasRequiredFields = false
  ;

  ChatInitiateResp._() : super();
  factory ChatInitiateResp() => create();
  factory ChatInitiateResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatInitiateResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ChatInitiateResp clone() => ChatInitiateResp()..mergeFromMessage(this);
  ChatInitiateResp copyWith(void Function(ChatInitiateResp) updates) => super.copyWith((message) => updates(message as ChatInitiateResp));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ChatInitiateResp create() => ChatInitiateResp._();
  ChatInitiateResp createEmptyInstance() => create();
  static $pb.PbList<ChatInitiateResp> createRepeated() => $pb.PbList<ChatInitiateResp>();
  static ChatInitiateResp getDefault() => _defaultInstance ??= create()..freeze();
  static ChatInitiateResp _defaultInstance;

  Chat get chat => $_getN(0);
  set chat(Chat v) { setField(1, v); }
  $core.bool hasChat() => $_has(0);
  void clearChat() => clearField(1);
}

class ChatGetChatsReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ChatGetChatsReq', package: const $pb.PackageName('kproto'))
    ..hasRequiredFields = false
  ;

  ChatGetChatsReq._() : super();
  factory ChatGetChatsReq() => create();
  factory ChatGetChatsReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatGetChatsReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ChatGetChatsReq clone() => ChatGetChatsReq()..mergeFromMessage(this);
  ChatGetChatsReq copyWith(void Function(ChatGetChatsReq) updates) => super.copyWith((message) => updates(message as ChatGetChatsReq));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ChatGetChatsReq create() => ChatGetChatsReq._();
  ChatGetChatsReq createEmptyInstance() => create();
  static $pb.PbList<ChatGetChatsReq> createRepeated() => $pb.PbList<ChatGetChatsReq>();
  static ChatGetChatsReq getDefault() => _defaultInstance ??= create()..freeze();
  static ChatGetChatsReq _defaultInstance;
}

class ChatGetChatsResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ChatGetChatsResp', package: const $pb.PackageName('kproto'))
    ..pc<Chat>(1, 'chats', $pb.PbFieldType.PM,Chat.create)
    ..hasRequiredFields = false
  ;

  ChatGetChatsResp._() : super();
  factory ChatGetChatsResp() => create();
  factory ChatGetChatsResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatGetChatsResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ChatGetChatsResp clone() => ChatGetChatsResp()..mergeFromMessage(this);
  ChatGetChatsResp copyWith(void Function(ChatGetChatsResp) updates) => super.copyWith((message) => updates(message as ChatGetChatsResp));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ChatGetChatsResp create() => ChatGetChatsResp._();
  ChatGetChatsResp createEmptyInstance() => create();
  static $pb.PbList<ChatGetChatsResp> createRepeated() => $pb.PbList<ChatGetChatsResp>();
  static ChatGetChatsResp getDefault() => _defaultInstance ??= create()..freeze();
  static ChatGetChatsResp _defaultInstance;

  $core.List<Chat> get chats => $_getList(0);
}

class ChatAddMemberReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ChatAddMemberReq', package: const $pb.PackageName('kproto'))
    ..aInt64(1, 'chatID')
    ..aInt64(2, 'userID')
    ..hasRequiredFields = false
  ;

  ChatAddMemberReq._() : super();
  factory ChatAddMemberReq() => create();
  factory ChatAddMemberReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatAddMemberReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ChatAddMemberReq clone() => ChatAddMemberReq()..mergeFromMessage(this);
  ChatAddMemberReq copyWith(void Function(ChatAddMemberReq) updates) => super.copyWith((message) => updates(message as ChatAddMemberReq));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ChatAddMemberReq create() => ChatAddMemberReq._();
  ChatAddMemberReq createEmptyInstance() => create();
  static $pb.PbList<ChatAddMemberReq> createRepeated() => $pb.PbList<ChatAddMemberReq>();
  static ChatAddMemberReq getDefault() => _defaultInstance ??= create()..freeze();
  static ChatAddMemberReq _defaultInstance;

  Int64 get chatID => $_getI64(0);
  set chatID(Int64 v) { $_setInt64(0, v); }
  $core.bool hasChatID() => $_has(0);
  void clearChatID() => clearField(1);

  Int64 get userID => $_getI64(1);
  set userID(Int64 v) { $_setInt64(1, v); }
  $core.bool hasUserID() => $_has(1);
  void clearUserID() => clearField(2);
}

class ChatAddMemberResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ChatAddMemberResp', package: const $pb.PackageName('kproto'))
    ..hasRequiredFields = false
  ;

  ChatAddMemberResp._() : super();
  factory ChatAddMemberResp() => create();
  factory ChatAddMemberResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatAddMemberResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ChatAddMemberResp clone() => ChatAddMemberResp()..mergeFromMessage(this);
  ChatAddMemberResp copyWith(void Function(ChatAddMemberResp) updates) => super.copyWith((message) => updates(message as ChatAddMemberResp));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ChatAddMemberResp create() => ChatAddMemberResp._();
  ChatAddMemberResp createEmptyInstance() => create();
  static $pb.PbList<ChatAddMemberResp> createRepeated() => $pb.PbList<ChatAddMemberResp>();
  static ChatAddMemberResp getDefault() => _defaultInstance ??= create()..freeze();
  static ChatAddMemberResp _defaultInstance;
}

class ChatDeleteMemberReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ChatDeleteMemberReq', package: const $pb.PackageName('kproto'))
    ..aInt64(1, 'chatID')
    ..aInt64(2, 'userID')
    ..hasRequiredFields = false
  ;

  ChatDeleteMemberReq._() : super();
  factory ChatDeleteMemberReq() => create();
  factory ChatDeleteMemberReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatDeleteMemberReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ChatDeleteMemberReq clone() => ChatDeleteMemberReq()..mergeFromMessage(this);
  ChatDeleteMemberReq copyWith(void Function(ChatDeleteMemberReq) updates) => super.copyWith((message) => updates(message as ChatDeleteMemberReq));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ChatDeleteMemberReq create() => ChatDeleteMemberReq._();
  ChatDeleteMemberReq createEmptyInstance() => create();
  static $pb.PbList<ChatDeleteMemberReq> createRepeated() => $pb.PbList<ChatDeleteMemberReq>();
  static ChatDeleteMemberReq getDefault() => _defaultInstance ??= create()..freeze();
  static ChatDeleteMemberReq _defaultInstance;

  Int64 get chatID => $_getI64(0);
  set chatID(Int64 v) { $_setInt64(0, v); }
  $core.bool hasChatID() => $_has(0);
  void clearChatID() => clearField(1);

  Int64 get userID => $_getI64(1);
  set userID(Int64 v) { $_setInt64(1, v); }
  $core.bool hasUserID() => $_has(1);
  void clearUserID() => clearField(2);
}

class ChatDeleteMemberResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ChatDeleteMemberResp', package: const $pb.PackageName('kproto'))
    ..hasRequiredFields = false
  ;

  ChatDeleteMemberResp._() : super();
  factory ChatDeleteMemberResp() => create();
  factory ChatDeleteMemberResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatDeleteMemberResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ChatDeleteMemberResp clone() => ChatDeleteMemberResp()..mergeFromMessage(this);
  ChatDeleteMemberResp copyWith(void Function(ChatDeleteMemberResp) updates) => super.copyWith((message) => updates(message as ChatDeleteMemberResp));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ChatDeleteMemberResp create() => ChatDeleteMemberResp._();
  ChatDeleteMemberResp createEmptyInstance() => create();
  static $pb.PbList<ChatDeleteMemberResp> createRepeated() => $pb.PbList<ChatDeleteMemberResp>();
  static ChatDeleteMemberResp getDefault() => _defaultInstance ??= create()..freeze();
  static ChatDeleteMemberResp _defaultInstance;
}

class ChatUpdateProfileReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ChatUpdateProfileReq', package: const $pb.PackageName('kproto'))
    ..aInt64(1, 'chatID')
    ..aOS(2, 'title')
    ..aInt64(3, 'avatarFileID')
    ..hasRequiredFields = false
  ;

  ChatUpdateProfileReq._() : super();
  factory ChatUpdateProfileReq() => create();
  factory ChatUpdateProfileReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatUpdateProfileReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ChatUpdateProfileReq clone() => ChatUpdateProfileReq()..mergeFromMessage(this);
  ChatUpdateProfileReq copyWith(void Function(ChatUpdateProfileReq) updates) => super.copyWith((message) => updates(message as ChatUpdateProfileReq));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ChatUpdateProfileReq create() => ChatUpdateProfileReq._();
  ChatUpdateProfileReq createEmptyInstance() => create();
  static $pb.PbList<ChatUpdateProfileReq> createRepeated() => $pb.PbList<ChatUpdateProfileReq>();
  static ChatUpdateProfileReq getDefault() => _defaultInstance ??= create()..freeze();
  static ChatUpdateProfileReq _defaultInstance;

  Int64 get chatID => $_getI64(0);
  set chatID(Int64 v) { $_setInt64(0, v); }
  $core.bool hasChatID() => $_has(0);
  void clearChatID() => clearField(1);

  $core.String get title => $_getS(1, '');
  set title($core.String v) { $_setString(1, v); }
  $core.bool hasTitle() => $_has(1);
  void clearTitle() => clearField(2);

  Int64 get avatarFileID => $_getI64(2);
  set avatarFileID(Int64 v) { $_setInt64(2, v); }
  $core.bool hasAvatarFileID() => $_has(2);
  void clearAvatarFileID() => clearField(3);
}

class ChatUpdateProfileResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ChatUpdateProfileResp', package: const $pb.PackageName('kproto'))
    ..hasRequiredFields = false
  ;

  ChatUpdateProfileResp._() : super();
  factory ChatUpdateProfileResp() => create();
  factory ChatUpdateProfileResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatUpdateProfileResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ChatUpdateProfileResp clone() => ChatUpdateProfileResp()..mergeFromMessage(this);
  ChatUpdateProfileResp copyWith(void Function(ChatUpdateProfileResp) updates) => super.copyWith((message) => updates(message as ChatUpdateProfileResp));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ChatUpdateProfileResp create() => ChatUpdateProfileResp._();
  ChatUpdateProfileResp createEmptyInstance() => create();
  static $pb.PbList<ChatUpdateProfileResp> createRepeated() => $pb.PbList<ChatUpdateProfileResp>();
  static ChatUpdateProfileResp getDefault() => _defaultInstance ??= create()..freeze();
  static ChatUpdateProfileResp _defaultInstance;
}

class Member extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Member', package: const $pb.PackageName('kproto'))
    ..aInt64(1, 'userID')
    ..hasRequiredFields = false
  ;

  Member._() : super();
  factory Member() => create();
  factory Member.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Member.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Member clone() => Member()..mergeFromMessage(this);
  Member copyWith(void Function(Member) updates) => super.copyWith((message) => updates(message as Member));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Member create() => Member._();
  Member createEmptyInstance() => create();
  static $pb.PbList<Member> createRepeated() => $pb.PbList<Member>();
  static Member getDefault() => _defaultInstance ??= create()..freeze();
  static Member _defaultInstance;

  Int64 get userID => $_getI64(0);
  set userID(Int64 v) { $_setInt64(0, v); }
  $core.bool hasUserID() => $_has(0);
  void clearUserID() => clearField(1);
}

class ChatGetMembersReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ChatGetMembersReq', package: const $pb.PackageName('kproto'))
    ..aInt64(1, 'chatID')
    ..hasRequiredFields = false
  ;

  ChatGetMembersReq._() : super();
  factory ChatGetMembersReq() => create();
  factory ChatGetMembersReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatGetMembersReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ChatGetMembersReq clone() => ChatGetMembersReq()..mergeFromMessage(this);
  ChatGetMembersReq copyWith(void Function(ChatGetMembersReq) updates) => super.copyWith((message) => updates(message as ChatGetMembersReq));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ChatGetMembersReq create() => ChatGetMembersReq._();
  ChatGetMembersReq createEmptyInstance() => create();
  static $pb.PbList<ChatGetMembersReq> createRepeated() => $pb.PbList<ChatGetMembersReq>();
  static ChatGetMembersReq getDefault() => _defaultInstance ??= create()..freeze();
  static ChatGetMembersReq _defaultInstance;

  Int64 get chatID => $_getI64(0);
  set chatID(Int64 v) { $_setInt64(0, v); }
  $core.bool hasChatID() => $_has(0);
  void clearChatID() => clearField(1);
}

class ChatGetMembersResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ChatGetMembersResp', package: const $pb.PackageName('kproto'))
    ..pc<Member>(1, 'members', $pb.PbFieldType.PM,Member.create)
    ..hasRequiredFields = false
  ;

  ChatGetMembersResp._() : super();
  factory ChatGetMembersResp() => create();
  factory ChatGetMembersResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatGetMembersResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ChatGetMembersResp clone() => ChatGetMembersResp()..mergeFromMessage(this);
  ChatGetMembersResp copyWith(void Function(ChatGetMembersResp) updates) => super.copyWith((message) => updates(message as ChatGetMembersResp));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ChatGetMembersResp create() => ChatGetMembersResp._();
  ChatGetMembersResp createEmptyInstance() => create();
  static $pb.PbList<ChatGetMembersResp> createRepeated() => $pb.PbList<ChatGetMembersResp>();
  static ChatGetMembersResp getDefault() => _defaultInstance ??= create()..freeze();
  static ChatGetMembersResp _defaultInstance;

  $core.List<Member> get members => $_getList(0);
}

class Markup extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Markup', package: const $pb.PackageName('kproto'))
    ..a<$core.int>(1, 'columnSize', $pb.PbFieldType.O3)
    ..pc<MarkupElement>(2, 'elements', $pb.PbFieldType.PM,MarkupElement.create)
    ..hasRequiredFields = false
  ;

  Markup._() : super();
  factory Markup() => create();
  factory Markup.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Markup.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Markup clone() => Markup()..mergeFromMessage(this);
  Markup copyWith(void Function(Markup) updates) => super.copyWith((message) => updates(message as Markup));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Markup create() => Markup._();
  Markup createEmptyInstance() => create();
  static $pb.PbList<Markup> createRepeated() => $pb.PbList<Markup>();
  static Markup getDefault() => _defaultInstance ??= create()..freeze();
  static Markup _defaultInstance;

  $core.int get columnSize => $_get(0, 0);
  set columnSize($core.int v) { $_setSignedInt32(0, v); }
  $core.bool hasColumnSize() => $_has(0);
  void clearColumnSize() => clearField(1);

  $core.List<MarkupElement> get elements => $_getList(1);
}

class MarkupElement extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('MarkupElement', package: const $pb.PackageName('kproto'))
    ..a<$core.int>(1, 'elementType', $pb.PbFieldType.O3)
    ..aOS(2, 'caption')
    ..aInt64(3, 'fileID')
    ..aOS(4, 'message')
    ..hasRequiredFields = false
  ;

  MarkupElement._() : super();
  factory MarkupElement() => create();
  factory MarkupElement.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MarkupElement.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  MarkupElement clone() => MarkupElement()..mergeFromMessage(this);
  MarkupElement copyWith(void Function(MarkupElement) updates) => super.copyWith((message) => updates(message as MarkupElement));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MarkupElement create() => MarkupElement._();
  MarkupElement createEmptyInstance() => create();
  static $pb.PbList<MarkupElement> createRepeated() => $pb.PbList<MarkupElement>();
  static MarkupElement getDefault() => _defaultInstance ??= create()..freeze();
  static MarkupElement _defaultInstance;

  $core.int get elementType => $_get(0, 0);
  set elementType($core.int v) { $_setSignedInt32(0, v); }
  $core.bool hasElementType() => $_has(0);
  void clearElementType() => clearField(1);

  $core.String get caption => $_getS(1, '');
  set caption($core.String v) { $_setString(1, v); }
  $core.bool hasCaption() => $_has(1);
  void clearCaption() => clearField(2);

  Int64 get fileID => $_getI64(2);
  set fileID(Int64 v) { $_setInt64(2, v); }
  $core.bool hasFileID() => $_has(2);
  void clearFileID() => clearField(3);

  $core.String get message => $_getS(3, '');
  set message($core.String v) { $_setString(3, v); }
  $core.bool hasMessage() => $_has(3);
  void clearMessage() => clearField(4);
}

class ChatMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ChatMessage', package: const $pb.PackageName('kproto'))
    ..aInt64(1, 'chatID')
    ..aOS(2, 'senderName')
    ..a<$core.int>(3, 'contentType', $pb.PbFieldType.O3)
    ..aOS(4, 'message')
    ..aInt64(5, 'fileID')
    ..aInt64(6, 'actionTime')
    ..a<Markup>(7, 'markup', $pb.PbFieldType.OM, Markup.getDefault, Markup.create)
    ..a<Int64>(8, 'replyState', $pb.PbFieldType.OU6, Int64.ZERO)
    ..aInt64(9, 'forwardChatID')
    ..a<Int64>(10, 'forwardState', $pb.PbFieldType.OU6, Int64.ZERO)
    ..hasRequiredFields = false
  ;

  ChatMessage._() : super();
  factory ChatMessage() => create();
  factory ChatMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ChatMessage clone() => ChatMessage()..mergeFromMessage(this);
  ChatMessage copyWith(void Function(ChatMessage) updates) => super.copyWith((message) => updates(message as ChatMessage));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ChatMessage create() => ChatMessage._();
  ChatMessage createEmptyInstance() => create();
  static $pb.PbList<ChatMessage> createRepeated() => $pb.PbList<ChatMessage>();
  static ChatMessage getDefault() => _defaultInstance ??= create()..freeze();
  static ChatMessage _defaultInstance;

  Int64 get chatID => $_getI64(0);
  set chatID(Int64 v) { $_setInt64(0, v); }
  $core.bool hasChatID() => $_has(0);
  void clearChatID() => clearField(1);

  $core.String get senderName => $_getS(1, '');
  set senderName($core.String v) { $_setString(1, v); }
  $core.bool hasSenderName() => $_has(1);
  void clearSenderName() => clearField(2);

  $core.int get contentType => $_get(2, 0);
  set contentType($core.int v) { $_setSignedInt32(2, v); }
  $core.bool hasContentType() => $_has(2);
  void clearContentType() => clearField(3);

  $core.String get message => $_getS(3, '');
  set message($core.String v) { $_setString(3, v); }
  $core.bool hasMessage() => $_has(3);
  void clearMessage() => clearField(4);

  Int64 get fileID => $_getI64(4);
  set fileID(Int64 v) { $_setInt64(4, v); }
  $core.bool hasFileID() => $_has(4);
  void clearFileID() => clearField(5);

  Int64 get actionTime => $_getI64(5);
  set actionTime(Int64 v) { $_setInt64(5, v); }
  $core.bool hasActionTime() => $_has(5);
  void clearActionTime() => clearField(6);

  Markup get markup => $_getN(6);
  set markup(Markup v) { setField(7, v); }
  $core.bool hasMarkup() => $_has(6);
  void clearMarkup() => clearField(7);

  Int64 get replyState => $_getI64(7);
  set replyState(Int64 v) { $_setInt64(7, v); }
  $core.bool hasReplyState() => $_has(7);
  void clearReplyState() => clearField(8);

  Int64 get forwardChatID => $_getI64(8);
  set forwardChatID(Int64 v) { $_setInt64(8, v); }
  $core.bool hasForwardChatID() => $_has(8);
  void clearForwardChatID() => clearField(9);

  Int64 get forwardState => $_getI64(9);
  set forwardState(Int64 v) { $_setInt64(9, v); }
  $core.bool hasForwardState() => $_has(9);
  void clearForwardState() => clearField(10);
}

class ChatSendMessageReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ChatSendMessageReq', package: const $pb.PackageName('kproto'))
    ..a<ChatMessage>(1, 'chatMessage', $pb.PbFieldType.OM, ChatMessage.getDefault, ChatMessage.create)
    ..hasRequiredFields = false
  ;

  ChatSendMessageReq._() : super();
  factory ChatSendMessageReq() => create();
  factory ChatSendMessageReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatSendMessageReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ChatSendMessageReq clone() => ChatSendMessageReq()..mergeFromMessage(this);
  ChatSendMessageReq copyWith(void Function(ChatSendMessageReq) updates) => super.copyWith((message) => updates(message as ChatSendMessageReq));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ChatSendMessageReq create() => ChatSendMessageReq._();
  ChatSendMessageReq createEmptyInstance() => create();
  static $pb.PbList<ChatSendMessageReq> createRepeated() => $pb.PbList<ChatSendMessageReq>();
  static ChatSendMessageReq getDefault() => _defaultInstance ??= create()..freeze();
  static ChatSendMessageReq _defaultInstance;

  ChatMessage get chatMessage => $_getN(0);
  set chatMessage(ChatMessage v) { setField(1, v); }
  $core.bool hasChatMessage() => $_has(0);
  void clearChatMessage() => clearField(1);
}

class ChatSendMessageResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ChatSendMessageResp', package: const $pb.PackageName('kproto'))
    ..a<Int64>(1, 'messageID', $pb.PbFieldType.OU6, Int64.ZERO)
    ..a<Int64>(2, 'state', $pb.PbFieldType.OU6, Int64.ZERO)
    ..hasRequiredFields = false
  ;

  ChatSendMessageResp._() : super();
  factory ChatSendMessageResp() => create();
  factory ChatSendMessageResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatSendMessageResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ChatSendMessageResp clone() => ChatSendMessageResp()..mergeFromMessage(this);
  ChatSendMessageResp copyWith(void Function(ChatSendMessageResp) updates) => super.copyWith((message) => updates(message as ChatSendMessageResp));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ChatSendMessageResp create() => ChatSendMessageResp._();
  ChatSendMessageResp createEmptyInstance() => create();
  static $pb.PbList<ChatSendMessageResp> createRepeated() => $pb.PbList<ChatSendMessageResp>();
  static ChatSendMessageResp getDefault() => _defaultInstance ??= create()..freeze();
  static ChatSendMessageResp _defaultInstance;

  Int64 get messageID => $_getI64(0);
  set messageID(Int64 v) { $_setInt64(0, v); }
  $core.bool hasMessageID() => $_has(0);
  void clearMessageID() => clearField(1);

  Int64 get state => $_getI64(1);
  set state(Int64 v) { $_setInt64(1, v); }
  $core.bool hasState() => $_has(1);
  void clearState() => clearField(2);
}

class ChatDeleteMessageReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ChatDeleteMessageReq', package: const $pb.PackageName('kproto'))
    ..aInt64(1, 'chatID')
    ..a<Int64>(2, 'stateDeleted', $pb.PbFieldType.OU6, Int64.ZERO)
    ..hasRequiredFields = false
  ;

  ChatDeleteMessageReq._() : super();
  factory ChatDeleteMessageReq() => create();
  factory ChatDeleteMessageReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatDeleteMessageReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ChatDeleteMessageReq clone() => ChatDeleteMessageReq()..mergeFromMessage(this);
  ChatDeleteMessageReq copyWith(void Function(ChatDeleteMessageReq) updates) => super.copyWith((message) => updates(message as ChatDeleteMessageReq));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ChatDeleteMessageReq create() => ChatDeleteMessageReq._();
  ChatDeleteMessageReq createEmptyInstance() => create();
  static $pb.PbList<ChatDeleteMessageReq> createRepeated() => $pb.PbList<ChatDeleteMessageReq>();
  static ChatDeleteMessageReq getDefault() => _defaultInstance ??= create()..freeze();
  static ChatDeleteMessageReq _defaultInstance;

  Int64 get chatID => $_getI64(0);
  set chatID(Int64 v) { $_setInt64(0, v); }
  $core.bool hasChatID() => $_has(0);
  void clearChatID() => clearField(1);

  Int64 get stateDeleted => $_getI64(1);
  set stateDeleted(Int64 v) { $_setInt64(1, v); }
  $core.bool hasStateDeleted() => $_has(1);
  void clearStateDeleted() => clearField(2);
}

class ChatDeleteMessageResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ChatDeleteMessageResp', package: const $pb.PackageName('kproto'))
    ..hasRequiredFields = false
  ;

  ChatDeleteMessageResp._() : super();
  factory ChatDeleteMessageResp() => create();
  factory ChatDeleteMessageResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatDeleteMessageResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ChatDeleteMessageResp clone() => ChatDeleteMessageResp()..mergeFromMessage(this);
  ChatDeleteMessageResp copyWith(void Function(ChatDeleteMessageResp) updates) => super.copyWith((message) => updates(message as ChatDeleteMessageResp));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ChatDeleteMessageResp create() => ChatDeleteMessageResp._();
  ChatDeleteMessageResp createEmptyInstance() => create();
  static $pb.PbList<ChatDeleteMessageResp> createRepeated() => $pb.PbList<ChatDeleteMessageResp>();
  static ChatDeleteMessageResp getDefault() => _defaultInstance ??= create()..freeze();
  static ChatDeleteMessageResp _defaultInstance;
}

class ChatPinMessageReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ChatPinMessageReq', package: const $pb.PackageName('kproto'))
    ..aInt64(1, 'chatID')
    ..a<Int64>(2, 'pinState', $pb.PbFieldType.OU6, Int64.ZERO)
    ..hasRequiredFields = false
  ;

  ChatPinMessageReq._() : super();
  factory ChatPinMessageReq() => create();
  factory ChatPinMessageReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatPinMessageReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ChatPinMessageReq clone() => ChatPinMessageReq()..mergeFromMessage(this);
  ChatPinMessageReq copyWith(void Function(ChatPinMessageReq) updates) => super.copyWith((message) => updates(message as ChatPinMessageReq));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ChatPinMessageReq create() => ChatPinMessageReq._();
  ChatPinMessageReq createEmptyInstance() => create();
  static $pb.PbList<ChatPinMessageReq> createRepeated() => $pb.PbList<ChatPinMessageReq>();
  static ChatPinMessageReq getDefault() => _defaultInstance ??= create()..freeze();
  static ChatPinMessageReq _defaultInstance;

  Int64 get chatID => $_getI64(0);
  set chatID(Int64 v) { $_setInt64(0, v); }
  $core.bool hasChatID() => $_has(0);
  void clearChatID() => clearField(1);

  Int64 get pinState => $_getI64(1);
  set pinState(Int64 v) { $_setInt64(1, v); }
  $core.bool hasPinState() => $_has(1);
  void clearPinState() => clearField(2);
}

class ChatPinMessageResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ChatPinMessageResp', package: const $pb.PackageName('kproto'))
    ..hasRequiredFields = false
  ;

  ChatPinMessageResp._() : super();
  factory ChatPinMessageResp() => create();
  factory ChatPinMessageResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatPinMessageResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ChatPinMessageResp clone() => ChatPinMessageResp()..mergeFromMessage(this);
  ChatPinMessageResp copyWith(void Function(ChatPinMessageResp) updates) => super.copyWith((message) => updates(message as ChatPinMessageResp));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ChatPinMessageResp create() => ChatPinMessageResp._();
  ChatPinMessageResp createEmptyInstance() => create();
  static $pb.PbList<ChatPinMessageResp> createRepeated() => $pb.PbList<ChatPinMessageResp>();
  static ChatPinMessageResp getDefault() => _defaultInstance ??= create()..freeze();
  static ChatPinMessageResp _defaultInstance;
}

class ChatGetStateReadReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ChatGetStateReadReq', package: const $pb.PackageName('kproto'))
    ..aInt64(1, 'chatID')
    ..hasRequiredFields = false
  ;

  ChatGetStateReadReq._() : super();
  factory ChatGetStateReadReq() => create();
  factory ChatGetStateReadReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatGetStateReadReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ChatGetStateReadReq clone() => ChatGetStateReadReq()..mergeFromMessage(this);
  ChatGetStateReadReq copyWith(void Function(ChatGetStateReadReq) updates) => super.copyWith((message) => updates(message as ChatGetStateReadReq));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ChatGetStateReadReq create() => ChatGetStateReadReq._();
  ChatGetStateReadReq createEmptyInstance() => create();
  static $pb.PbList<ChatGetStateReadReq> createRepeated() => $pb.PbList<ChatGetStateReadReq>();
  static ChatGetStateReadReq getDefault() => _defaultInstance ??= create()..freeze();
  static ChatGetStateReadReq _defaultInstance;

  Int64 get chatID => $_getI64(0);
  set chatID(Int64 v) { $_setInt64(0, v); }
  $core.bool hasChatID() => $_has(0);
  void clearChatID() => clearField(1);
}

class ChatGetStateReadResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ChatGetStateReadResp', package: const $pb.PackageName('kproto'))
    ..a<Int64>(1, 'stateRead', $pb.PbFieldType.OU6, Int64.ZERO)
    ..a<Int64>(2, 'ownStateRead', $pb.PbFieldType.OU6, Int64.ZERO)
    ..hasRequiredFields = false
  ;

  ChatGetStateReadResp._() : super();
  factory ChatGetStateReadResp() => create();
  factory ChatGetStateReadResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatGetStateReadResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ChatGetStateReadResp clone() => ChatGetStateReadResp()..mergeFromMessage(this);
  ChatGetStateReadResp copyWith(void Function(ChatGetStateReadResp) updates) => super.copyWith((message) => updates(message as ChatGetStateReadResp));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ChatGetStateReadResp create() => ChatGetStateReadResp._();
  ChatGetStateReadResp createEmptyInstance() => create();
  static $pb.PbList<ChatGetStateReadResp> createRepeated() => $pb.PbList<ChatGetStateReadResp>();
  static ChatGetStateReadResp getDefault() => _defaultInstance ??= create()..freeze();
  static ChatGetStateReadResp _defaultInstance;

  Int64 get stateRead => $_getI64(0);
  set stateRead(Int64 v) { $_setInt64(0, v); }
  $core.bool hasStateRead() => $_has(0);
  void clearStateRead() => clearField(1);

  Int64 get ownStateRead => $_getI64(1);
  set ownStateRead(Int64 v) { $_setInt64(1, v); }
  $core.bool hasOwnStateRead() => $_has(1);
  void clearOwnStateRead() => clearField(2);
}

class ChatSetTypingReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ChatSetTypingReq', package: const $pb.PackageName('kproto'))
    ..aInt64(1, 'chatID')
    ..hasRequiredFields = false
  ;

  ChatSetTypingReq._() : super();
  factory ChatSetTypingReq() => create();
  factory ChatSetTypingReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatSetTypingReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ChatSetTypingReq clone() => ChatSetTypingReq()..mergeFromMessage(this);
  ChatSetTypingReq copyWith(void Function(ChatSetTypingReq) updates) => super.copyWith((message) => updates(message as ChatSetTypingReq));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ChatSetTypingReq create() => ChatSetTypingReq._();
  ChatSetTypingReq createEmptyInstance() => create();
  static $pb.PbList<ChatSetTypingReq> createRepeated() => $pb.PbList<ChatSetTypingReq>();
  static ChatSetTypingReq getDefault() => _defaultInstance ??= create()..freeze();
  static ChatSetTypingReq _defaultInstance;

  Int64 get chatID => $_getI64(0);
  set chatID(Int64 v) { $_setInt64(0, v); }
  $core.bool hasChatID() => $_has(0);
  void clearChatID() => clearField(1);
}

class ChatSetTypingResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ChatSetTypingResp', package: const $pb.PackageName('kproto'))
    ..hasRequiredFields = false
  ;

  ChatSetTypingResp._() : super();
  factory ChatSetTypingResp() => create();
  factory ChatSetTypingResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatSetTypingResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ChatSetTypingResp clone() => ChatSetTypingResp()..mergeFromMessage(this);
  ChatSetTypingResp copyWith(void Function(ChatSetTypingResp) updates) => super.copyWith((message) => updates(message as ChatSetTypingResp));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ChatSetTypingResp create() => ChatSetTypingResp._();
  ChatSetTypingResp createEmptyInstance() => create();
  static $pb.PbList<ChatSetTypingResp> createRepeated() => $pb.PbList<ChatSetTypingResp>();
  static ChatSetTypingResp getDefault() => _defaultInstance ??= create()..freeze();
  static ChatSetTypingResp _defaultInstance;
}

class ChatSyncChatStateMessagesReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ChatSyncChatStateMessagesReq', package: const $pb.PackageName('kproto'))
    ..aInt64(1, 'chatID')
    ..a<Int64>(2, 'state', $pb.PbFieldType.OU6, Int64.ZERO)
    ..a<$core.int>(3, 'limit', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  ChatSyncChatStateMessagesReq._() : super();
  factory ChatSyncChatStateMessagesReq() => create();
  factory ChatSyncChatStateMessagesReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatSyncChatStateMessagesReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ChatSyncChatStateMessagesReq clone() => ChatSyncChatStateMessagesReq()..mergeFromMessage(this);
  ChatSyncChatStateMessagesReq copyWith(void Function(ChatSyncChatStateMessagesReq) updates) => super.copyWith((message) => updates(message as ChatSyncChatStateMessagesReq));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ChatSyncChatStateMessagesReq create() => ChatSyncChatStateMessagesReq._();
  ChatSyncChatStateMessagesReq createEmptyInstance() => create();
  static $pb.PbList<ChatSyncChatStateMessagesReq> createRepeated() => $pb.PbList<ChatSyncChatStateMessagesReq>();
  static ChatSyncChatStateMessagesReq getDefault() => _defaultInstance ??= create()..freeze();
  static ChatSyncChatStateMessagesReq _defaultInstance;

  Int64 get chatID => $_getI64(0);
  set chatID(Int64 v) { $_setInt64(0, v); }
  $core.bool hasChatID() => $_has(0);
  void clearChatID() => clearField(1);

  Int64 get state => $_getI64(1);
  set state(Int64 v) { $_setInt64(1, v); }
  $core.bool hasState() => $_has(1);
  void clearState() => clearField(2);

  $core.int get limit => $_get(2, 0);
  set limit($core.int v) { $_setUnsignedInt32(2, v); }
  $core.bool hasLimit() => $_has(2);
  void clearLimit() => clearField(3);
}

class ChatSyncChatStateMessagesResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ChatSyncChatStateMessagesResp', package: const $pb.PackageName('kproto'))
    ..pc<StateUpdate>(1, 'stateUpdates', $pb.PbFieldType.PM,StateUpdate.create)
    ..hasRequiredFields = false
  ;

  ChatSyncChatStateMessagesResp._() : super();
  factory ChatSyncChatStateMessagesResp() => create();
  factory ChatSyncChatStateMessagesResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatSyncChatStateMessagesResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ChatSyncChatStateMessagesResp clone() => ChatSyncChatStateMessagesResp()..mergeFromMessage(this);
  ChatSyncChatStateMessagesResp copyWith(void Function(ChatSyncChatStateMessagesResp) updates) => super.copyWith((message) => updates(message as ChatSyncChatStateMessagesResp));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ChatSyncChatStateMessagesResp create() => ChatSyncChatStateMessagesResp._();
  ChatSyncChatStateMessagesResp createEmptyInstance() => create();
  static $pb.PbList<ChatSyncChatStateMessagesResp> createRepeated() => $pb.PbList<ChatSyncChatStateMessagesResp>();
  static ChatSyncChatStateMessagesResp getDefault() => _defaultInstance ??= create()..freeze();
  static ChatSyncChatStateMessagesResp _defaultInstance;

  $core.List<StateUpdate> get stateUpdates => $_getList(0);
}

class ChatGetChatStateMessagesCondition extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ChatGetChatStateMessagesCondition', package: const $pb.PackageName('kproto'))
    ..aInt64(1, 'senderID')
    ..aInt64(2, 'chatID')
    ..a<Int64>(3, 'state', $pb.PbFieldType.OU6, Int64.ZERO)
    ..a<Int64>(4, 'stateBefore', $pb.PbFieldType.OU6, Int64.ZERO)
    ..a<Int64>(5, 'stateAfter', $pb.PbFieldType.OU6, Int64.ZERO)
    ..p<$core.int>(6, 'messageTypes', $pb.PbFieldType.P3)
    ..aOS(7, 'messageContent')
    ..a<TimeRange>(8, 'actionTimeRange', $pb.PbFieldType.OM, TimeRange.getDefault, TimeRange.create)
    ..hasRequiredFields = false
  ;

  ChatGetChatStateMessagesCondition._() : super();
  factory ChatGetChatStateMessagesCondition() => create();
  factory ChatGetChatStateMessagesCondition.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatGetChatStateMessagesCondition.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ChatGetChatStateMessagesCondition clone() => ChatGetChatStateMessagesCondition()..mergeFromMessage(this);
  ChatGetChatStateMessagesCondition copyWith(void Function(ChatGetChatStateMessagesCondition) updates) => super.copyWith((message) => updates(message as ChatGetChatStateMessagesCondition));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ChatGetChatStateMessagesCondition create() => ChatGetChatStateMessagesCondition._();
  ChatGetChatStateMessagesCondition createEmptyInstance() => create();
  static $pb.PbList<ChatGetChatStateMessagesCondition> createRepeated() => $pb.PbList<ChatGetChatStateMessagesCondition>();
  static ChatGetChatStateMessagesCondition getDefault() => _defaultInstance ??= create()..freeze();
  static ChatGetChatStateMessagesCondition _defaultInstance;

  Int64 get senderID => $_getI64(0);
  set senderID(Int64 v) { $_setInt64(0, v); }
  $core.bool hasSenderID() => $_has(0);
  void clearSenderID() => clearField(1);

  Int64 get chatID => $_getI64(1);
  set chatID(Int64 v) { $_setInt64(1, v); }
  $core.bool hasChatID() => $_has(1);
  void clearChatID() => clearField(2);

  Int64 get state => $_getI64(2);
  set state(Int64 v) { $_setInt64(2, v); }
  $core.bool hasState() => $_has(2);
  void clearState() => clearField(3);

  Int64 get stateBefore => $_getI64(3);
  set stateBefore(Int64 v) { $_setInt64(3, v); }
  $core.bool hasStateBefore() => $_has(3);
  void clearStateBefore() => clearField(4);

  Int64 get stateAfter => $_getI64(4);
  set stateAfter(Int64 v) { $_setInt64(4, v); }
  $core.bool hasStateAfter() => $_has(4);
  void clearStateAfter() => clearField(5);

  $core.List<$core.int> get messageTypes => $_getList(5);

  $core.String get messageContent => $_getS(6, '');
  set messageContent($core.String v) { $_setString(6, v); }
  $core.bool hasMessageContent() => $_has(6);
  void clearMessageContent() => clearField(7);

  TimeRange get actionTimeRange => $_getN(7);
  set actionTimeRange(TimeRange v) { setField(8, v); }
  $core.bool hasActionTimeRange() => $_has(7);
  void clearActionTimeRange() => clearField(8);
}

class ChatGetChatStateMessagesReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ChatGetChatStateMessagesReq', package: const $pb.PackageName('kproto'))
    ..a<Paging>(1, 'paging', $pb.PbFieldType.OM, Paging.getDefault, Paging.create)
    ..a<ChatGetChatStateMessagesCondition>(2, 'condition', $pb.PbFieldType.OM, ChatGetChatStateMessagesCondition.getDefault, ChatGetChatStateMessagesCondition.create)
    ..hasRequiredFields = false
  ;

  ChatGetChatStateMessagesReq._() : super();
  factory ChatGetChatStateMessagesReq() => create();
  factory ChatGetChatStateMessagesReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatGetChatStateMessagesReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ChatGetChatStateMessagesReq clone() => ChatGetChatStateMessagesReq()..mergeFromMessage(this);
  ChatGetChatStateMessagesReq copyWith(void Function(ChatGetChatStateMessagesReq) updates) => super.copyWith((message) => updates(message as ChatGetChatStateMessagesReq));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ChatGetChatStateMessagesReq create() => ChatGetChatStateMessagesReq._();
  ChatGetChatStateMessagesReq createEmptyInstance() => create();
  static $pb.PbList<ChatGetChatStateMessagesReq> createRepeated() => $pb.PbList<ChatGetChatStateMessagesReq>();
  static ChatGetChatStateMessagesReq getDefault() => _defaultInstance ??= create()..freeze();
  static ChatGetChatStateMessagesReq _defaultInstance;

  Paging get paging => $_getN(0);
  set paging(Paging v) { setField(1, v); }
  $core.bool hasPaging() => $_has(0);
  void clearPaging() => clearField(1);

  ChatGetChatStateMessagesCondition get condition => $_getN(1);
  set condition(ChatGetChatStateMessagesCondition v) { setField(2, v); }
  $core.bool hasCondition() => $_has(1);
  void clearCondition() => clearField(2);
}

class ChatGetChatStateMessagesResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ChatGetChatStateMessagesResp', package: const $pb.PackageName('kproto'))
    ..a<Paging>(1, 'paging', $pb.PbFieldType.OM, Paging.getDefault, Paging.create)
    ..pc<StateUpdate>(2, 'stateUpdates', $pb.PbFieldType.PM,StateUpdate.create)
    ..hasRequiredFields = false
  ;

  ChatGetChatStateMessagesResp._() : super();
  factory ChatGetChatStateMessagesResp() => create();
  factory ChatGetChatStateMessagesResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatGetChatStateMessagesResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ChatGetChatStateMessagesResp clone() => ChatGetChatStateMessagesResp()..mergeFromMessage(this);
  ChatGetChatStateMessagesResp copyWith(void Function(ChatGetChatStateMessagesResp) updates) => super.copyWith((message) => updates(message as ChatGetChatStateMessagesResp));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ChatGetChatStateMessagesResp create() => ChatGetChatStateMessagesResp._();
  ChatGetChatStateMessagesResp createEmptyInstance() => create();
  static $pb.PbList<ChatGetChatStateMessagesResp> createRepeated() => $pb.PbList<ChatGetChatStateMessagesResp>();
  static ChatGetChatStateMessagesResp getDefault() => _defaultInstance ??= create()..freeze();
  static ChatGetChatStateMessagesResp _defaultInstance;

  Paging get paging => $_getN(0);
  set paging(Paging v) { setField(1, v); }
  $core.bool hasPaging() => $_has(0);
  void clearPaging() => clearField(1);

  $core.List<StateUpdate> get stateUpdates => $_getList(1);
}

class ChatReadMessageReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ChatReadMessageReq', package: const $pb.PackageName('kproto'))
    ..aInt64(1, 'chatID')
    ..a<Int64>(2, 'stateRead', $pb.PbFieldType.OU6, Int64.ZERO)
    ..hasRequiredFields = false
  ;

  ChatReadMessageReq._() : super();
  factory ChatReadMessageReq() => create();
  factory ChatReadMessageReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatReadMessageReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ChatReadMessageReq clone() => ChatReadMessageReq()..mergeFromMessage(this);
  ChatReadMessageReq copyWith(void Function(ChatReadMessageReq) updates) => super.copyWith((message) => updates(message as ChatReadMessageReq));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ChatReadMessageReq create() => ChatReadMessageReq._();
  ChatReadMessageReq createEmptyInstance() => create();
  static $pb.PbList<ChatReadMessageReq> createRepeated() => $pb.PbList<ChatReadMessageReq>();
  static ChatReadMessageReq getDefault() => _defaultInstance ??= create()..freeze();
  static ChatReadMessageReq _defaultInstance;

  Int64 get chatID => $_getI64(0);
  set chatID(Int64 v) { $_setInt64(0, v); }
  $core.bool hasChatID() => $_has(0);
  void clearChatID() => clearField(1);

  Int64 get stateRead => $_getI64(1);
  set stateRead(Int64 v) { $_setInt64(1, v); }
  $core.bool hasStateRead() => $_has(1);
  void clearStateRead() => clearField(2);
}

class ChatReadMessageResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ChatReadMessageResp', package: const $pb.PackageName('kproto'))
    ..hasRequiredFields = false
  ;

  ChatReadMessageResp._() : super();
  factory ChatReadMessageResp() => create();
  factory ChatReadMessageResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatReadMessageResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ChatReadMessageResp clone() => ChatReadMessageResp()..mergeFromMessage(this);
  ChatReadMessageResp copyWith(void Function(ChatReadMessageResp) updates) => super.copyWith((message) => updates(message as ChatReadMessageResp));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ChatReadMessageResp create() => ChatReadMessageResp._();
  ChatReadMessageResp createEmptyInstance() => create();
  static $pb.PbList<ChatReadMessageResp> createRepeated() => $pb.PbList<ChatReadMessageResp>();
  static ChatReadMessageResp getDefault() => _defaultInstance ??= create()..freeze();
  static ChatReadMessageResp _defaultInstance;
}

class DfsFile extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('DfsFile', package: const $pb.PackageName('kproto'))
    ..aInt64(1, 'fileID')
    ..aOS(2, 'caption')
    ..aInt64(3, 'fileSize')
    ..aOS(4, 'ext')
    ..a<$core.int>(5, 'contentType', $pb.PbFieldType.O3)
    ..a<$core.int>(6, 'width', $pb.PbFieldType.O3)
    ..a<$core.int>(7, 'height', $pb.PbFieldType.O3)
    ..aOS(8, 'uRL')
    ..hasRequiredFields = false
  ;

  DfsFile._() : super();
  factory DfsFile() => create();
  factory DfsFile.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DfsFile.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  DfsFile clone() => DfsFile()..mergeFromMessage(this);
  DfsFile copyWith(void Function(DfsFile) updates) => super.copyWith((message) => updates(message as DfsFile));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DfsFile create() => DfsFile._();
  DfsFile createEmptyInstance() => create();
  static $pb.PbList<DfsFile> createRepeated() => $pb.PbList<DfsFile>();
  static DfsFile getDefault() => _defaultInstance ??= create()..freeze();
  static DfsFile _defaultInstance;

  Int64 get fileID => $_getI64(0);
  set fileID(Int64 v) { $_setInt64(0, v); }
  $core.bool hasFileID() => $_has(0);
  void clearFileID() => clearField(1);

  $core.String get caption => $_getS(1, '');
  set caption($core.String v) { $_setString(1, v); }
  $core.bool hasCaption() => $_has(1);
  void clearCaption() => clearField(2);

  Int64 get fileSize => $_getI64(2);
  set fileSize(Int64 v) { $_setInt64(2, v); }
  $core.bool hasFileSize() => $_has(2);
  void clearFileSize() => clearField(3);

  $core.String get ext => $_getS(3, '');
  set ext($core.String v) { $_setString(3, v); }
  $core.bool hasExt() => $_has(3);
  void clearExt() => clearField(4);

  $core.int get contentType => $_get(4, 0);
  set contentType($core.int v) { $_setSignedInt32(4, v); }
  $core.bool hasContentType() => $_has(4);
  void clearContentType() => clearField(5);

  $core.int get width => $_get(5, 0);
  set width($core.int v) { $_setSignedInt32(5, v); }
  $core.bool hasWidth() => $_has(5);
  void clearWidth() => clearField(6);

  $core.int get height => $_get(6, 0);
  set height($core.int v) { $_setSignedInt32(6, v); }
  $core.bool hasHeight() => $_has(6);
  void clearHeight() => clearField(7);

  $core.String get uRL => $_getS(7, '');
  set uRL($core.String v) { $_setString(7, v); }
  $core.bool hasURL() => $_has(7);
  void clearURL() => clearField(8);
}

class UtilityUploadReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UtilityUploadReq', package: const $pb.PackageName('kproto'))
    ..aInt64(1, 'chatID')
    ..a<$core.int>(2, 'contentType', $pb.PbFieldType.O3)
    ..aOS(3, 'fileName')
    ..aOS(4, 'caption')
    ..a<$core.int>(5, 'width', $pb.PbFieldType.O3)
    ..a<$core.int>(6, 'height', $pb.PbFieldType.O3)
    ..a<$core.List<$core.int>>(7, 'data', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  UtilityUploadReq._() : super();
  factory UtilityUploadReq() => create();
  factory UtilityUploadReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UtilityUploadReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UtilityUploadReq clone() => UtilityUploadReq()..mergeFromMessage(this);
  UtilityUploadReq copyWith(void Function(UtilityUploadReq) updates) => super.copyWith((message) => updates(message as UtilityUploadReq));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UtilityUploadReq create() => UtilityUploadReq._();
  UtilityUploadReq createEmptyInstance() => create();
  static $pb.PbList<UtilityUploadReq> createRepeated() => $pb.PbList<UtilityUploadReq>();
  static UtilityUploadReq getDefault() => _defaultInstance ??= create()..freeze();
  static UtilityUploadReq _defaultInstance;

  Int64 get chatID => $_getI64(0);
  set chatID(Int64 v) { $_setInt64(0, v); }
  $core.bool hasChatID() => $_has(0);
  void clearChatID() => clearField(1);

  $core.int get contentType => $_get(1, 0);
  set contentType($core.int v) { $_setSignedInt32(1, v); }
  $core.bool hasContentType() => $_has(1);
  void clearContentType() => clearField(2);

  $core.String get fileName => $_getS(2, '');
  set fileName($core.String v) { $_setString(2, v); }
  $core.bool hasFileName() => $_has(2);
  void clearFileName() => clearField(3);

  $core.String get caption => $_getS(3, '');
  set caption($core.String v) { $_setString(3, v); }
  $core.bool hasCaption() => $_has(3);
  void clearCaption() => clearField(4);

  $core.int get width => $_get(4, 0);
  set width($core.int v) { $_setSignedInt32(4, v); }
  $core.bool hasWidth() => $_has(4);
  void clearWidth() => clearField(5);

  $core.int get height => $_get(5, 0);
  set height($core.int v) { $_setSignedInt32(5, v); }
  $core.bool hasHeight() => $_has(5);
  void clearHeight() => clearField(6);

  $core.List<$core.int> get data => $_getN(6);
  set data($core.List<$core.int> v) { $_setBytes(6, v); }
  $core.bool hasData() => $_has(6);
  void clearData() => clearField(7);
}

class UtilityUploadResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UtilityUploadResp', package: const $pb.PackageName('kproto'))
    ..a<DfsFile>(1, 'file', $pb.PbFieldType.OM, DfsFile.getDefault, DfsFile.create)
    ..hasRequiredFields = false
  ;

  UtilityUploadResp._() : super();
  factory UtilityUploadResp() => create();
  factory UtilityUploadResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UtilityUploadResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UtilityUploadResp clone() => UtilityUploadResp()..mergeFromMessage(this);
  UtilityUploadResp copyWith(void Function(UtilityUploadResp) updates) => super.copyWith((message) => updates(message as UtilityUploadResp));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UtilityUploadResp create() => UtilityUploadResp._();
  UtilityUploadResp createEmptyInstance() => create();
  static $pb.PbList<UtilityUploadResp> createRepeated() => $pb.PbList<UtilityUploadResp>();
  static UtilityUploadResp getDefault() => _defaultInstance ??= create()..freeze();
  static UtilityUploadResp _defaultInstance;

  DfsFile get file => $_getN(0);
  set file(DfsFile v) { setField(1, v); }
  $core.bool hasFile() => $_has(0);
  void clearFile() => clearField(1);
}

class UtilityNewMultipartUploadReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UtilityNewMultipartUploadReq', package: const $pb.PackageName('kproto'))
    ..aInt64(1, 'chatID')
    ..a<$core.int>(2, 'contentType', $pb.PbFieldType.O3)
    ..aOS(3, 'fileName')
    ..aOS(4, 'caption')
    ..a<$core.int>(5, 'width', $pb.PbFieldType.O3)
    ..a<$core.int>(6, 'height', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  UtilityNewMultipartUploadReq._() : super();
  factory UtilityNewMultipartUploadReq() => create();
  factory UtilityNewMultipartUploadReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UtilityNewMultipartUploadReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UtilityNewMultipartUploadReq clone() => UtilityNewMultipartUploadReq()..mergeFromMessage(this);
  UtilityNewMultipartUploadReq copyWith(void Function(UtilityNewMultipartUploadReq) updates) => super.copyWith((message) => updates(message as UtilityNewMultipartUploadReq));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UtilityNewMultipartUploadReq create() => UtilityNewMultipartUploadReq._();
  UtilityNewMultipartUploadReq createEmptyInstance() => create();
  static $pb.PbList<UtilityNewMultipartUploadReq> createRepeated() => $pb.PbList<UtilityNewMultipartUploadReq>();
  static UtilityNewMultipartUploadReq getDefault() => _defaultInstance ??= create()..freeze();
  static UtilityNewMultipartUploadReq _defaultInstance;

  Int64 get chatID => $_getI64(0);
  set chatID(Int64 v) { $_setInt64(0, v); }
  $core.bool hasChatID() => $_has(0);
  void clearChatID() => clearField(1);

  $core.int get contentType => $_get(1, 0);
  set contentType($core.int v) { $_setSignedInt32(1, v); }
  $core.bool hasContentType() => $_has(1);
  void clearContentType() => clearField(2);

  $core.String get fileName => $_getS(2, '');
  set fileName($core.String v) { $_setString(2, v); }
  $core.bool hasFileName() => $_has(2);
  void clearFileName() => clearField(3);

  $core.String get caption => $_getS(3, '');
  set caption($core.String v) { $_setString(3, v); }
  $core.bool hasCaption() => $_has(3);
  void clearCaption() => clearField(4);

  $core.int get width => $_get(4, 0);
  set width($core.int v) { $_setSignedInt32(4, v); }
  $core.bool hasWidth() => $_has(4);
  void clearWidth() => clearField(5);

  $core.int get height => $_get(5, 0);
  set height($core.int v) { $_setSignedInt32(5, v); }
  $core.bool hasHeight() => $_has(5);
  void clearHeight() => clearField(6);
}

class UtilityNewMultipartUploadResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UtilityNewMultipartUploadResp', package: const $pb.PackageName('kproto'))
    ..aOS(1, 'uploadID')
    ..hasRequiredFields = false
  ;

  UtilityNewMultipartUploadResp._() : super();
  factory UtilityNewMultipartUploadResp() => create();
  factory UtilityNewMultipartUploadResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UtilityNewMultipartUploadResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UtilityNewMultipartUploadResp clone() => UtilityNewMultipartUploadResp()..mergeFromMessage(this);
  UtilityNewMultipartUploadResp copyWith(void Function(UtilityNewMultipartUploadResp) updates) => super.copyWith((message) => updates(message as UtilityNewMultipartUploadResp));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UtilityNewMultipartUploadResp create() => UtilityNewMultipartUploadResp._();
  UtilityNewMultipartUploadResp createEmptyInstance() => create();
  static $pb.PbList<UtilityNewMultipartUploadResp> createRepeated() => $pb.PbList<UtilityNewMultipartUploadResp>();
  static UtilityNewMultipartUploadResp getDefault() => _defaultInstance ??= create()..freeze();
  static UtilityNewMultipartUploadResp _defaultInstance;

  $core.String get uploadID => $_getS(0, '');
  set uploadID($core.String v) { $_setString(0, v); }
  $core.bool hasUploadID() => $_has(0);
  void clearUploadID() => clearField(1);
}

class UtilityUploadPartReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UtilityUploadPartReq', package: const $pb.PackageName('kproto'))
    ..aOS(1, 'uploadID')
    ..a<$core.int>(2, 'partSequence', $pb.PbFieldType.O3)
    ..a<$core.List<$core.int>>(3, 'data', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  UtilityUploadPartReq._() : super();
  factory UtilityUploadPartReq() => create();
  factory UtilityUploadPartReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UtilityUploadPartReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UtilityUploadPartReq clone() => UtilityUploadPartReq()..mergeFromMessage(this);
  UtilityUploadPartReq copyWith(void Function(UtilityUploadPartReq) updates) => super.copyWith((message) => updates(message as UtilityUploadPartReq));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UtilityUploadPartReq create() => UtilityUploadPartReq._();
  UtilityUploadPartReq createEmptyInstance() => create();
  static $pb.PbList<UtilityUploadPartReq> createRepeated() => $pb.PbList<UtilityUploadPartReq>();
  static UtilityUploadPartReq getDefault() => _defaultInstance ??= create()..freeze();
  static UtilityUploadPartReq _defaultInstance;

  $core.String get uploadID => $_getS(0, '');
  set uploadID($core.String v) { $_setString(0, v); }
  $core.bool hasUploadID() => $_has(0);
  void clearUploadID() => clearField(1);

  $core.int get partSequence => $_get(1, 0);
  set partSequence($core.int v) { $_setSignedInt32(1, v); }
  $core.bool hasPartSequence() => $_has(1);
  void clearPartSequence() => clearField(2);

  $core.List<$core.int> get data => $_getN(2);
  set data($core.List<$core.int> v) { $_setBytes(2, v); }
  $core.bool hasData() => $_has(2);
  void clearData() => clearField(3);
}

class UtilityUploadPartResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UtilityUploadPartResp', package: const $pb.PackageName('kproto'))
    ..hasRequiredFields = false
  ;

  UtilityUploadPartResp._() : super();
  factory UtilityUploadPartResp() => create();
  factory UtilityUploadPartResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UtilityUploadPartResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UtilityUploadPartResp clone() => UtilityUploadPartResp()..mergeFromMessage(this);
  UtilityUploadPartResp copyWith(void Function(UtilityUploadPartResp) updates) => super.copyWith((message) => updates(message as UtilityUploadPartResp));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UtilityUploadPartResp create() => UtilityUploadPartResp._();
  UtilityUploadPartResp createEmptyInstance() => create();
  static $pb.PbList<UtilityUploadPartResp> createRepeated() => $pb.PbList<UtilityUploadPartResp>();
  static UtilityUploadPartResp getDefault() => _defaultInstance ??= create()..freeze();
  static UtilityUploadPartResp _defaultInstance;
}

class UtilityCompleteMultipartUploadReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UtilityCompleteMultipartUploadReq', package: const $pb.PackageName('kproto'))
    ..aOS(1, 'uploadID')
    ..hasRequiredFields = false
  ;

  UtilityCompleteMultipartUploadReq._() : super();
  factory UtilityCompleteMultipartUploadReq() => create();
  factory UtilityCompleteMultipartUploadReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UtilityCompleteMultipartUploadReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UtilityCompleteMultipartUploadReq clone() => UtilityCompleteMultipartUploadReq()..mergeFromMessage(this);
  UtilityCompleteMultipartUploadReq copyWith(void Function(UtilityCompleteMultipartUploadReq) updates) => super.copyWith((message) => updates(message as UtilityCompleteMultipartUploadReq));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UtilityCompleteMultipartUploadReq create() => UtilityCompleteMultipartUploadReq._();
  UtilityCompleteMultipartUploadReq createEmptyInstance() => create();
  static $pb.PbList<UtilityCompleteMultipartUploadReq> createRepeated() => $pb.PbList<UtilityCompleteMultipartUploadReq>();
  static UtilityCompleteMultipartUploadReq getDefault() => _defaultInstance ??= create()..freeze();
  static UtilityCompleteMultipartUploadReq _defaultInstance;

  $core.String get uploadID => $_getS(0, '');
  set uploadID($core.String v) { $_setString(0, v); }
  $core.bool hasUploadID() => $_has(0);
  void clearUploadID() => clearField(1);
}

class UtilityCompleteMultipartUploadResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UtilityCompleteMultipartUploadResp', package: const $pb.PackageName('kproto'))
    ..a<DfsFile>(1, 'file', $pb.PbFieldType.OM, DfsFile.getDefault, DfsFile.create)
    ..hasRequiredFields = false
  ;

  UtilityCompleteMultipartUploadResp._() : super();
  factory UtilityCompleteMultipartUploadResp() => create();
  factory UtilityCompleteMultipartUploadResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UtilityCompleteMultipartUploadResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UtilityCompleteMultipartUploadResp clone() => UtilityCompleteMultipartUploadResp()..mergeFromMessage(this);
  UtilityCompleteMultipartUploadResp copyWith(void Function(UtilityCompleteMultipartUploadResp) updates) => super.copyWith((message) => updates(message as UtilityCompleteMultipartUploadResp));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UtilityCompleteMultipartUploadResp create() => UtilityCompleteMultipartUploadResp._();
  UtilityCompleteMultipartUploadResp createEmptyInstance() => create();
  static $pb.PbList<UtilityCompleteMultipartUploadResp> createRepeated() => $pb.PbList<UtilityCompleteMultipartUploadResp>();
  static UtilityCompleteMultipartUploadResp getDefault() => _defaultInstance ??= create()..freeze();
  static UtilityCompleteMultipartUploadResp _defaultInstance;

  DfsFile get file => $_getN(0);
  set file(DfsFile v) { setField(1, v); }
  $core.bool hasFile() => $_has(0);
  void clearFile() => clearField(1);
}

class UtilityDownloadReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UtilityDownloadReq', package: const $pb.PackageName('kproto'))
    ..aInt64(1, 'fileID')
    ..aInt64(2, 'offset')
    ..aInt64(3, 'length')
    ..hasRequiredFields = false
  ;

  UtilityDownloadReq._() : super();
  factory UtilityDownloadReq() => create();
  factory UtilityDownloadReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UtilityDownloadReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UtilityDownloadReq clone() => UtilityDownloadReq()..mergeFromMessage(this);
  UtilityDownloadReq copyWith(void Function(UtilityDownloadReq) updates) => super.copyWith((message) => updates(message as UtilityDownloadReq));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UtilityDownloadReq create() => UtilityDownloadReq._();
  UtilityDownloadReq createEmptyInstance() => create();
  static $pb.PbList<UtilityDownloadReq> createRepeated() => $pb.PbList<UtilityDownloadReq>();
  static UtilityDownloadReq getDefault() => _defaultInstance ??= create()..freeze();
  static UtilityDownloadReq _defaultInstance;

  Int64 get fileID => $_getI64(0);
  set fileID(Int64 v) { $_setInt64(0, v); }
  $core.bool hasFileID() => $_has(0);
  void clearFileID() => clearField(1);

  Int64 get offset => $_getI64(1);
  set offset(Int64 v) { $_setInt64(1, v); }
  $core.bool hasOffset() => $_has(1);
  void clearOffset() => clearField(2);

  Int64 get length => $_getI64(2);
  set length(Int64 v) { $_setInt64(2, v); }
  $core.bool hasLength() => $_has(2);
  void clearLength() => clearField(3);
}

class UtilityDownloadResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UtilityDownloadResp', package: const $pb.PackageName('kproto'))
    ..a<$core.List<$core.int>>(1, 'data', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  UtilityDownloadResp._() : super();
  factory UtilityDownloadResp() => create();
  factory UtilityDownloadResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UtilityDownloadResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UtilityDownloadResp clone() => UtilityDownloadResp()..mergeFromMessage(this);
  UtilityDownloadResp copyWith(void Function(UtilityDownloadResp) updates) => super.copyWith((message) => updates(message as UtilityDownloadResp));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UtilityDownloadResp create() => UtilityDownloadResp._();
  UtilityDownloadResp createEmptyInstance() => create();
  static $pb.PbList<UtilityDownloadResp> createRepeated() => $pb.PbList<UtilityDownloadResp>();
  static UtilityDownloadResp getDefault() => _defaultInstance ??= create()..freeze();
  static UtilityDownloadResp _defaultInstance;

  $core.List<$core.int> get data => $_getN(0);
  set data($core.List<$core.int> v) { $_setBytes(0, v); }
  $core.bool hasData() => $_has(0);
  void clearData() => clearField(1);
}

class UtilityFileStatReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UtilityFileStatReq', package: const $pb.PackageName('kproto'))
    ..aInt64(1, 'fileID')
    ..hasRequiredFields = false
  ;

  UtilityFileStatReq._() : super();
  factory UtilityFileStatReq() => create();
  factory UtilityFileStatReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UtilityFileStatReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UtilityFileStatReq clone() => UtilityFileStatReq()..mergeFromMessage(this);
  UtilityFileStatReq copyWith(void Function(UtilityFileStatReq) updates) => super.copyWith((message) => updates(message as UtilityFileStatReq));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UtilityFileStatReq create() => UtilityFileStatReq._();
  UtilityFileStatReq createEmptyInstance() => create();
  static $pb.PbList<UtilityFileStatReq> createRepeated() => $pb.PbList<UtilityFileStatReq>();
  static UtilityFileStatReq getDefault() => _defaultInstance ??= create()..freeze();
  static UtilityFileStatReq _defaultInstance;

  Int64 get fileID => $_getI64(0);
  set fileID(Int64 v) { $_setInt64(0, v); }
  $core.bool hasFileID() => $_has(0);
  void clearFileID() => clearField(1);
}

class UtilityFileStatResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UtilityFileStatResp', package: const $pb.PackageName('kproto'))
    ..a<DfsFile>(1, 'file', $pb.PbFieldType.OM, DfsFile.getDefault, DfsFile.create)
    ..hasRequiredFields = false
  ;

  UtilityFileStatResp._() : super();
  factory UtilityFileStatResp() => create();
  factory UtilityFileStatResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UtilityFileStatResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UtilityFileStatResp clone() => UtilityFileStatResp()..mergeFromMessage(this);
  UtilityFileStatResp copyWith(void Function(UtilityFileStatResp) updates) => super.copyWith((message) => updates(message as UtilityFileStatResp));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UtilityFileStatResp create() => UtilityFileStatResp._();
  UtilityFileStatResp createEmptyInstance() => create();
  static $pb.PbList<UtilityFileStatResp> createRepeated() => $pb.PbList<UtilityFileStatResp>();
  static UtilityFileStatResp getDefault() => _defaultInstance ??= create()..freeze();
  static UtilityFileStatResp _defaultInstance;

  DfsFile get file => $_getN(0);
  set file(DfsFile v) { setField(1, v); }
  $core.bool hasFile() => $_has(0);
  void clearFile() => clearField(1);
}

