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

  Future<void> resetBadge() => setBadgeCount(0);

  Future<bool> isSupported() async =>
      !kIsWeb &&
      (Platform.isIOS) &&
      await _channel.invokeMethod<bool>('isSupported');
}
