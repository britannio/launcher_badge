// You have generated a new plugin project without
// specifying the `--platforms` flag. A plugin project supports no platforms is generated.
// To add platforms, run `flutter create -t plugin --platforms <platforms> .` under the same
// directory. You can also find a detailed instruction on how to add platforms in the `pubspec.yaml` at https://flutter.dev/docs/development/packages-and-plugins/developing-packages#plugin-platforms.

import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class LauncherBadge {
  LauncherBadge._();

  static const MethodChannel _channel = MethodChannel(
    'dev.britannio.launcher_badge',
  );

  static final LauncherBadge instance = LauncherBadge._();

  Future<void> setBadgeCount(int value) =>
      _channel.invokeMethod('setBadgeCount', value);

  Future<int> getBadgeCount() => _channel.invokeMethod<int>('getBadgeCount');

  Future<void> resetBadge() => _channel.invokeMethod('resetBadge');

  Future<bool> isSupported() async =>
      !kIsWeb &&
      (Platform.isIOS) &&
      await _channel.invokeMethod<bool>('isSupported');
}
