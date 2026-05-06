import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImp implements NetworkInfo {
  final InternetConnectionChecker internetConnectionChecker;

  NetworkInfoImp({required this.internetConnectionChecker});

  @override
  Future<bool> get isConnected async {
    // internet_connection_checker uses raw TCP sockets which are not
    // available in browsers. On Flutter Web we trust the browser to surface
    // real network errors via Dio instead of pre-gating every request.
    if (kIsWeb) return true;
    return internetConnectionChecker.hasConnection;
  }
}
