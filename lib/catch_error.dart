// 捕捉 dart 虚拟机错误
import 'package:catcher/catcher_plugin.dart';
import 'package:elk_chat/auth_config.dart';

initCatchZone(Function getdApp) {
  CatcherOptions debugOptions =
      CatcherOptions(DialogReportMode(), [ConsoleHandler()]);
  CatcherOptions releaseOptions = CatcherOptions(DialogReportMode(), [
    EmailAutoHandler(AuthConfig.smtp, AuthConfig.port, AuthConfig.mail,
        "Catcher", AuthConfig.pwd, [AuthConfig.mail],
        enableSsl: true, sendHtml: false, emailTitle: AuthConfig.title)
  ]);

  Catcher(getdApp(), debugConfig: debugOptions, releaseConfig: releaseOptions);
}
