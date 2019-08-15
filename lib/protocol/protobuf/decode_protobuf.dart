
import 'sig_mapper.dart';
import 'koi.pb.dart' as proto;

/** 
 * 解码 Protobuf
 * 
 * 'msgData': 解码数据
 * 
 */

Map<dynamic, dynamic> decodeProtobuf(dynamic msgData) {
  var sig = msgData['Sig'];
  Function decodeProto;
  String decodeMethod;
  Map res = Map.from(msgData);
if (sig == SigMapper['SIG_ERROR']) {
decodeMethod ='SIG_ERROR';
decodeProto = (buffer) => proto.Error.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_SUCCESS']) {
decodeMethod ='SIG_SUCCESS';
decodeProto = (buffer) => proto.Success.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_PAGING']) {
decodeMethod ='SIG_PAGING';
decodeProto = (buffer) => proto.Paging.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_TIME_RANGE']) {
decodeMethod ='SIG_TIME_RANGE';
decodeProto = (buffer) => proto.TimeRange.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_STATE_ACK']) {
decodeMethod ='SIG_STATE_ACK';
decodeProto = (buffer) => proto.StateAck.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_STATE_UPDATE']) {
decodeMethod ='SIG_STATE_UPDATE';
decodeProto = (buffer) => proto.StateUpdate.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_UPDATE_MESSAGE']) {
decodeMethod ='SIG_UPDATE_MESSAGE';
decodeProto = (buffer) => proto.UpdateMessage.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_UPDATE_MESSAGE_CHAT_ADD_MEMBER']) {
decodeMethod ='SIG_UPDATE_MESSAGE_CHAT_ADD_MEMBER';
decodeProto = (buffer) => proto.UpdateMessageChatAddMember.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_UPDATE_MESSAGE_CHAT_DELETE_MEMBER']) {
decodeMethod ='SIG_UPDATE_MESSAGE_CHAT_DELETE_MEMBER';
decodeProto = (buffer) => proto.UpdateMessageChatDeleteMember.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_UPDATE_MESSAGE_CHAT_SEND_MESSAGE']) {
decodeMethod ='SIG_UPDATE_MESSAGE_CHAT_SEND_MESSAGE';
decodeProto = (buffer) => proto.UpdateMessageChatSendMessage.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_UPDATE_MESSAGE_CHAT_DELETE_MESSAGE']) {
decodeMethod ='SIG_UPDATE_MESSAGE_CHAT_DELETE_MESSAGE';
decodeProto = (buffer) => proto.UpdateMessageChatDeleteMessage.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_UPDATE_MESSAGE_CHAT_READ_MESSAGE']) {
decodeMethod ='SIG_UPDATE_MESSAGE_CHAT_READ_MESSAGE';
decodeProto = (buffer) => proto.UpdateMessageChatReadMessage.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_UPDATE_MESSAGE_CHAT_SET_TYPING']) {
decodeMethod ='SIG_UPDATE_MESSAGE_CHAT_SET_TYPING';
decodeProto = (buffer) => proto.UpdateMessageChatSetTyping.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_AUTH_P_Q_REQ']) {
decodeMethod ='SIG_AUTH_P_Q_REQ';
decodeProto = (buffer) => proto.AuthPQReq.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_AUTH_P_Q_RESP']) {
decodeMethod ='SIG_AUTH_P_Q_RESP';
decodeProto = (buffer) => proto.AuthPQResp.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_AUTH_KEY_REQ']) {
decodeMethod ='SIG_AUTH_KEY_REQ';
decodeProto = (buffer) => proto.AuthKeyReq.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_AUTH_KEY_RESP']) {
decodeMethod ='SIG_AUTH_KEY_RESP';
decodeProto = (buffer) => proto.AuthKeyResp.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_HEARTBEAT_REQ']) {
decodeMethod ='SIG_HEARTBEAT_REQ';
decodeProto = (buffer) => proto.HeartbeatReq.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_HEARTBEAT_RESP']) {
decodeMethod ='SIG_HEARTBEAT_RESP';
decodeProto = (buffer) => proto.HeartbeatResp.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_INIT_CONNECTION_REQ']) {
decodeMethod ='SIG_INIT_CONNECTION_REQ';
decodeProto = (buffer) => proto.InitConnectionReq.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_INIT_CONNECTION_RESP']) {
decodeMethod ='SIG_INIT_CONNECTION_RESP';
decodeProto = (buffer) => proto.InitConnectionResp.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_REQUEST_VERIFICATION_CODE_REQ']) {
decodeMethod ='SIG_REQUEST_VERIFICATION_CODE_REQ';
decodeProto = (buffer) => proto.RequestVerificationCodeReq.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_REQUEST_VERIFICATION_CODE_RESP']) {
decodeMethod ='SIG_REQUEST_VERIFICATION_CODE_RESP';
decodeProto = (buffer) => proto.RequestVerificationCodeResp.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_CHECK_APP_UPDATE_REQ']) {
decodeMethod ='SIG_CHECK_APP_UPDATE_REQ';
decodeProto = (buffer) => proto.CheckAppUpdateReq.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_CHECK_APP_UPDATE_RESP']) {
decodeMethod ='SIG_CHECK_APP_UPDATE_RESP';
decodeProto = (buffer) => proto.CheckAppUpdateResp.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_USER']) {
decodeMethod ='SIG_USER';
decodeProto = (buffer) => proto.User.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_USER_REGISTER_REQ']) {
decodeMethod ='SIG_USER_REGISTER_REQ';
decodeProto = (buffer) => proto.UserRegisterReq.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_USER_REGISTER_RESP']) {
decodeMethod ='SIG_USER_REGISTER_RESP';
decodeProto = (buffer) => proto.UserRegisterResp.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_USER_LOGIN_REQ']) {
decodeMethod ='SIG_USER_LOGIN_REQ';
decodeProto = (buffer) => proto.UserLoginReq.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_USER_LOGIN_RESP']) {
decodeMethod ='SIG_USER_LOGIN_RESP';
decodeProto = (buffer) => proto.UserLoginResp.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_BOT_LOGIN_REQ']) {
decodeMethod ='SIG_BOT_LOGIN_REQ';
decodeProto = (buffer) => proto.BotLoginReq.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_BOT_LOGIN_RESP']) {
decodeMethod ='SIG_BOT_LOGIN_RESP';
decodeProto = (buffer) => proto.BotLoginResp.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_USER_LOGOUT_REQ']) {
decodeMethod ='SIG_USER_LOGOUT_REQ';
decodeProto = (buffer) => proto.UserLogoutReq.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_USER_LOGOUT_RESP']) {
decodeMethod ='SIG_USER_LOGOUT_RESP';
decodeProto = (buffer) => proto.UserLogoutResp.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_USER_UPDATE_PROFILE_REQ']) {
decodeMethod ='SIG_USER_UPDATE_PROFILE_REQ';
decodeProto = (buffer) => proto.UserUpdateProfileReq.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_USER_UPDATE_PROFILE_RESP']) {
decodeMethod ='SIG_USER_UPDATE_PROFILE_RESP';
decodeProto = (buffer) => proto.UserUpdateProfileResp.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_USER_CHANGE_PASSWORD_REQ']) {
decodeMethod ='SIG_USER_CHANGE_PASSWORD_REQ';
decodeProto = (buffer) => proto.UserChangePasswordReq.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_USER_CHANGE_PASSWORD_RESP']) {
decodeMethod ='SIG_USER_CHANGE_PASSWORD_RESP';
decodeProto = (buffer) => proto.UserChangePasswordResp.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_USER_GET_FULL_USER_REQ']) {
decodeMethod ='SIG_USER_GET_FULL_USER_REQ';
decodeProto = (buffer) => proto.UserGetFullUserReq.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_USER_GET_FULL_USER_RESP']) {
decodeMethod ='SIG_USER_GET_FULL_USER_RESP';
decodeProto = (buffer) => proto.UserGetFullUserResp.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_USER_GET_FULL_USERS_REQ']) {
decodeMethod ='SIG_USER_GET_FULL_USERS_REQ';
decodeProto = (buffer) => proto.UserGetFullUsersReq.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_USER_GET_FULL_USERS_RESP']) {
decodeMethod ='SIG_USER_GET_FULL_USERS_RESP';
decodeProto = (buffer) => proto.UserGetFullUsersResp.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_USER_GET_USERS_CONDITION']) {
decodeMethod ='SIG_USER_GET_USERS_CONDITION';
decodeProto = (buffer) => proto.UserGetUsersCondition.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_USER_GET_USERS_REQ']) {
decodeMethod ='SIG_USER_GET_USERS_REQ';
decodeProto = (buffer) => proto.UserGetUsersReq.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_USER_GET_USERS_RESP']) {
decodeMethod ='SIG_USER_GET_USERS_RESP';
decodeProto = (buffer) => proto.UserGetUsersResp.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_CHAT_USER_STATE']) {
decodeMethod ='SIG_CHAT_USER_STATE';
decodeProto = (buffer) => proto.ChatUserState.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_USER_GET_CHAT_USER_STATE_REQ']) {
decodeMethod ='SIG_USER_GET_CHAT_USER_STATE_REQ';
decodeProto = (buffer) => proto.UserGetChatUserStateReq.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_USER_GET_CHAT_USER_STATE_RESP']) {
decodeMethod ='SIG_USER_GET_CHAT_USER_STATE_RESP';
decodeProto = (buffer) => proto.UserGetChatUserStateResp.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_CHAT_USER_SETTINGS']) {
decodeMethod ='SIG_CHAT_USER_SETTINGS';
decodeProto = (buffer) => proto.ChatUserSettings.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_USER_SET_CHAT_USER_SETTINGS_REQ']) {
decodeMethod ='SIG_USER_SET_CHAT_USER_SETTINGS_REQ';
decodeProto = (buffer) => proto.UserSetChatUserSettingsReq.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_USER_SET_CHAT_USER_SETTINGS_RESP']) {
decodeMethod ='SIG_USER_SET_CHAT_USER_SETTINGS_RESP';
decodeProto = (buffer) => proto.UserSetChatUserSettingsResp.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_USER_GET_CHAT_USER_SETTINGS_REQ']) {
decodeMethod ='SIG_USER_GET_CHAT_USER_SETTINGS_REQ';
decodeProto = (buffer) => proto.UserGetChatUserSettingsReq.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_USER_GET_CHAT_USER_SETTINGS_RESP']) {
decodeMethod ='SIG_USER_GET_CHAT_USER_SETTINGS_RESP';
decodeProto = (buffer) => proto.UserGetChatUserSettingsResp.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_USER_GET_CHAT_USER_SUPERSCRIPT_REQ']) {
decodeMethod ='SIG_USER_GET_CHAT_USER_SUPERSCRIPT_REQ';
decodeProto = (buffer) => proto.UserGetChatUserSuperscriptReq.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_USER_GET_CHAT_USER_SUPERSCRIPT_RESP']) {
decodeMethod ='SIG_USER_GET_CHAT_USER_SUPERSCRIPT_RESP';
decodeProto = (buffer) => proto.UserGetChatUserSuperscriptResp.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_USER_SET_OPTION_REQ']) {
decodeMethod ='SIG_USER_SET_OPTION_REQ';
decodeProto = (buffer) => proto.UserSetOptionReq.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_USER_SET_OPTION_RESP']) {
decodeMethod ='SIG_USER_SET_OPTION_RESP';
decodeProto = (buffer) => proto.UserSetOptionResp.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_USER_GET_OPTION_REQ']) {
decodeMethod ='SIG_USER_GET_OPTION_REQ';
decodeProto = (buffer) => proto.UserGetOptionReq.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_USER_GET_OPTION_RESP']) {
decodeMethod ='SIG_USER_GET_OPTION_RESP';
decodeProto = (buffer) => proto.UserGetOptionResp.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_CONTACT_ADD_REQ']) {
decodeMethod ='SIG_CONTACT_ADD_REQ';
decodeProto = (buffer) => proto.ContactAddReq.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_CONTACT_ADD_RESP']) {
decodeMethod ='SIG_CONTACT_ADD_RESP';
decodeProto = (buffer) => proto.ContactAddResp.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_CONTACT_UPDATE_REQ']) {
decodeMethod ='SIG_CONTACT_UPDATE_REQ';
decodeProto = (buffer) => proto.ContactUpdateReq.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_CONTACT_UPDATE_RESP']) {
decodeMethod ='SIG_CONTACT_UPDATE_RESP';
decodeProto = (buffer) => proto.ContactUpdateResp.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_CONTACT_DELETE_REQ']) {
decodeMethod ='SIG_CONTACT_DELETE_REQ';
decodeProto = (buffer) => proto.ContactDeleteReq.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_CONTACT_DELETE_RESP']) {
decodeMethod ='SIG_CONTACT_DELETE_RESP';
decodeProto = (buffer) => proto.ContactDeleteResp.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_CONTACT_GET_CONTACTS_REQ']) {
decodeMethod ='SIG_CONTACT_GET_CONTACTS_REQ';
decodeProto = (buffer) => proto.ContactGetContactsReq.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_CONTACT_GET_CONTACTS_RESP']) {
decodeMethod ='SIG_CONTACT_GET_CONTACTS_RESP';
decodeProto = (buffer) => proto.ContactGetContactsResp.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_CHAT']) {
decodeMethod ='SIG_CHAT';
decodeProto = (buffer) => proto.Chat.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_CHAT_CREATE_REQ']) {
decodeMethod ='SIG_CHAT_CREATE_REQ';
decodeProto = (buffer) => proto.ChatCreateReq.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_CHAT_CREATE_RESP']) {
decodeMethod ='SIG_CHAT_CREATE_RESP';
decodeProto = (buffer) => proto.ChatCreateResp.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_CHAT_INITIATE_REQ']) {
decodeMethod ='SIG_CHAT_INITIATE_REQ';
decodeProto = (buffer) => proto.ChatInitiateReq.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_CHAT_INITIATE_RESP']) {
decodeMethod ='SIG_CHAT_INITIATE_RESP';
decodeProto = (buffer) => proto.ChatInitiateResp.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_CHAT_GET_CHATS_REQ']) {
decodeMethod ='SIG_CHAT_GET_CHATS_REQ';
decodeProto = (buffer) => proto.ChatGetChatsReq.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_CHAT_GET_CHATS_RESP']) {
decodeMethod ='SIG_CHAT_GET_CHATS_RESP';
decodeProto = (buffer) => proto.ChatGetChatsResp.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_CHAT_ADD_MEMBER_REQ']) {
decodeMethod ='SIG_CHAT_ADD_MEMBER_REQ';
decodeProto = (buffer) => proto.ChatAddMemberReq.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_CHAT_ADD_MEMBER_RESP']) {
decodeMethod ='SIG_CHAT_ADD_MEMBER_RESP';
decodeProto = (buffer) => proto.ChatAddMemberResp.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_CHAT_DELETE_MEMBER_REQ']) {
decodeMethod ='SIG_CHAT_DELETE_MEMBER_REQ';
decodeProto = (buffer) => proto.ChatDeleteMemberReq.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_CHAT_DELETE_MEMBER_RESP']) {
decodeMethod ='SIG_CHAT_DELETE_MEMBER_RESP';
decodeProto = (buffer) => proto.ChatDeleteMemberResp.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_CHAT_UPDATE_PROFILE_REQ']) {
decodeMethod ='SIG_CHAT_UPDATE_PROFILE_REQ';
decodeProto = (buffer) => proto.ChatUpdateProfileReq.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_CHAT_UPDATE_PROFILE_RESP']) {
decodeMethod ='SIG_CHAT_UPDATE_PROFILE_RESP';
decodeProto = (buffer) => proto.ChatUpdateProfileResp.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_MEMBER']) {
decodeMethod ='SIG_MEMBER';
decodeProto = (buffer) => proto.Member.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_CHAT_GET_MEMBERS_REQ']) {
decodeMethod ='SIG_CHAT_GET_MEMBERS_REQ';
decodeProto = (buffer) => proto.ChatGetMembersReq.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_CHAT_GET_MEMBERS_RESP']) {
decodeMethod ='SIG_CHAT_GET_MEMBERS_RESP';
decodeProto = (buffer) => proto.ChatGetMembersResp.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_CHAT_SEND_MESSAGE_REQ']) {
decodeMethod ='SIG_CHAT_SEND_MESSAGE_REQ';
decodeProto = (buffer) => proto.ChatSendMessageReq.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_CHAT_SEND_MESSAGE_RESP']) {
decodeMethod ='SIG_CHAT_SEND_MESSAGE_RESP';
decodeProto = (buffer) => proto.ChatSendMessageResp.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_CHAT_DELETE_MESSAGE_REQ']) {
decodeMethod ='SIG_CHAT_DELETE_MESSAGE_REQ';
decodeProto = (buffer) => proto.ChatDeleteMessageReq.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_CHAT_DELETE_MESSAGE_RESP']) {
decodeMethod ='SIG_CHAT_DELETE_MESSAGE_RESP';
decodeProto = (buffer) => proto.ChatDeleteMessageResp.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_CHAT_GET_STATE_READ_REQ']) {
decodeMethod ='SIG_CHAT_GET_STATE_READ_REQ';
decodeProto = (buffer) => proto.ChatGetStateReadReq.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_CHAT_GET_STATE_READ_RESP']) {
decodeMethod ='SIG_CHAT_GET_STATE_READ_RESP';
decodeProto = (buffer) => proto.ChatGetStateReadResp.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_CHAT_SET_TYPING_REQ']) {
decodeMethod ='SIG_CHAT_SET_TYPING_REQ';
decodeProto = (buffer) => proto.ChatSetTypingReq.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_CHAT_SET_TYPING_RESP']) {
decodeMethod ='SIG_CHAT_SET_TYPING_RESP';
decodeProto = (buffer) => proto.ChatSetTypingResp.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_CHAT_SYNC_CHAT_STATE_MESSAGES_REQ']) {
decodeMethod ='SIG_CHAT_SYNC_CHAT_STATE_MESSAGES_REQ';
decodeProto = (buffer) => proto.ChatSyncChatStateMessagesReq.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_CHAT_SYNC_CHAT_STATE_MESSAGES_RESP']) {
decodeMethod ='SIG_CHAT_SYNC_CHAT_STATE_MESSAGES_RESP';
decodeProto = (buffer) => proto.ChatSyncChatStateMessagesResp.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_CHAT_GET_CHAT_STATE_MESSAGES_CONDITION']) {
decodeMethod ='SIG_CHAT_GET_CHAT_STATE_MESSAGES_CONDITION';
decodeProto = (buffer) => proto.ChatGetChatStateMessagesCondition.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_CHAT_GET_CHAT_STATE_MESSAGES_REQ']) {
decodeMethod ='SIG_CHAT_GET_CHAT_STATE_MESSAGES_REQ';
decodeProto = (buffer) => proto.ChatGetChatStateMessagesReq.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_CHAT_GET_CHAT_STATE_MESSAGES_RESP']) {
decodeMethod ='SIG_CHAT_GET_CHAT_STATE_MESSAGES_RESP';
decodeProto = (buffer) => proto.ChatGetChatStateMessagesResp.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_CHAT_READ_MESSAGE_REQ']) {
decodeMethod ='SIG_CHAT_READ_MESSAGE_REQ';
decodeProto = (buffer) => proto.ChatReadMessageReq.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_CHAT_READ_MESSAGE_RESP']) {
decodeMethod ='SIG_CHAT_READ_MESSAGE_RESP';
decodeProto = (buffer) => proto.ChatReadMessageResp.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_DFS_FILE']) {
decodeMethod ='SIG_DFS_FILE';
decodeProto = (buffer) => proto.DfsFile.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_UTILITY_UPLOAD_REQ']) {
decodeMethod ='SIG_UTILITY_UPLOAD_REQ';
decodeProto = (buffer) => proto.UtilityUploadReq.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_UTILITY_UPLOAD_RESP']) {
decodeMethod ='SIG_UTILITY_UPLOAD_RESP';
decodeProto = (buffer) => proto.UtilityUploadResp.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_UTILITY_NEW_MULTIPART_UPLOAD_REQ']) {
decodeMethod ='SIG_UTILITY_NEW_MULTIPART_UPLOAD_REQ';
decodeProto = (buffer) => proto.UtilityNewMultipartUploadReq.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_UTILITY_NEW_MULTIPART_UPLOAD_RESP']) {
decodeMethod ='SIG_UTILITY_NEW_MULTIPART_UPLOAD_RESP';
decodeProto = (buffer) => proto.UtilityNewMultipartUploadResp.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_UTILITY_UPLOAD_PART_REQ']) {
decodeMethod ='SIG_UTILITY_UPLOAD_PART_REQ';
decodeProto = (buffer) => proto.UtilityUploadPartReq.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_UTILITY_UPLOAD_PART_RESP']) {
decodeMethod ='SIG_UTILITY_UPLOAD_PART_RESP';
decodeProto = (buffer) => proto.UtilityUploadPartResp.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_UTILITY_COMPLETE_MULTIPART_UPLOAD_REQ']) {
decodeMethod ='SIG_UTILITY_COMPLETE_MULTIPART_UPLOAD_REQ';
decodeProto = (buffer) => proto.UtilityCompleteMultipartUploadReq.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_UTILITY_COMPLETE_MULTIPART_UPLOAD_RESP']) {
decodeMethod ='SIG_UTILITY_COMPLETE_MULTIPART_UPLOAD_RESP';
decodeProto = (buffer) => proto.UtilityCompleteMultipartUploadResp.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_UTILITY_DOWNLOAD_REQ']) {
decodeMethod ='SIG_UTILITY_DOWNLOAD_REQ';
decodeProto = (buffer) => proto.UtilityDownloadReq.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_UTILITY_DOWNLOAD_RESP']) {
decodeMethod ='SIG_UTILITY_DOWNLOAD_RESP';
decodeProto = (buffer) => proto.UtilityDownloadResp.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_UTILITY_FILE_STAT_REQ']) {
decodeMethod ='SIG_UTILITY_FILE_STAT_REQ';
decodeProto = (buffer) => proto.UtilityFileStatReq.fromBuffer(buffer);
} else if (sig == SigMapper['SIG_UTILITY_FILE_STAT_RESP']) {
decodeMethod ='SIG_UTILITY_FILE_STAT_RESP';
decodeProto = (buffer) => proto.UtilityFileStatResp.fromBuffer(buffer);
}

  assert(decodeProto != null);
  res['Data'] = decodeProto(res['DataBuf']);
  res['Method'] = decodeMethod;
  return res;
}