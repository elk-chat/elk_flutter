///
//  Generated code. Do not modify.
//  source: lib/protocol/protobuf/koi.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

const Error$json = const {
  '1': 'Error',
  '2': const [
    const {'1': 'Code', '3': 1, '4': 1, '5': 9, '10': 'Code'},
    const {'1': 'Message', '3': 2, '4': 1, '5': 9, '10': 'Message'},
  ],
};

const Success$json = const {
  '1': 'Success',
};

const Paging$json = const {
  '1': 'Paging',
  '2': const [
    const {'1': 'AllCount', '3': 1, '4': 1, '5': 3, '10': 'AllCount'},
    const {'1': 'PageIndex', '3': 2, '4': 1, '5': 3, '10': 'PageIndex'},
    const {'1': 'PageSize', '3': 3, '4': 1, '5': 3, '10': 'PageSize'},
  ],
};

const TimeRange$json = const {
  '1': 'TimeRange',
  '2': const [
    const {'1': 'StartTime', '3': 1, '4': 1, '5': 3, '10': 'StartTime'},
    const {'1': 'EndTime', '3': 2, '4': 1, '5': 3, '10': 'EndTime'},
  ],
};

const StateAck$json = const {
  '1': 'StateAck',
  '2': const [
    const {'1': 'ChatID', '3': 1, '4': 1, '5': 3, '10': 'ChatID'},
    const {'1': 'MessageID', '3': 2, '4': 1, '5': 4, '10': 'MessageID'},
    const {'1': 'State', '3': 3, '4': 1, '5': 4, '10': 'State'},
  ],
};

const StateUpdate$json = const {
  '1': 'StateUpdate',
  '2': const [
    const {'1': 'ChatID', '3': 1, '4': 1, '5': 3, '10': 'ChatID'},
    const {'1': 'SenderID', '3': 2, '4': 1, '5': 3, '10': 'SenderID'},
    const {'1': 'MessageID', '3': 3, '4': 1, '5': 4, '10': 'MessageID'},
    const {'1': 'MessageType', '3': 4, '4': 1, '5': 5, '10': 'MessageType'},
    const {'1': 'State', '3': 5, '4': 1, '5': 4, '10': 'State'},
    const {'1': 'ActionTime', '3': 6, '4': 1, '5': 3, '10': 'ActionTime'},
    const {'1': 'UpdateMessage', '3': 7, '4': 1, '5': 11, '6': '.kproto.UpdateMessage', '10': 'UpdateMessage'},
  ],
};

const UpdateMessage$json = const {
  '1': 'UpdateMessage',
  '2': const [
    const {'1': 'UpdateMessageChatAddMember', '3': 1, '4': 1, '5': 11, '6': '.kproto.UpdateMessageChatAddMember', '10': 'UpdateMessageChatAddMember'},
    const {'1': 'UpdateMessageChatSendMessage', '3': 2, '4': 1, '5': 11, '6': '.kproto.UpdateMessageChatSendMessage', '10': 'UpdateMessageChatSendMessage'},
    const {'1': 'UpdateMessageChatReadMessage', '3': 3, '4': 1, '5': 11, '6': '.kproto.UpdateMessageChatReadMessage', '10': 'UpdateMessageChatReadMessage'},
    const {'1': 'UpdateMessageChatDeleteMember', '3': 4, '4': 1, '5': 11, '6': '.kproto.UpdateMessageChatDeleteMember', '10': 'UpdateMessageChatDeleteMember'},
    const {'1': 'UpdateMessageChatSetTyping', '3': 5, '4': 1, '5': 11, '6': '.kproto.UpdateMessageChatSetTyping', '10': 'UpdateMessageChatSetTyping'},
    const {'1': 'UpdateMessageChatDeleteMessage', '3': 6, '4': 1, '5': 11, '6': '.kproto.UpdateMessageChatDeleteMessage', '10': 'UpdateMessageChatDeleteMessage'},
    const {'1': 'UpdateMessageChatPinMessage', '3': 7, '4': 1, '5': 11, '6': '.kproto.UpdateMessageChatPinMessage', '10': 'UpdateMessageChatPinMessage'},
  ],
};

const UpdateMessageChatAddMember$json = const {
  '1': 'UpdateMessageChatAddMember',
  '2': const [
    const {'1': 'ChatID', '3': 1, '4': 1, '5': 3, '10': 'ChatID'},
    const {'1': 'SenderName', '3': 2, '4': 1, '5': 9, '10': 'SenderName'},
    const {'1': 'AddedMemeberName', '3': 3, '4': 1, '5': 9, '10': 'AddedMemeberName'},
  ],
};

