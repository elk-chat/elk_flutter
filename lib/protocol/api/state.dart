/// 聊天分类
class ChatType {
  static int Group = 1;
  static int OneToOne = 2;
  static int Contact = 3;
  static int Follower = 4;
}

/// 消息内容类型
class ChatContentType {
  static int Other = 0;
  static int Text = 1;
  static int Image = 2;
  static int Audio = 3;
  static int Video = 4;
  static int Geo = 5;
}

/// 消息操作类型
class ChatMessageType {
  static int SendMessage = 1;
  static int AddMember = 2;
  static int ReadState = 3;
}
