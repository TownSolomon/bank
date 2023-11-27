import 'dart:ui';

import 'package:get/get.dart';

import 'languages/en_us.dart';
import 'languages/zh_cn.dart';

class TranslationService extends Translations {
  static Locale? get locale => Get.deviceLocale;
  static const fallbackLocale = Locale('zh', 'CN');
  static const locales = <int, Locale>{
    1: Locale('en', 'US'),
    2: Locale('zh', 'CN'),
  };

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUS,
        'zh_CN': zhCN,
      };
}

class Trs {
  static get splash => 'splash'.tr;
  static get buffett => 'buffett'.tr;
  static get ok => 'ok'.tr;
  static get cancel => 'cancel'.tr;
  static get languageSetup => 'languageSetup'.tr;
  static get followSystem => 'followSystem'.tr;
  static get english => 'english'.tr;
  static get chinese => 'chinese'.tr;
  static get lightMode => 'lightMode'.tr;
  static get darkMode => 'darkMode'.tr;
  static get contactUs => 'contactUs'.tr;
  static get bank => 'bank'.tr;
  static get banks => 'banks'.tr;
  static get rate => 'rate'.tr;
  static get setting => 'setting'.tr;
  static get settingsAndInformation => 'settingsAndInformation'.tr;
  static get interestRateRanking => 'interestRateRanking'.tr;
  static get depositType => 'depositType'.tr;
  static get allDepositType => 'allDepositType'.tr;
  static get depositDuration => 'depositDuration'.tr;
  static get allDepositDuration => 'allDepositDuration'.tr;
  static get website => 'website'.tr;
  static get wechat => 'wechat'.tr;
  static get email => 'email'.tr;
  static get xhs => 'xhs'.tr;
  static get douyin => 'douyin'.tr;
  static get twitter => 'twitter'.tr;
}
