# 基于 koi.proto 生成 dart 文件 (需要安装相应工具：http://ddrv.cn/a/154163)
protoc --dart_out=./ ./lib/protocol/protobuf/koi.proto --plugin ~/.pub-cache/bin/protoc-gen-dart