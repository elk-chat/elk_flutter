import 'dart:io';

import 'package:elk_chat/update/update.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:global_configuration/global_configuration.dart';

class VersionChecker {
  VersionChecker();
  void checkVersion(BuildContext buildContext) async {
    UpdateManager updateManager = new UpdateManager();
    // var appVersion = await GlobalConfiguration().loadFromPath('assets/config/app_config.json');

    UpdateInfo info = await updateManager.checkUpdate('1.0.0.2');
    if (info.updateStatus == UpdateStatus.update && info.downloadUrl != "") {
      showDialog(
        barrierDismissible: false,
        context: buildContext,
        builder: (context) {
          return WillPopScope(
            child: CupertinoAlertDialog(
              title: Text('有新的 APP 版本'),
              content: Container(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text('是否下载升级?')
              ),
              actions: <Widget>[
                CupertinoDialogAction(
                  onPressed: () {
                    return Navigator.of(context).pop(false);
                  },
                  child: Text('取消')
                ),
                CupertinoDialogAction(
                  onPressed: () {
                    if(Platform.isAndroid) {
                      updateManager.downloadUpdate(info.downloadUrl, info.fileName, (id, status, progress) {
                        print(status);
                        // print('123123123123 ${progress}');
                        // setState(() {
                        //   resp = progress.toString();
                        // });
                      });
                    }
                    Navigator.of(context).pop(false);
                  },
                  child: Text('确定')
                )
              ],
            ),
            onWillPop: () async {
              return true;
            }
          );
        }
      );
    } else {
      String message = "";
      if (info.updateStatus == UpdateStatus.noneed) {
        message = "已是最新版本";
      } else if (info.updateStatus == UpdateStatus.notfound) {
        message = "没找到更新信息";
      } else if (info.updateStatus == UpdateStatus.error) {
        if (info.errorMessage != "")
          message = info.errorMessage;
        else
          message = "未知错误";
      }
      showDialog(
        barrierDismissible: false,
        context: buildContext,
        builder: (context) {
          return WillPopScope(
            child: CupertinoAlertDialog(
              title: Text('更新信息'),
              content: Container(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(message)
              ),
              actions: <Widget>[
                CupertinoDialogAction(
                  onPressed: () {
                    return Navigator.of(context).pop(false);
                  },
                  child: Text('好')
                ),
              ],
            ),
            onWillPop: () async {
              return true;
            }
          );
        }
      );
      // setState(() {
      //   resp = message;
      // });
    }
  }
}
