import 'package:elk_chat/update/software.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';
import 'dart:io';

const updateUrl = 'http://13.114.235.181:33501/c/d';
const softwareName = 'IM_kChat_test';

class UpdateStatus {
  final int _value;

  const UpdateStatus._internal(this._value);

  int get value => _value;

  get hashCode => _value;

  operator ==(status) => status._value == this._value;

  toString() => 'UpdateStatus($_value)';

  static UpdateStatus from(int value) => UpdateStatus._internal(value);

  static const unknow = const UpdateStatus._internal(0);
  static const error = const UpdateStatus._internal(1);
  static const notfound = const UpdateStatus._internal(2);
  static const noneed = const UpdateStatus._internal(3);
  static const update = const UpdateStatus._internal(4);
}

class UpdateInfo {
  UpdateStatus updateStatus;
  String errorMessage;
  String downloadUrl;
  String fileName;
  String version;
  UpdateInfo(
      {this.updateStatus = UpdateStatus.unknow,
      this.errorMessage = "",
      this.downloadUrl = "",
      this.fileName = "",
      this.version = ""});
}

class UpdateManager {
  bool compareVersion(String currentVer, String installVer) {
    if (currentVer == "" || installVer == "") return false;
    List<String> listCurrent = currentVer.split(".");
    List<String> listInstall = installVer.split(".");

    int nMaxIndex = (((listCurrent.length) > (listInstall.length))
        ? (listCurrent.length)
        : (listInstall.length));

    for (int i = 0; i < nMaxIndex; i++) {
      String currentSub;
      String installSub;
      if (i >= listCurrent.length)
        currentSub = "0";
      else
        currentSub = listCurrent[i];

      if (i >= listInstall.length)
        installSub = "0";
      else
        installSub = listInstall[i];

      var currentInt = int.parse(currentSub);
      var installInt = int.parse(installSub);
      if (currentInt > installInt)
        return false;
      else if (currentInt < installInt) return true;
    }
    return false;
  }

  downloadUpdate(String url, String fileName, Function cbfunc) async {
    var tempPath = (await getExternalStorageDirectory()).path;
    print(tempPath + "/" + fileName);
    final savedDir = Directory(tempPath);
    // 判断下载路径是否存在
    bool hasExisted = await savedDir.exists();
    // 不存在就新建路径
    if (!hasExisted) {
      savedDir.create();
    }

    final taskId = await FlutterDownloader.enqueue(
      url: url,
      savedDir: tempPath,
      fileName: fileName,
      showNotification:
          false, // show download progress in status bar (for Android)
      openFileFromNotification:
          false, // click on notification to open downloaded file (for Android)
    );

    FlutterDownloader.registerCallback((id, status, progress) {
      // code to update your UI
      print(status);
      print(progress);

      cbfunc(id, status, progress);

      if (status == DownloadTaskStatus.complete) {
        OpenFile.open(tempPath + "/" + fileName);
      }
    });
  }

  Future<UpdateInfo> checkUpdate(String currentVersion) async {
    UpdateInfo updateInfo = new UpdateInfo();
    String url = updateUrl;
    Map<String, String> headers = {"Content-type": "application/json"};
    String json =
        '{"Method":"/sw/list","UserName":"anonymous","SessID":"none","Data":{"SoftwareName":"$softwareName"}}';
    // make POST request
    Response response = await post(url, headers: headers, body: json);
    // check the status code for the result
    int statusCode = response.statusCode;
    if (statusCode != 200) {
      // 錯誤
      updateInfo.errorMessage = "Get version info failed";
      updateInfo.updateStatus = UpdateStatus.error;

      return updateInfo;
    }

    // this API passes back the id of the new item added to the body
    String body = response.body;
    print(body);

    Map softwareMap = jsonDecode(body);
    var software = new Software.fromJson(softwareMap);

    if (software.code != 0) {
      // 錯誤
      updateInfo.errorMessage = software.message;
      updateInfo.updateStatus = UpdateStatus.error;
      return updateInfo;
    }

    if (software.data.results.length == 0) {
      print('can not find any update');
      updateInfo.updateStatus = UpdateStatus.notfound;
      return updateInfo;
    }

    String installVer = software.data.results[0].details.version;

    bool updated = compareVersion(currentVersion, installVer);
    if (!updated) {
      print('dont need to update');
      updateInfo.updateStatus = UpdateStatus.noneed;
      return updateInfo;
    }

    updateInfo.updateStatus = UpdateStatus.update;
    updateInfo.downloadUrl = software.data.results[0].details.cdnUrl;
    updateInfo.fileName = software.data.results[0].details.fileName;
    updateInfo.version = software.data.results[0].details.version;

    return updateInfo;
  }
}
