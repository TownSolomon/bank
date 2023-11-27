import 'package:sp_util/sp_util.dart';

class DataPersistence {
  static const _language = "language";
  static const _nightMode = "nightMode";

  static Future<bool>? putLanguage(int index) {
    return SpUtil.putInt(_language, index);
  }

  static int? getLanguage() {
    return SpUtil.getInt(_language);
  }

  static Future<bool>? putNightMode(int index) {
    return SpUtil.putInt(_nightMode, index);
  }

  static int? getNightMode() {
    return SpUtil.getInt(_nightMode);
  }
}
