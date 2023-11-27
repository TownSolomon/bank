import 'package:bank/src/routes/app_pages.dart';
import 'package:bank/src/translations/translation_service.dart';
import 'package:bank/src/utils/logger.dart';
import 'package:bank/src/utils/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'commons/config.dart';
import 'controllers/app_controller.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppView(
      builder: (locale, builder) => GetMaterialApp(
        key: UniqueKey(),
        debugShowCheckedModeBanner: false,
        enableLog: true,
        builder: builder,
        logWriterCallback: Logger.print,
        translations: TranslationService(),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          DefaultCupertinoLocalizations.delegate,
        ],
        fallbackLocale: TranslationService.fallbackLocale,
        locale: locale,
        localeResolutionCallback: (locale, list) {
          Get.locale ??= locale;
          return null;
        },
        supportedLocales: TranslationService.locales.values,
        theme: AppTheme.appLightThemeData,
        darkTheme: AppTheme.appDarkThemeData,
        themeMode: ThemeUtils.getThemeMode(),
        getPages: AppPages.routes,
        initialBinding: InitBinding(),
        initialRoute: AppRoutes.splash,
      ),
    );
  }
}

class InitBinding extends Bindings {
  @override
  void dependencies() {}
}

class AppView extends StatelessWidget {
  final Widget Function(
    Locale? locale,
    Widget Function(BuildContext context, Widget? child) builder,
  ) builder;

  const AppView({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      init: AppController(),
      builder: (controller) => ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) => builder(
          controller.getLocale(),
          EasyLoading.init(
            builder: (context, widget) {
              return widget!;
            },
          ),
        ),
      ),
    );
  }
}
