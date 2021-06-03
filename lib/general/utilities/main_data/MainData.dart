part of 'MainDataImports.dart';

class MainData {
  static String chatUrl = "https://harajawamer.ip4s.com/chatHub";

  static ThemeData defaultThem = ThemeData(
    primarySwatch: Colors.grey,
    focusColor: MyColors.primary,
    accentColor: MyColors.primary,
    primaryColor: MyColors.primary,
    fontFamily: GoogleFonts.cairo().fontFamily,
    textTheme: TextTheme(
      subtitle1: GoogleFonts.cairo(
        fontSize: 14,
      ),
    ),
    brightness: Brightness.dark,
    pageTransitionsTheme: PageTransitionsTheme(builders: {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    }),
  );

  static List<BlocProvider> providers(BuildContext context) => [
        BlocProvider<AuthCubit>(
          create: (BuildContext context) => AuthCubit(),
        ),
        BlocProvider<UserCubit>(
          create: (BuildContext context) => UserCubit(),
        ),
        BlocProvider<LocationCubit>(
          create: (BuildContext context) => LocationCubit(),
        ),
      ];
}
