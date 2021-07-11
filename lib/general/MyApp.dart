import 'dart:async';

import 'package:base_flutter/general/utilities/routers/RouterImports.gr.dart';
import 'package:base_flutter/general/utilities/utils_functions/DynamicLinkService.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'blocks/lang_cubit/lang_cubit.dart';
import 'utilities/localization/SetLocalization.dart';
import 'utilities/main_data/MainDataImports.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  final DynamicLinkService dynamicLinkService = DynamicLinkService();
  final navigatorKey = new GlobalKey<NavigatorState>();
  final _appRouter = AppRouter();

  @override
  void initState() {
    WidgetsBinding.instance?.addObserver(this);
    // dynamicLinkService.retrieveDynamicLink(context);
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      new Timer(
        const Duration(milliseconds: 2000),
        () {
          print("ahmed");
          dynamicLinkService.retrieveDynamicLink(context);
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final botToastBuilder = BotToastInit();
    return MultiBlocProvider(
      providers: MainData.providers(context),
      child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: MainData.defaultThem,
          title: "Business Wallet",
          supportedLocales: [Locale('en', 'US'), Locale('ar', 'EG')],
          localizationsDelegates: [
            SetLocalization.localizationsDelegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          locale: context.watch<LangCubit>().state.locale,
          routerDelegate: _appRouter.delegate(
              navigatorObservers: () => [BotToastNavigatorObserver()],
              initialRoutes: [SplashRoute(navigatorKey: navigatorKey)]),
          routeInformationParser: _appRouter.defaultRouteParser(),
          builder: (ctx, child) {
            child = FlutterEasyLoading(child: child); //do something
            child = botToastBuilder(context, child);
            return child;
          }),
    );
  }
}