const UpdateMessageChatDeleteMember$json = const {
  '1': 'UpdateMessageChatDeleteMember',
  '2': const [
    const {'1': 'ChatID', '3': 1, '4': 1, '5': 3, '10': 'ChatID'},
    const {'1': 'SenderName', '3': 2, '4': 1, '5': 9, '10': 'SenderName'},
    const {'1': 'DeletedMemeberName', '3': 3, '4': 1, '5': 9, '10': 'DeletedMemeberName'},
  ],
};

const UpdateMessageChatSendMessage$json = const {
  '1': 'UpdateMessageChatSendMessage',
  '2': const [
    const {'1': 'ChatMessage', '3': 1, '4': 1, '5': 11, '6': '.kproto.ChatMessage', '10': 'ChatMessage'},
  ],
};

const UpdateMessageChatDeleteMessage$json = const {
  '1': 'UpdateMessageChatDeleteMessage',
  '2': const [
    const {'1': 'ChatID', '3': 1, '4': 1, '5': 3, '10': 'ChatID'},
    const {'1': 'SenderName', '3': 2, '4': 1, '5': 9, '10': 'SenderName'},
    const {'1': 'StateDeleted', '3': 3, '4': 1, '5': 4, '10': 'StateDeleted'},
  ],
};

const UpdateMessageChatReadMessage$json = const {
  '1': 'UpdateMessageChatReadMessage',
  '2': const [
    const {'1': 'ChatID', '3': 1, '4': 1, '5': 3, '10': 'ChatID'},
    const {'1': 'SenderName', '3': 2, '4': 1, '5': 9, '10': 'SenderName'},
    const {'1': 'StateRead', '3': 3, '4': 1, '5': 4, '10': 'StateRead'},
  ],
};

const UpdateMessageChatSetTyping$json = const {
  '1': 'UpdateMessageChatSetTyping',
  '2': const [
    const {'1': 'ChatID', '3': 1, '4': 1, '5': 3, '10': 'ChatID'},
    const {'1': 'SenderName', '3': 2, '4': 1, '5': 9, '10': 'SenderName'},
  ],
};

const UpdateMessageChatPinMessage$json = const {
  '1': 'UpdateMessageChatPinMessage',
  '2': const [
    const {'1': 'ChatID', '3': 1, '4': 1, '5': 3, '10': 'ChatID'},
    const {'1': 'PinState', '3': 2, '4': 1, '5': 4, '10': 'PinState'},
  ],
};

const InitConnectionReq$json = const {
  '1': 'InitConnectionReq',
};

const InitConnectionResp$json = const {
  '1': 'InitConnectionResp',
};

const AuthPGReq$json = const {
  '1': 'AuthPGReq',
};

const AuthPGResp$json = const {
  '1': 'AuthPGResp',
  '2': const [
    const {'1': 'P', '3': 1, '4': 1, '5': 12, '10': 'P'},
    const {'1': 'G', '3': 2, '4': 1, '5': 12, '10': 'G'},
  ],
};

const AuthKeyExchangeReq$json = const {
  '1': 'AuthKeyExchangeReq',
  '2': const [
    const {'1': 'ClientNonce', '3': 1, '4': 1, '5': 12, '10': 'ClientNonce'},
  ],
};

const AuthKeyExchangeResp$json = const {
  '1': 'AuthKeyExchangeResp',
  '2': const [
    const {'1': 'ServerNonce', '3': 1, '4': 1, '5': 12, '10': 'ServerNonce'},
    const {'1': 'AuthKeyID', '3': 2, '4': 1, '5': 4, '10': 'AuthKeyID'},
  ],
};

const HeartbeatReq$json = const {
  '1': 'HeartbeatReq',
};

const HeartbeatResp$json = const {
  '1': 'HeartbeatResp',
};

const RequestVerificationCodeReq$json = const {
  '1': 'RequestVerificationCodeReq',
};

const RequestVerificationCodeResp$json = const {
  '1': 'RequestVerificationCodeResp',
};

const CheckAppUpdateReq$json = const {
  '1': 'CheckAppUpdateReq',
};

const CheckAppUpdateResp$json = const {
  '1': 'CheckAppUpdateResp',
};

const User$json = const {
  '1': 'User',
  '2': const [
    const {'1': 'UserID', '3': 1, '4': 1, '5': 3, '10': 'UserID'},
    const {'1': 'UserName', '3': 2, '4': 1, '5': 9, '10': 'UserName'},
    const {'1': 'AvatarFileID', '3': 3, '4': 1, '5': 3, '10': 'AvatarFileID'},
  ],
};

const UserRegisterReq$json = const {
  '1': 'UserRegisterReq',
  '2': const [
    const {'1': 'UserName', '3': 1, '4': 1, '5': 9, '10': 'UserName'},
    const {'1': 'Password', '3': 2, '4': 1, '5': 9, '10': 'Password'},
  ],
};

const UserRegisterResp$json = const {
  '1': 'UserRegisterResp',
  '2': const [
    const {'1': 'User', '3': 1, '4': 1, '5': 11, '6': '.kproto.User', '10': 'User'},
  ],
};

