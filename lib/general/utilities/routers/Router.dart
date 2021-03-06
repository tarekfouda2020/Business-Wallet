part of 'RouterImports.dart';

@AdaptiveAutoRouter(
  routes: <AutoRoute>[
    //general routes
    AdaptiveRoute(
      page: Splash,
      initial: true,
    ),
    CustomRoute(
      page: Login,
    ),
    CustomRoute(
        page: WelcomePage,
        transitionsBuilder: TransitionsBuilders.fadeIn,
        durationInMilliseconds: 1500),
    CustomRoute(
        page: CustomerWelcome,
        transitionsBuilder: TransitionsBuilders.fadeIn,
        durationInMilliseconds: 1500),
    AdaptiveRoute(page: ForgetPassword),
    AdaptiveRoute(page: ForgetPasswordCode),
    AdaptiveRoute<LocationModel>(page: LocationAddress),
    AdaptiveRoute(page: ActiveAccount),
    AdaptiveRoute(page: CompActiveAccount),

    AdaptiveRoute(page: SuccessfullyActive),
    AdaptiveRoute(page: ResetPassword),
    AdaptiveRoute(page: SelectLang),
    AdaptiveRoute(page: Terms),
    AdaptiveRoute(page: About),
    AdaptiveRoute(page: ContactUs),
    CustomRoute(
        page: SelectUser,
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
    AdaptiveRoute(page: EditProfile),
    AdaptiveRoute(page: NumberWallet),
    AdaptiveRoute(page: Wallet),
    AdaptiveRoute(page: Details),
    AdaptiveRoute(page: Important),
    AdaptiveRoute(page: Conversation),
    AdaptiveRoute(page: Comments),
    AdaptiveRoute(page: AppInfo),
    AdaptiveRoute(page: FavoriteDetails),
    AdaptiveRoute(page: AccountReconciliation),
    AdaptiveRoute(page: WalletHelp),
    AdaptiveRoute(page: VideoPage),
    AdaptiveRoute(page: Chat),

    //company routes
    AdaptiveRoute(page: CompanyRegister),
    AdaptiveRoute(page: CompanyRegisterCommercial),
    AdaptiveRoute(page: CompanyRegisterInterests),
    AdaptiveRoute(page: CompanyPayment),

    AdaptiveRoute(page: CompanyHome),
    AdaptiveRoute(page: CompanyMainDetails),
    AdaptiveRoute(page: CompanyProfile),
    AdaptiveRoute(page: CompanyEditProfile),
    AdaptiveRoute(page: CompanyEditActivity),
    AdaptiveRoute(page: CompanyFavDetails),
    AdaptiveRoute(page: CompanyComments),
    AdaptiveRoute(page: CompanyInterests),
    AdaptiveRoute(page: CompanyWalletNumb),
    AdaptiveRoute(page: CompanyStatistics),
    AdaptiveRoute(page: CompanyPoints),
    AdaptiveRoute(page: AllBranches),

    CustomRoute(
      page: CompanySubscribe,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 500,
      reverseDurationInMilliseconds: 500,
    ),
    AdaptiveRoute(page: CompanyWallet),
    AdaptiveRoute(page: CompanyPackages),
    AdaptiveRoute(page: CompanyConversations),
    AdaptiveRoute(page: CompanyBrochure),
    AdaptiveRoute(page: CompAccountReconciliation),
    AdaptiveRoute(page: CompanyStatisticsRate),
    AdaptiveRoute(page: CompanyBarcode),
    CustomRoute(
      page: CompBrochureSubscribe,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 500,
      reverseDurationInMilliseconds: 500,
    ),
    AdaptiveRoute(page: CompProductAds),
    AdaptiveRoute(page: CompSpecificAds),
    AdaptiveRoute(page: CompBusinessAds),

    AdaptiveRoute(page: SecondStep),

    CustomRoute(
      page: CompSpecialSubscribe,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 500,
      reverseDurationInMilliseconds: 500,
    ),
    CustomRoute(
      page: CompOpinionSubscribe,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 500,
      reverseDurationInMilliseconds: 500,
    ),
    CustomRoute(
      page: CompanyBranches,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 500,
      reverseDurationInMilliseconds: 500,
    ),
    CustomRoute(
      page: EditBranch,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 500,
      reverseDurationInMilliseconds: 500,
    ),
    CustomRoute(
      page: PackagesPayment,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 500,
      reverseDurationInMilliseconds: 500,
    ),
  ],
)
class $AppRouter {}
