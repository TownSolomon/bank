import 'package:flutter_easyloading/flutter_easyloading.dart';

class Toaster {
  static void showToast(String msg) {
    if (msg.trim().isNotEmpty) {
      EasyLoading.showToast(msg);
    }
  }

  static void showError(String msg) {
    if (msg.trim().isNotEmpty) {
      EasyLoading.showError(
        msg,
        dismissOnTap: true,
      );
    }
  }

  static void showSuccess(String msg, {Duration? duration}) {
    if (msg.trim().isNotEmpty) {
      EasyLoading.showSuccess(
        msg,
        dismissOnTap: true,
        duration: duration ?? const Duration(milliseconds: 500),
      );
    }
  }

  static void showInfo(String msg) {
    if (msg.trim().isNotEmpty) {
      EasyLoading.showInfo(
        msg,
        dismissOnTap: true,
      );
    }
  }

  static void showProgress(String? msg) {
    EasyLoading.show(
      status: msg,
      dismissOnTap: true,
    );
  }
}
