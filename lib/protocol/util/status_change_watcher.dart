// 检测用户网络变化
// 检测用户应用前/后台切换变化（锁屏/未锁屏）

import 'package:flutter/widgets.dart';
import 'event_emitter.dart';
import 'package:connectivity/connectivity.dart';

export 'package:flutter/widgets.dart';
export 'package:connectivity/connectivity.dart';

class StatusChangeWatcher extends EventEmitter with WidgetsBindingObserver {
  final String status_change = 'APP_STATUS_CHANGE';
  AppLifecycleState _lifecycleState;
  dynamic subscription;

  StatusChangeWatcher() {
    _init();
  }

  Function _init() {
    this._listenBgOrFgChange();
    this._listenNetworkChange();
    return this.cancel;
  }

  void _listenNetworkChange() async {
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) async {
      emit(status_change, result);
    });
  }

  void _listenBgOrFgChange() {
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (_lifecycleState != state) {
      emit(status_change, state);
      _lifecycleState = state;
    }
  }

  void cancel() {
    off(status_change);
    subscription?.cancel();
    WidgetsBinding.instance.removeObserver(this);
    clear();
  }
}