const UserLoginReq$json = const {
  '1': 'UserLoginReq',
  '2': const [
    const {'1': 'UserName', '3': 1, '4': 1, '5': 9, '10': 'UserName'},
    const {'1': 'Password', '3': 2, '4': 1, '5': 9, '10': 'Password'},
    const {'1': 'Token', '3': 3, '4': 1, '5': 9, '10': 'Token'},
    const {'1': 'ClientApplication', '3': 4, '4': 1, '5': 9, '10': 'ClientApplication'},
    const {'1': 'ClientPlatform', '3': 5, '4': 1, '5': 9, '10': 'ClientPlatform'},
  ],
};

const UserLoginResp$json = const {
  '1': 'UserLoginResp',
  '2': const [
    const {'1': 'SessionID', '3': 1, '4': 1, '5': 4, '10': 'SessionID'},
    const {'1': 'Token', '3': 2, '4': 1, '5': 9, '10': 'Token'},
    const {'1': 'User', '3': 3, '4': 1, '5': 11, '6': '.kproto.User', '10': 'User'},
  ],
};

const BotLoginReq$json = const {
  '1': 'BotLoginReq',
  '2': const [
    const {'1': 'BotToken', '3': 1, '4': 1, '5': 9, '10': 'BotToken'},
  ],
};

const BotLoginResp$json = const {
  '1': 'BotLoginResp',
  '2': const [
    const {'1': 'SessionID', '3': 1, '4': 1, '5': 4, '10': 'SessionID'},
    const {'1': 'Token', '3': 2, '4': 1, '5': 9, '10': 'Token'},
    const {'1': 'User', '3': 3, '4': 1, '5': 11, '6': '.kproto.User', '10': 'User'},
  ],
};

const UserLogoutReq$json = const {
  '1': 'UserLogoutReq',
};

const UserLogoutResp$json = const {
  '1': 'UserLogoutResp',
};

const UserUpdateProfileReq$json = const {
  '1': 'UserUpdateProfileReq',
  '2': const [
    const {'1': 'AvatarFileID', '3': 1, '4': 1, '5': 3, '10': 'AvatarFileID'},
  ],
};

const UserUpdateProfileResp$json = const {
  '1': 'UserUpdateProfileResp',
};

const UserChangePasswordReq$json = const {
  '1': 'UserChangePasswordReq',
  '2': const [
    const {'1': 'OldPassword', '3': 1, '4': 1, '5': 9, '10': 'OldPassword'},
    const {'1': 'NewPassword', '3': 2, '4': 1, '5': 9, '10': 'NewPassword'},
  ],
};

const UserChangePasswordResp$json = const {
  '1': 'UserChangePasswordResp',
};

const UserGetFullUserReq$json = const {
  '1': 'UserGetFullUserReq',
  '2': const [
    const {'1': 'UserID', '3': 1, '4': 1, '5': 3, '10': 'UserID'},
  ],
};

const UserGetFullUserResp$json = const {
  '1': 'UserGetFullUserResp',
  '2': const [
    const {'1': 'User', '3': 1, '4': 1, '5': 11, '6': '.kproto.User', '10': 'User'},
  ],
};

const UserGetFullUsersReq$json = const {
  '1': 'UserGetFullUsersReq',
  '2': const [
    const {'1': 'UserIDs', '3': 1, '4': 3, '5': 3, '10': 'UserIDs'},
  ],
};

const UserGetFullUsersResp$json = const {
  '1': 'UserGetFullUsersResp',
  '2': const [
    const {'1': 'Users', '3': 1, '4': 3, '5': 11, '6': '.kproto.User', '10': 'Users'},
  ],
};

const UserGetUsersCondition$json = const {
  '1': 'UserGetUsersCondition',
  '2': const [
    const {'1': 'UserName', '3': 1, '4': 1, '5': 9, '10': 'UserName'},
  ],
};

const UserGetUsersReq$json = const {
  '1': 'UserGetUsersReq',
  '2': const [
    const {'1': 'Paging', '3': 1, '4': 1, '5': 11, '6': '.kproto.Paging', '10': 'Paging'},
    const {'1': 'Condition', '3': 2, '4': 1, '5': 11, '6': '.kproto.UserGetUsersCondition', '10': 'Condition'},
  ],
};

const UserGetUsersResp$json = const {
  '1': 'UserGetUsersResp',
  '2': const [
    const {'1': 'Paging', '3': 1, '4': 1, '5': 11, '6': '.kproto.Paging', '10': 'Paging'},
    const {'1': 'Users', '3': 2, '4': 3, '5': 11, '6': '.kproto.User', '10': 'Users'},
  ],
};

