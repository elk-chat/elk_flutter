//  事件

class CHEvent {
  static String ALL_MSG(chatID) {
    return 'CH_ALL_MSG_$chatID';
  }

  static String ADD_MEMBER(chatID) {
    return 'CH_ADD_MEMBER_$chatID';
  }

  static String DELETE_MEMBER(chatID) {
    return 'CH_DEL_MEMBER_$chatID';
  }

  static String SEND_MSG(chatID, [messageID]) {
    return 'CH_SEND_MSG_${chatID}_${messageID}';
  }

  static String READ_MSG(chatID) {
    return 'CH_READ_MSG_${chatID}';
  }

  static String READ_MSG_2(chatID, messageID) {
    return 'CH_READ_MSG_${chatID}_${messageID}';
  }

  static String DELETE_MSG(chatID, messageID) {
    return 'CH_DELETE_MSG_${chatID}_${messageID}';
  }

  static String SET_TYPING(chatID) {
    return 'CH_SET_TYPING_$chatID';
  }

  // 初始化未读
  static String INIT_CHAT_UNREAD(chatID) {
    return 'CH_INIT_CHAT_UNREAD_$chatID';
  }

  // 未读数加 1
  static String INS_CHAT_UNREAD(chatID) {
    return 'CH_INS_CHAT_UNREAD_$chatID';
  }

  // 未读数减 1
  static String DEC_CHAT_UNREAD(chatID) {
    return 'CH_DEC_CHAT_UNREAD_$chatID';
  }

  // 初始化未读
  static String INIT_CHAT_UNREAD_ALL = 'CH_INIT_CHAT_UNREAD_ALL';

  // 获取所有未读
  static String GET_ALL_CHAT_UNREAD = 'CH_GET_ALL_CHAT_UNREAD';

  // 聊天列表最后一条消息
  static String ON_CHAT_LAST_MSG = 'ON_CHAT_LAST_MSG';

  // 触发排序
  static String SORT_CHATS_BY_LAST_MSG = 'SORT_CHATS_BY_LAST_MSGS';
}
