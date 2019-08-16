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

  static String READ_MSG(chatID, messageID) {
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

  // 未读数加 1
  static String INS_CHAT_UNREAD_ALL = 'CH_INS_CHAT_UNREAD_ALL';

  // 未读数减 1
  static String DEC_CHAT_UNREAD_ALL = 'CH_DEC_CHAT_UNREAD_ALL';

  // 聊天列表最后一条消息
  static String ON_CHAT_LAST_MSG = 'ON_CHAT_LAST_MSG';

  // 触发排序
  static String SORT_CHATS_BY_LAST_MSG = 'SORT_CHATS_BY_LAST_MSGS';

  // 添加联系人
  static String ADD_CONTACT() {
    return 'CH_ADD_CONTACT';
  }

  // 删除联系人
  static String DELETE_CONTACT() {
    return 'CH_DELETE_CONTACT';
  }

  // 更新联系人
  static String UPDATE_CONTACT() {
    return 'CH_UPDATE_CONTACT';
  }

  // 添加聊天
  static String ADD_CHAT() {
    return 'CH_ADD_CHAT';
  }

  // 删除聊天
  static String DELETE_CHAT() {
    return 'CH_DELETE_CHAT';
  }

  // 更新聊天
  static String UPDATE_CHAT() {
    return 'CH_UPDATE_CONTACT';
  }
}
