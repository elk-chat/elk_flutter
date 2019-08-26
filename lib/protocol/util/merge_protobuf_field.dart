/// protobuf 字段合并，后面会移除，因为这种方式不好确定有哪些字段 [将废弃]
mergeProtobufField(Map data, protobuf) {
  if (data == null) return protobuf;
  data.forEach((k, v) {
    var tagNumber = protobuf.getTagNumber(k);
    if (tagNumber != null) {
      protobuf.setField(tagNumber, v);
    } else {
      print('多余字段请删除：$k');
    }
  });
  return protobuf;
}