const ChatUserState$json = const {
  '1': 'ChatUserState',
  '2': const [
    const {'1': 'ChatID', '3': 1, '4': 1, '5': 3, '10': 'ChatID'},
    const {'1': 'UserID', '3': 2, '4': 1, '5': 3, '10': 'UserID'},
    const {'1': 'State', '3': 3, '4': 1, '5': 4, '10': 'State'},
    const {'1': 'StateRead', '3': 4, '4': 1, '5': 4, '10': 'StateRead'},
  ],
};

const UserGetChatUserStateReq$json = const {
  '1': 'UserGetChatUserStateReq',
  '2': const [
    const {'1': 'ChatID', '3': 1, '4': 1, '5': 3, '10': 'ChatID'},
  ],
};

const UserGetChatUserStateResp$json = const {
  '1': 'UserGetChatUserStateResp',
  '2': const [
    const {'1': 'State', '3': 1, '4': 1, '5': 11, '6': '.kproto.ChatUserState', '10': 'State'},
  ],
};

const UserAddBlockedUserReq$json = const {
  '1': 'UserAddBlockedUserReq',
  '2': const [
    const {'1': 'UserID', '3': 1, '4': 1, '5': 3, '10': 'UserID'},
  ],
};

const UserAddBlockedUserResp$json = const {
  '1': 'UserAddBlockedUserResp',
};

const UserDeleteBlockedUserReq$json = const {
  '1': 'UserDeleteBlockedUserReq',
  '2': const [
    const {'1': 'UserID', '3': 1, '4': 1, '5': 3, '10': 'UserID'},
  ],
};

const UserDeleteBlockedUserResp$json = const {
  '1': 'UserDeleteBlockedUserResp',
};

const ChatUserSettings$json = const {
  '1': 'ChatUserSettings',
  '2': const [
    const {'1': 'ChatID', '3': 1, '4': 1, '5': 3, '10': 'ChatID'},
    const {'1': 'UserID', '3': 2, '4': 1, '5': 3, '10': 'UserID'},
    const {'1': 'Invisible', '3': 3, '4': 1, '5': 5, '10': 'Invisible'},
  ],
};

const UserSetChatUserSettingsReq$json = const {
  '1': 'UserSetChatUserSettingsReq',
  '2': const [
    const {'1': 'ChatUserSettings', '3': 1, '4': 1, '5': 11, '6': '.kproto.ChatUserSettings', '10': 'ChatUserSettings'},
  ],
};

const UserSetChatUserSettingsResp$json = const {
  '1': 'UserSetChatUserSettingsResp',
};

const UserGetChatUserSettingsReq$json = const {
  '1': 'UserGetChatUserSettingsReq',
  '2': const [
    const {'1': 'ChatID', '3': 1, '4': 1, '5': 3, '10': 'ChatID'},
  ],
};

const UserGetChatUserSettingsResp$json = const {
  '1': 'UserGetChatUserSettingsResp',
  '2': const [
    const {'1': 'ChatUserSettings', '3': 1, '4': 1, '5': 11, '6': '.kproto.ChatUserSettings', '10': 'ChatUserSettings'},
  ],
};

const UserGetChatUserSuperscriptReq$json = const {
  '1': 'UserGetChatUserSuperscriptReq',
  '2': const [
    const {'1': 'ChatID', '3': 1, '4': 1, '5': 3, '10': 'ChatID'},
  ],
};

const UserGetChatUserSuperscriptResp$json = const {
  '1': 'UserGetChatUserSuperscriptResp',
  '2': const [
    const {'1': 'SuperscriptNumber', '3': 1, '4': 1, '5': 4, '10': 'SuperscriptNumber'},
  ],
};

const UserSetOptionReq$json = const {
  '1': 'UserSetOptionReq',
  '2': const [
    const {'1': 'Name', '3': 1, '4': 1, '5': 9, '10': 'Name'},
    const {'1': 'Value', '3': 2, '4': 1, '5': 9, '10': 'Value'},
  ],
};

const UserSetOptionResp$json = const {
  '1': 'UserSetOptionResp',
};

const UserGetOptionReq$json = const {
  '1': 'UserGetOptionReq',
  '2': const [
    const {'1': 'Name', '3': 1, '4': 1, '5': 9, '10': 'Name'},
  ],
};

const UserGetOptionResp$json = const {
  '1': 'UserGetOptionResp',
  '2': const [
    const {'1': 'Name', '3': 1, '4': 1, '5': 9, '10': 'Name'},
    const {'1': 'Value', '3': 2, '4': 1, '5': 9, '10': 'Value'},
  ],
};

const DiscoverItem$json = const {
  '1': 'DiscoverItem',
  '2': const [
    const {'1': 'DiscoverID', '3': 1, '4': 1, '5': 3, '10': 'DiscoverID'},
    const {'1': 'IconURL', '3': 2, '4': 1, '5': 9, '10': 'IconURL'},
    const {'1': 'EntryURL', '3': 3, '4': 1, '5': 9, '10': 'EntryURL'},
    const {'1': 'Remark', '3': 4, '4': 1, '5': 9, '10': 'Remark'},
    const {'1': 'Sort', '3': 5, '4': 1, '5': 5, '10': 'Sort'},
    const {'1': 'DiscoverType', '3': 6, '4': 1, '5': 5, '10': 'DiscoverType'},
  ],
};

