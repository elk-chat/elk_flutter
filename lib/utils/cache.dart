import 'package:elk_chat/widgets/img.dart';
import 'package:flutter/widgets.dart';

Map<String, Widget> CacheAvatar = {};
GetCacheAvatar(senderName) {
  if(CacheAvatar[senderName] == null) {
    CacheAvatar[senderName] = Img(
      height: 26.0,
      width: 26.0,
      // fileID: msg.avatarFileID,
      circle: true,
      title: senderName,
      type: 3,
    );
  }
  return CacheAvatar[senderName];
}
