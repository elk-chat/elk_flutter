import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:catcher/catcher_plugin.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_config.dart';
import 'package:elk_chat/init_websocket.dart';
import 'screens/app.dart';
import 'const.dart';
import 'l10n.dart';
// 捕捉错误
import 'catch_error.dart';

import 'blocs/app_bloc_delegate.dart';
import 'package:elk_chat/repositorys/repositorys.dart';
import 'package:elk_chat/blocs/blocs.dart';
import 'package:logging/logging.dart';

bool isDark = false;
Logger log = Logger('main');
// 入口函数
void main() {
  // 设置状态栏主题
  // SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //   statusBarColor: isDark ? Constants.darkPrimary : Constants.lightPrimary,
  //   // statusBarColor: isDark ? Constants.darkPrimary : Colors.blue.shade100,
  //   statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
  // ));

  // 全局监听 bloc
  BlocSupervisor.delegate = AppBlocDelegate();
  // todo 日志文件写到文件或者数据库中，方便调试
  // todo 重要的异常一定前台提示：比如，连接断开/正在连接/操作异常/数据异常
  // log
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((LogRecord rec) {
    print('${rec.loggerName}-${rec.level.name}: ${rec.time}: ${rec.message}');
  });

  Future start() async {
    log.info('main start');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final authRepository = AuthRepository(prefs: prefs);
    final contactRepository = ContactRepository();
    final chatRepository = ChatRepository();

    var App = MyApp(
        authRepository: authRepository,
        chatRepository: chatRepository,
        contactRepository: contactRepository);

    try {
      // 正式环境中 assert(1 == 2) 不会执行，所以不会报错
      assert(1 == 2);
      initCatchZone(() => App);
    } catch (_) {
      runApp(App);
    }

    if (Platform.isAndroid) {
      SystemUiOverlayStyle systemUiOverlayStyle =
          SystemUiOverlayStyle(statusBarColor: Colors.white);
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
  }

  start();
}

class MyApp extends StatefulWidget {
  final AuthRepository authRepository;
  final ChatRepository chatRepository;
  final ContactRepository contactRepository;

  MyApp(
      {Key key,
      @required this.authRepository,
      @required this.chatRepository,
      @required this.contactRepository})
      : super(key: key);

  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    log.info('init websocket');
    initWS(app_config.WSUrl, app_config.WSPingInterval, app_config.WSTimeout);
    log.info('init finish websocket');
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
          builder: (context) => AuthBloc(authRepository: widget.authRepository)
            ..dispatch(AppStarted()),
        ),
        // 联系人 bloc
        BlocProvider<ContactBloc>(
          builder: (context) =>
              ContactBloc(contactRepository: widget.contactRepository),
        ),
        BlocProvider<ChatBloc>(
          builder: (context) => ChatBloc(chatRepository: widget.chatRepository),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: Constants.appName,
          // 主题
          theme: isDark ? Constants.darkTheme : Constants.lightTheme,
          navigatorKey: Catcher.navigatorKey,
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
            const Locale.fromSubtags(
                languageCode: 'zh'), // generic Chinese 'zh'
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
          home: RootScreen(
              authRepository: widget.authRepository,
              chatRepository: widget.chatRepository,
              contactRepository: widget.contactRepository)),
    );
  }
}
