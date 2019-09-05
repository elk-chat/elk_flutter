import 'dart:io';

import 'package:elk_chat/styles.dart';
import 'package:elk_chat/theme_cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:catcher/catcher_plugin.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_config.dart';
import 'package:elk_chat/init_websocket.dart';
import 'pages/app.dart';
import 'const.dart';
import 'l10n.dart';
// 捕捉错误
import 'catch_error.dart';

import 'blocs/app_bloc_delegate.dart';
import 'package:elk_chat/blocs/blocs.dart';
import 'package:logging/logging.dart';

bool isDark = false;
Logger log = Logger('main');
// 入口函数
void main() {
  // 全局监听 bloc
  BlocSupervisor.delegate = AppBlocDelegate();
  // TODO(redbrogdon): 日志文件写到文件或者数据库中，方便调试
  // TODO(redbrogdon): 重要的异常一定前台提示：比如，连接断开/正在连接/操作异常/数据异常
  // log
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((LogRecord rec) {
    print('${rec.loggerName}-${rec.level.name}: ${rec.time}: ${rec.message}');
  });

  Future start() async {
    log.info('main start');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final authApi = AuthApi(prefs: prefs);
    final contactApi = ContactApi();
    final chatApi = ChatApi();

    var App = ElkChat(authApi: authApi, chatApi: chatApi, contactApi: contactApi);

    try {
      // 正式环境中 assert(1 == 2) 不会执行，所以不会报错
      assert(1 == 2);
      initCatchZone(() => App);
    } catch (_) {
      runApp(App);
    }

    if (Platform.isAndroid) {
      SystemUiOverlayStyle systemUiOverlayStyle =
          SystemUiOverlayStyle(statusBarColor: Colors.transparent);
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
  }

  start();
}

class ElkChat extends StatefulWidget {
  final AuthApi authApi;
  final ChatApi chatApi;
  final ContactApi contactApi;

  ElkChat(
      {Key key,
      @required this.authApi,
      @required this.chatApi,
      @required this.contactApi})
      : super(key: key);

  _ElkChatState createState() => _ElkChatState();
}

class _ElkChatState extends State<ElkChat> {
  @override
  void initState() {
    super.initState();
    log.info('init websocket');
    initWS(
      app_config.WSUrl,
      app_config.WSPingInterval,
      app_config.WSTimeout,

      // repo 改为 api 或许比较好理解
      widget.authApi,
      widget.chatApi,
      widget.contactApi,
    );

    // TODO(redbrogdon): 有些安卓机拍照后，应用内存不足会重启，下面这个方法可以获取重启前拍的照片
    retrieveLostData();
  }

  @override
  void dispose() {
    $WS.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // 验证 bloc
        BlocProvider<AuthBloc>(
          builder: (context) => AuthBloc()..dispatch(AppStarted()),
        ),
        // 聊天列表
        BlocProvider<ChatBloc>(
          builder: (context) => ChatBloc(),
        ),
        // 联系人列表 bloc
        BlocProvider<ContactBloc>(
          builder: (context) => ContactBloc(),
        ),
      ],
      child: CupertinoApp(
        debugShowCheckedModeBanner: false,
        title: Constants.appName,
        color: Styles.appBackground,
        navigatorKey: Catcher.navigatorKey,
        theme: CupertinoThemeData(
          // backgroundColor: lightBG,
          primaryColor: Colors.black54,
          scaffoldBackgroundColor: Themes.pageBGColor,
        ),
        // 国际化
        onGenerateTitle: (BuildContext context) => L10n.of(context).appTitle,
        localizationsDelegates: [
          const L10nLocalizationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en', 'US'), // English
          const Locale.fromSubtags(languageCode: 'zh'), // generic Chinese 'zh'
          // const Locale.fromSubtags(
          //     languageCode: 'zh',
          //     scriptCode: 'Hans'), // generic simplified Chinese 'zh_Hans'
          // const Locale.fromSubtags(
          //     languageCode: 'zh',
          //     scriptCode: 'Hant'), // generic traditional Chinese 'zh_Hant'
          // const Locale.fromSubtags(
          //     languageCode: 'zh',
          //     scriptCode: 'Hans',
          //     countryCode: 'CN'), // 'zh_Hans_CN'
          // const Locale.fromSubtags(
          //     languageCode: 'zh',
          //     scriptCode: 'Hant',
          //     countryCode: 'TW'), // 'zh_Hant_TW'
          // const Locale.fromSubtags(
          //     languageCode: 'zh',
          //     scriptCode: 'Hant',
          //     countryCode: 'HK'), // 'zh_Hant_HK'
        ],
        home: App(),
      ),
    );
  }

  // 安卓里面，选择图片。拍摄图片可能会导致APP重启，通过这个方法获取重启前拍的照片
  Future<void> retrieveLostData() async {
    if (Platform.isAndroid) {
      final LostDataResponse response = await ImagePicker.retrieveLostData();
      if (response.isEmpty) {
        return;
      }

      if (response.file != null) {
        print(
            'retrieveLostData type ${response.type}; code ${response.exception.code}; exception ${response.exception};');
      }
    }
  }
}