const UserGetDiscoverItemsReq$json = const {
  '1': 'UserGetDiscoverItemsReq',
};

const UserGetDiscoverItemsResp$json = const {
  '1': 'UserGetDiscoverItemsResp',
  '2': const [
    const {'1': 'DiscoverItems', '3': 1, '4': 3, '5': 11, '6': '.kproto.DiscoverItem', '10': 'DiscoverItems'},
  ],
};

const ContactAddReq$json = const {
  '1': 'ContactAddReq',
  '2': const [
    const {'1': 'UserID', '3': 1, '4': 1, '5': 3, '10': 'UserID'},
  ],
};

const ContactAddResp$json = const {
  '1': 'ContactAddResp',
};

const ContactUpdateReq$json = const {
  '1': 'ContactUpdateReq',
};

const ContactUpdateResp$json = const {
  '1': 'ContactUpdateResp',
};

const ContactDeleteReq$json = const {
  '1': 'ContactDeleteReq',
  '2': const [
    const {'1': 'UserID', '3': 1, '4': 1, '5': 3, '10': 'UserID'},
  ],
};

const ContactDeleteResp$json = const {
  '1': 'ContactDeleteResp',
};

const ContactGetContactsReq$json = const {
  '1': 'ContactGetContactsReq',
};

const ContactGetContactsResp$json = const {
  '1': 'ContactGetContactsResp',
  '2': const [
    const {'1': 'Contacts', '3': 1, '4': 3, '5': 11, '6': '.kproto.Member', '10': 'Contacts'},
  ],
};

const Chat$json = const {
  '1': 'Chat',
  '2': const [
    const {'1': 'ChatID', '3': 1, '4': 1, '5': 3, '10': 'ChatID'},
    const {'1': 'CreateAt', '3': 2, '4': 1, '5': 3, '10': 'CreateAt'},
    const {'1': 'UpdatedAt', '3': 3, '4': 1, '5': 3, '10': 'UpdatedAt'},
    const {'1': 'ChatType', '3': 4, '4': 1, '5': 5, '10': 'ChatType'},
    const {'1': 'Title', '3': 5, '4': 1, '5': 9, '10': 'Title'},
    const {'1': 'AvatarFileID', '3': 6, '4': 1, '5': 3, '10': 'AvatarFileID'},
    const {'1': 'Disabled', '3': 7, '4': 1, '5': 5, '10': 'Disabled'},
    const {'1': 'CreatorID', '3': 8, '4': 1, '5': 3, '10': 'CreatorID'},
    const {'1': 'PinState', '3': 9, '4': 1, '5': 4, '10': 'PinState'},
  ],
};

const ChatCreateReq$json = const {
  '1': 'ChatCreateReq',
  '2': const [
    const {'1': 'Title', '3': 1, '4': 1, '5': 9, '10': 'Title'},
  ],
};

const ChatCreateResp$json = const {
  '1': 'ChatCreateResp',
  '2': const [
    const {'1': 'Chat', '3': 1, '4': 1, '5': 11, '6': '.kproto.Chat', '10': 'Chat'},
  ],
};

const ChatInitiateReq$json = const {
  '1': 'ChatInitiateReq',
  '2': const [
    const {'1': 'PeerID', '3': 1, '4': 1, '5': 3, '10': 'PeerID'},
  ],
};

const ChatInitiateResp$json = const {
  '1': 'ChatInitiateResp',
  '2': const [
    const {'1': 'Chat', '3': 1, '4': 1, '5': 11, '6': '.kproto.Chat', '10': 'Chat'},
  ],
};

const ChatGetChatsReq$json = const {
  '1': 'ChatGetChatsReq',
};

const ChatGetChatsResp$json = const {
  '1': 'ChatGetChatsResp',
  '2': const [
    const {'1': 'Chats', '3': 1, '4': 3, '5': 11, '6': '.kproto.Chat', '10': 'Chats'},
  ],
};

const ChatAddMemberReq$json = const {
  '1': 'ChatAddMemberReq',
  '2': const [
    const {'1': 'ChatID', '3': 1, '4': 1, '5': 3, '10': 'ChatID'},
    const {'1': 'UserID', '3': 2, '4': 1, '5': 3, '10': 'UserID'},
  ],
};

const ChatAddMemberResp$json = const {
  '1': 'ChatAddMemberResp',
};

const ChatDeleteMemberReq$json = const {
  '1': 'ChatDeleteMemberReq',
  '2': const [
    const {'1': 'ChatID', '3': 1, '4': 1, '5': 3, '10': 'ChatID'},
    const {'1': 'UserID', '3': 2, '4': 1, '5': 3, '10': 'UserID'},
  ],
};

