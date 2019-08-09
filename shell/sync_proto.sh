# 同步最新 koi 项目
cd ../koi
git pull

# 回到原目录
cd -

# 复制dart文件
cp ../koi/proto/kproto/*.dart lib/protocol/protobuf/
# 删除没用到的 sig.const.dart
rm lib/protocol/protobuf/sig.const.dart
# 复制 proto 文件
cp ../koi/proto/kproto/koi.proto lib/protocol/protobuf/
# 执行自动生成命令
sh shell/proto.sh
