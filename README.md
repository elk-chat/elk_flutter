# Flutter 聊天 APP

## [如何开始 Flutter](./Flutter.md)

## 应用结构浅析

![a](./sketch.jpeg)

通讯协议基于 `websocket` 和 `protobuf`;
用户界面基于 `flutter`;

可分为：

- 网络通讯层，websocket 连接/维护重连等；protocol/network
- 数据结构层：protobuf 结构，如何编码/解码； protocol/protobuf
- 业务接口层：业务逻辑的接口，供界面交互调用；protocol/api
- 界面状态层：负责应用的数据保存和分发给界面；
- 界面交互层：界面展示/用户交互；pages|widgets

### Plans

- [x] websocket
- [x] protobuf
- [ ] api
- [ ] state management flutter_bloc
- [ ] chatkit
- [ ] what else?

### 常用命令

#### proto

基于 koi.proto` 生成 dart 文件， [安装相应工具](http://ddrv.cn/a/154163) | [protobuf dart 教程](https://developers.google.com/protocol-buffers/docs/darttutorial)

```sh
sh shell/proto.sh
```

`protocol/network/sig_mapper.dart` 和 `protocol/network/decode_protobuf.dart` 也是后端生成的。

#### 同步后端生成文件

注意：保证该项目上级目录 clone 了 koi 仓库

```sh
sh shell/sync_proto.sh
```

#### l10n

国际化文件 [教程](https://flutter.dev/docs/development/accessibility-and-localization/internationalization) [中文](https://www.jianshu.com/p/82c6656462b8)

```sh
sh shell/l10n.sh
```

```sh
sh shell/l10n_to_dart.sh
```

## 问题记录

- 安卓机选择图片会耗尽内存，闪退
- 图片上传必须压缩，否则列表展示会耗尽内存闪退
