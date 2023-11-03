import 'dart:async';

import 'package:bank/src/app.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      FlutterError.onError = (FlutterErrorDetails details) async {
        if (kDebugMode || kProfileMode) {
          FlutterError.dumpErrorToConsole(details);
        } else {
          Zone.current.handleUncaughtError(details.exception, details.stack!);
        }
      };
      runApp(const App());
    },
    (Object error, StackTrace stackTrace) {
      if (kDebugMode) {
        print("Error FROM OUT_SIDE FRAMEWORK ");
        print("--------------------------------");
        print("Error :  $error");
        print("StackTrace :  $stackTrace");
      }
      // _reportError(error, stackTrace);
    },
  );
}
