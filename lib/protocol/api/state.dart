/// 聊天分类
class ChatType {
  static const int Group = 1;
  static const int OneToOne = 2;
  static const int Contact = 3;
  static const int Follower = 4;
}

/// 消息内容类型
class ChatContentType {
  static const int Other = 0;
  static const int Text = 1;
  static const int Image = 2;
  static const int Audio = 3;
  static const int Video = 4;
  static const int Geo = 5;
}

/// 消息操作类型
class ChatMessageType {
  static const int SendMessage = 1;
  static const int AddMember = 2;
  static const int ReadState = 3;
}
