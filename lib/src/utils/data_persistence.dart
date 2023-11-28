import 'package:sp_util/sp_util.dart';

class DataPersistence {
  static const _language = "language";
  static const _nightMode = "nightMode";
  static const _timezone = "timezone";
  static const _clientid = "clientid";

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

  static Future<bool>? putTimezone(String timezone) {
    return SpUtil.putString(_timezone, timezone);
  }

  static String? getTimezone() {
    return SpUtil.getString(_timezone);
  }

  static Future<bool>? putClientId(String clientid) {
    return SpUtil.putString(_clientid, clientid);
  }

  static String? getClientId() {
    return SpUtil.getString(_clientid);
  }
}