const ChatDeleteMemberResp$json = const {
  '1': 'ChatDeleteMemberResp',
};

const ChatUpdateProfileReq$json = const {
  '1': 'ChatUpdateProfileReq',
  '2': const [
    const {'1': 'ChatID', '3': 1, '4': 1, '5': 3, '10': 'ChatID'},
    const {'1': 'Title', '3': 2, '4': 1, '5': 9, '10': 'Title'},
    const {'1': 'AvatarFileID', '3': 3, '4': 1, '5': 3, '10': 'AvatarFileID'},
  ],
};

const ChatUpdateProfileResp$json = const {
  '1': 'ChatUpdateProfileResp',
};

const Member$json = const {
  '1': 'Member',
  '2': const [
    const {'1': 'UserID', '3': 1, '4': 1, '5': 3, '10': 'UserID'},
  ],
};

const ChatGetMembersReq$json = const {
  '1': 'ChatGetMembersReq',
  '2': const [
    const {'1': 'ChatID', '3': 1, '4': 1, '5': 3, '10': 'ChatID'},
  ],
};

const ChatGetMembersResp$json = const {
  '1': 'ChatGetMembersResp',
  '2': const [
    const {'1': 'Members', '3': 1, '4': 3, '5': 11, '6': '.kproto.Member', '10': 'Members'},
  ],
};

const Markup$json = const {
  '1': 'Markup',
  '2': const [
    const {'1': 'ColumnSize', '3': 1, '4': 1, '5': 5, '10': 'ColumnSize'},
    const {'1': 'Elements', '3': 2, '4': 3, '5': 11, '6': '.kproto.MarkupElement', '10': 'Elements'},
  ],
};

const MarkupElement$json = const {
  '1': 'MarkupElement',
  '2': const [
    const {'1': 'ElementType', '3': 1, '4': 1, '5': 5, '10': 'ElementType'},
    const {'1': 'Caption', '3': 2, '4': 1, '5': 9, '10': 'Caption'},
    const {'1': 'FileID', '3': 3, '4': 1, '5': 3, '10': 'FileID'},
    const {'1': 'Message', '3': 4, '4': 1, '5': 9, '10': 'Message'},
  ],
};

const ChatMessage$json = const {
  '1': 'ChatMessage',
  '2': const [
    const {'1': 'ChatID', '3': 1, '4': 1, '5': 3, '10': 'ChatID'},
    const {'1': 'ClientMessageID', '3': 2, '4': 1, '5': 4, '10': 'ClientMessageID'},
    const {'1': 'SenderName', '3': 3, '4': 1, '5': 9, '10': 'SenderName'},
    const {'1': 'ContentType', '3': 4, '4': 1, '5': 5, '10': 'ContentType'},
    const {'1': 'Message', '3': 5, '4': 1, '5': 9, '10': 'Message'},
    const {'1': 'FileID', '3': 6, '4': 1, '5': 3, '10': 'FileID'},
    const {'1': 'ActionTime', '3': 7, '4': 1, '5': 3, '10': 'ActionTime'},
    const {'1': 'Markup', '3': 8, '4': 1, '5': 11, '6': '.kproto.Markup', '10': 'Markup'},
    const {'1': 'ReplyState', '3': 9, '4': 1, '5': 4, '10': 'ReplyState'},
    const {'1': 'ForwardChatID', '3': 10, '4': 1, '5': 3, '10': 'ForwardChatID'},
    const {'1': 'ForwardState', '3': 11, '4': 1, '5': 4, '10': 'ForwardState'},
  ],
};

const ChatSendMessageReq$json = const {
  '1': 'ChatSendMessageReq',
  '2': const [
    const {'1': 'ChatMessage', '3': 1, '4': 1, '5': 11, '6': '.kproto.ChatMessage', '10': 'ChatMessage'},
  ],
};

const ChatSendMessageResp$json = const {
  '1': 'ChatSendMessageResp',
  '2': const [
    const {'1': 'MessageID', '3': 1, '4': 1, '5': 4, '10': 'MessageID'},
    const {'1': 'State', '3': 2, '4': 1, '5': 4, '10': 'State'},
    const {'1': 'ClientMessageID', '3': 3, '4': 1, '5': 4, '10': 'ClientMessageID'},
  ],
};

const ChatDeleteMessageReq$json = const {
  '1': 'ChatDeleteMessageReq',
  '2': const [
    const {'1': 'ChatID', '3': 1, '4': 1, '5': 3, '10': 'ChatID'},
    const {'1': 'StateDeleted', '3': 2, '4': 1, '5': 4, '10': 'StateDeleted'},
  ],
};

const ChatDeleteMessageResp$json = const {
  '1': 'ChatDeleteMessageResp',
};

