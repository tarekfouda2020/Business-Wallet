part of 'RouterImports.dart';


@AdaptiveAutoRouter(
  routes: <AutoRoute>[
    //general routes
    AdaptiveRoute(page: Splash, initial: true,),
    CustomRoute(page: Login,),
    CustomRoute(
        page: WelcomePage,
        transitionsBuilder: TransitionsBuilders.fadeIn,
        durationInMilliseconds: 1500),
    CustomRoute(
        page: CustomerWelcome,
        transitionsBuilder: TransitionsBuilders.fadeIn,
        durationInMilliseconds: 1500),
    AdaptiveRoute(page: ForgetPassword),
    AdaptiveRoute(page: ForgetPasswordEmail),
    AdaptiveRoute(page: ActiveAccount),
    AdaptiveRoute(page: ResetPassword),
    AdaptiveRoute(page: SelectLang),
    AdaptiveRoute(page: Terms),
    AdaptiveRoute(page: About),
    AdaptiveRoute(page: ContactUs),
    CustomRoute(page: SelectUser,
        transitionsBuilder: TransitionsBuilders.fadeIn,
        durationInMilliseconds: 1500),
    AdaptiveRoute(page: ConfirmPassword),
    AdaptiveRoute(page: ChangePassword),
    AdaptiveRoute(page: ImageZoom),

    // customer routes
    AdaptiveRoute(page: Register),
    AdaptiveRoute(page: Home),
    AdaptiveRoute(page: Profile),
    CustomRoute(page: Search,
        transitionsBuilder: TransitionsBuilders.fadeIn,
        durationInMilliseconds: 50),
    AdaptiveRoute(page: ProfilePage),


    //company routes
    AdaptiveRoute(page: CompanyRegister),
    AdaptiveRoute(page: CompanyHome)

  ],
)
class $AppRouter {}