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
    AdaptiveRoute(page: ForgetPassword),
    AdaptiveRoute(page: ForgetPasswordEmail),
    AdaptiveRoute(page: ActiveAccount),
    AdaptiveRoute(page: ResetPassword),
    AdaptiveRoute(page: SelectLang),
    AdaptiveRoute(page: Terms),
    AdaptiveRoute(page: About),
    AdaptiveRoute(page: ContactUs),
    CustomRoute(page: SelectUser,transitionsBuilder: TransitionsBuilders.fadeIn,durationInMilliseconds: 1500),
    AdaptiveRoute(page: ConfirmPassword),
    AdaptiveRoute(page: ChangePassword),
    AdaptiveRoute(page: ImageZoom),

  ],
)
class $AppRouter {}