const ChatPinMessageReq$json = const {
  '1': 'ChatPinMessageReq',
  '2': const [
    const {'1': 'ChatID', '3': 1, '4': 1, '5': 3, '10': 'ChatID'},
    const {'1': 'PinState', '3': 2, '4': 1, '5': 4, '10': 'PinState'},
  ],
};

const ChatPinMessageResp$json = const {
  '1': 'ChatPinMessageResp',
};

const ChatGetStateReadReq$json = const {
  '1': 'ChatGetStateReadReq',
  '2': const [
    const {'1': 'ChatID', '3': 1, '4': 1, '5': 3, '10': 'ChatID'},
  ],
};

const ChatGetStateReadResp$json = const {
  '1': 'ChatGetStateReadResp',
  '2': const [
    const {'1': 'StateRead', '3': 1, '4': 1, '5': 4, '10': 'StateRead'},
    const {'1': 'OwnStateRead', '3': 2, '4': 1, '5': 4, '10': 'OwnStateRead'},
  ],
};

const ChatSetTypingReq$json = const {
  '1': 'ChatSetTypingReq',
  '2': const [
    const {'1': 'ChatID', '3': 1, '4': 1, '5': 3, '10': 'ChatID'},
  ],
};

const ChatSetTypingResp$json = const {
  '1': 'ChatSetTypingResp',
};

const ChatSyncChatStateMessagesReq$json = const {
  '1': 'ChatSyncChatStateMessagesReq',
  '2': const [
    const {'1': 'ChatID', '3': 1, '4': 1, '5': 3, '10': 'ChatID'},
    const {'1': 'State', '3': 2, '4': 1, '5': 4, '10': 'State'},
    const {'1': 'Limit', '3': 3, '4': 1, '5': 13, '10': 'Limit'},
  ],
};

const ChatSyncChatStateMessagesResp$json = const {
  '1': 'ChatSyncChatStateMessagesResp',
  '2': const [
    const {'1': 'StateUpdates', '3': 1, '4': 3, '5': 11, '6': '.kproto.StateUpdate', '10': 'StateUpdates'},
  ],
};

const ChatGetChatStateMessagesCondition$json = const {
  '1': 'ChatGetChatStateMessagesCondition',
  '2': const [
    const {'1': 'SenderID', '3': 1, '4': 1, '5': 3, '10': 'SenderID'},
    const {'1': 'ChatID', '3': 2, '4': 1, '5': 3, '10': 'ChatID'},
    const {'1': 'State', '3': 3, '4': 1, '5': 4, '10': 'State'},
    const {'1': 'StateBefore', '3': 4, '4': 1, '5': 4, '10': 'StateBefore'},
    const {'1': 'StateAfter', '3': 5, '4': 1, '5': 4, '10': 'StateAfter'},
    const {'1': 'MessageTypes', '3': 6, '4': 3, '5': 5, '10': 'MessageTypes'},
    const {'1': 'MessageContent', '3': 7, '4': 1, '5': 9, '10': 'MessageContent'},
    const {'1': 'ActionTimeRange', '3': 8, '4': 1, '5': 11, '6': '.kproto.TimeRange', '10': 'ActionTimeRange'},
  ],
};

const ChatGetChatStateMessagesReq$json = const {
  '1': 'ChatGetChatStateMessagesReq',
  '2': const [
    const {'1': 'Paging', '3': 1, '4': 1, '5': 11, '6': '.kproto.Paging', '10': 'Paging'},
    const {'1': 'Condition', '3': 2, '4': 1, '5': 11, '6': '.kproto.ChatGetChatStateMessagesCondition', '10': 'Condition'},
  ],
};

const ChatGetChatStateMessagesResp$json = const {
  '1': 'ChatGetChatStateMessagesResp',
  '2': const [
    const {'1': 'Paging', '3': 1, '4': 1, '5': 11, '6': '.kproto.Paging', '10': 'Paging'},
    const {'1': 'StateUpdates', '3': 2, '4': 3, '5': 11, '6': '.kproto.StateUpdate', '10': 'StateUpdates'},
  ],
};

const ChatReadMessageReq$json = const {
  '1': 'ChatReadMessageReq',
  '2': const [
    const {'1': 'ChatID', '3': 1, '4': 1, '5': 3, '10': 'ChatID'},
    const {'1': 'StateRead', '3': 2, '4': 1, '5': 4, '10': 'StateRead'},
  ],
};

const ChatReadMessageResp$json = const {
  '1': 'ChatReadMessageResp',
};

