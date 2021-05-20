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
    AdaptiveRoute(page: ProfilePage),
    AdaptiveRoute(page: ProviderDetails),
    AdaptiveRoute(page: InvitationDetails),


    //company routes
    AdaptiveRoute(page: CompanyRegister),
    AdaptiveRoute(page: CompanyHome),
    AdaptiveRoute(page: CompanyMainDetails),
    AdaptiveRoute(page: CompanyProfile),
    AdaptiveRoute(page: CompanyEditProfile),


  ],
)
class $AppRouter {}