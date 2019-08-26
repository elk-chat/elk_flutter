/*
ChatType
const (
  CHAT_GROUP = 1 
  CHAT_ONE_ON_ONE = 2
  CHAT_CONTACT    = 3 // 所有联系人
  CHAT_FOLLOWER   = 4 // 所有关注者
  CHAT_TEAM       = 5 // 所有团队
)
*/
/// 聊天分类
class ChatType {
  // 用户可创建
  static const int Group = 1;
  // 以下均为系统创建
  static const int OneToOne = 2;
  static const int Contact = 3;
  static const int Follower = 4;
  static const int Team = 5;
}

/*
ContentType
const (
  CONTENT_OTHER = 0
  CONTENT_TEXT  = 1
  CONTENT_IMAGE = 2
  CONTENT_AUDIO = 3
  CONTENT_VIDEO = 4
  CONTENT_GEO   = 5
  CONTENT_FILE  = 6
)
*/

/// 消息内容类型
class ChatContentType {
  static const int Other = 0;
  static const int Text = 1;
  static const int Image = 2;
  static const int Audio = 3;
  static const int Video = 4;
  static const int Geo = 5;
  static const int File = 5;
}

/*
MessageType

const (
  MESSAGE_CHAT_SEND_MESSAGE   = 1
  MESSAGE_CHAT_ADD_MEMBER     = 2
  MESSAGE_CHAT_READ_MESSAGE   = 3
  MESSAGE_CHAT_DELETE_MEMBER  = 4
  MESSAGE_CHAT_SET_TYPING     = 5
  MESSAGE_CHAT_DELETE_MESSAGE = 6
  MESSAGE_CHAT_PIN_MESSAGE    = 7
)
*/

/// 消息操作类型
class ChatMessageType {
  static const int SendMessage = 1;
  static const int AddMember = 2;
  static const int ReadState = 3;
  static const int DeleteMember = 4;
}