const DfsFile$json = const {
  '1': 'DfsFile',
  '2': const [
    const {'1': 'FileID', '3': 1, '4': 1, '5': 3, '10': 'FileID'},
    const {'1': 'Caption', '3': 2, '4': 1, '5': 9, '10': 'Caption'},
    const {'1': 'FileSize', '3': 3, '4': 1, '5': 3, '10': 'FileSize'},
    const {'1': 'Ext', '3': 4, '4': 1, '5': 9, '10': 'Ext'},
    const {'1': 'ContentType', '3': 5, '4': 1, '5': 5, '10': 'ContentType'},
    const {'1': 'Width', '3': 6, '4': 1, '5': 5, '10': 'Width'},
    const {'1': 'Height', '3': 7, '4': 1, '5': 5, '10': 'Height'},
    const {'1': 'URL', '3': 8, '4': 1, '5': 9, '10': 'URL'},
  ],
};

const UtilityUploadReq$json = const {
  '1': 'UtilityUploadReq',
  '2': const [
    const {'1': 'ChatID', '3': 1, '4': 1, '5': 3, '10': 'ChatID'},
    const {'1': 'ContentType', '3': 2, '4': 1, '5': 5, '10': 'ContentType'},
    const {'1': 'FileName', '3': 3, '4': 1, '5': 9, '10': 'FileName'},
    const {'1': 'Caption', '3': 4, '4': 1, '5': 9, '10': 'Caption'},
    const {'1': 'Width', '3': 5, '4': 1, '5': 5, '10': 'Width'},
    const {'1': 'Height', '3': 6, '4': 1, '5': 5, '10': 'Height'},
    const {'1': 'Data', '3': 7, '4': 1, '5': 12, '10': 'Data'},
  ],
};

const UtilityUploadResp$json = const {
  '1': 'UtilityUploadResp',
  '2': const [
    const {'1': 'File', '3': 1, '4': 1, '5': 11, '6': '.kproto.DfsFile', '10': 'File'},
  ],
};

const UtilityNewMultipartUploadReq$json = const {
  '1': 'UtilityNewMultipartUploadReq',
  '2': const [
    const {'1': 'ChatID', '3': 1, '4': 1, '5': 3, '10': 'ChatID'},
    const {'1': 'ContentType', '3': 2, '4': 1, '5': 5, '10': 'ContentType'},
    const {'1': 'FileName', '3': 3, '4': 1, '5': 9, '10': 'FileName'},
    const {'1': 'Caption', '3': 4, '4': 1, '5': 9, '10': 'Caption'},
    const {'1': 'Width', '3': 5, '4': 1, '5': 5, '10': 'Width'},
    const {'1': 'Height', '3': 6, '4': 1, '5': 5, '10': 'Height'},
  ],
};

const UtilityNewMultipartUploadResp$json = const {
  '1': 'UtilityNewMultipartUploadResp',
  '2': const [
    const {'1': 'UploadID', '3': 1, '4': 1, '5': 9, '10': 'UploadID'},
  ],
};

const UtilityUploadPartReq$json = const {
  '1': 'UtilityUploadPartReq',
  '2': const [
    const {'1': 'UploadID', '3': 1, '4': 1, '5': 9, '10': 'UploadID'},
    const {'1': 'PartSequence', '3': 2, '4': 1, '5': 5, '10': 'PartSequence'},
    const {'1': 'Data', '3': 3, '4': 1, '5': 12, '10': 'Data'},
  ],
};

const UtilityUploadPartResp$json = const {
  '1': 'UtilityUploadPartResp',
};

const UtilityCompleteMultipartUploadReq$json = const {
  '1': 'UtilityCompleteMultipartUploadReq',
  '2': const [
    const {'1': 'UploadID', '3': 1, '4': 1, '5': 9, '10': 'UploadID'},
  ],
};

const UtilityCompleteMultipartUploadResp$json = const {
  '1': 'UtilityCompleteMultipartUploadResp',
  '2': const [
    const {'1': 'File', '3': 1, '4': 1, '5': 11, '6': '.kproto.DfsFile', '10': 'File'},
  ],
};

const UtilityDownloadReq$json = const {
  '1': 'UtilityDownloadReq',
  '2': const [
    const {'1': 'FileID', '3': 1, '4': 1, '5': 3, '10': 'FileID'},
    const {'1': 'Offset', '3': 2, '4': 1, '5': 3, '10': 'Offset'},
    const {'1': 'Length', '3': 3, '4': 1, '5': 3, '10': 'Length'},
  ],
};

const UtilityDownloadResp$json = const {
  '1': 'UtilityDownloadResp',
  '2': const [
    const {'1': 'Data', '3': 1, '4': 1, '5': 12, '10': 'Data'},
  ],
};

const UtilityFileStatReq$json = const {
  '1': 'UtilityFileStatReq',
  '2': const [
    const {'1': 'FileID', '3': 1, '4': 1, '5': 3, '10': 'FileID'},
  ],
};

const UtilityFileStatResp$json = const {
  '1': 'UtilityFileStatResp',
  '2': const [
    const {'1': 'File', '3': 1, '4': 1, '5': 11, '6': '.kproto.DfsFile', '10': 'File'},
  ],
};

