// protobuf 辅助函数

import 'package:fixnum/fixnum.dart';
import '../protobuf/koi.pb.dart';

export 'package:fixnum/fixnum.dart';
export '../protobuf/koi.pb.dart';

Paging getPaging(int pageIndex, int pageSize) {
  var paging = Paging();
  paging.pageIndex = Int64(pageIndex);
  paging.pageSize = Int64(pageSize);
  return paging;
}

UserGetUsersReq getUserGetUsersReq(
  int pageIndex,
  int pageSize,
  // 用户名
  String userName,
) {
  UserGetUsersReq proto = UserGetUsersReq();

  // proto.condition.userName = '';
  UserGetUsersCondition condition = UserGetUsersCondition();
  condition.userName = userName;
  
  proto.condition = condition;
  proto.paging = getPaging(pageIndex, pageSize);
  return proto;
}
