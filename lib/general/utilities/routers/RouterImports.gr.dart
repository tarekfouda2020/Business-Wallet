// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:base_flutter/company/screens/company_barcode/CompanyBarcodeImports.dart'
    as _i50;
import 'package:base_flutter/company/screens/company_brochure/CompanyBrochureImports.dart'
    as _i49;
import 'package:base_flutter/company/screens/company_comments/CompanyCommentsImports.dart'
    as _i40;
import 'package:base_flutter/company/screens/company_conversations/CompanyConversationsImports.dart'
    as _i48;
import 'package:base_flutter/company/screens/company_edit_activity/CompanyEditActivityImports.dart'
    as _i38;
import 'package:base_flutter/company/screens/company_edit_profile/CompanyEditProfileImports.dart'
    as _i37;
import 'package:base_flutter/company/screens/company_fav_details/CompanyFavDetailsImports.dart'
    as _i39;
import 'package:base_flutter/company/screens/company_home/CompanyHomeImports.dart'
    as _i34;
import 'package:base_flutter/company/screens/company_interests/CompanyInterestsImports.dart'
    as _i41;
import 'package:base_flutter/company/screens/company_main_details/CompanyMainDetailsImports.dart'
    as _i35;
import 'package:base_flutter/company/screens/company_packages/CompanyPackagesImports.dart'
    as _i47;
import 'package:base_flutter/company/screens/company_points/CompanyPointsImports.dart'
    as _i44;
import 'package:base_flutter/company/screens/company_profile/CompanyProfileImport.dart'
    as _i36;
import 'package:base_flutter/company/screens/company_register/CompanyRegisterImports.dart'
    as _i33;
import 'package:base_flutter/company/screens/company_statstics/CompanyStatisticsImports.dart'
    as _i43;
import 'package:base_flutter/company/screens/company_subscribe/CompanySubscribeImports.dart'
    as _i45;
import 'package:base_flutter/company/screens/company_wallet/CompanyWalletImports.dart'
    as _i46;
import 'package:base_flutter/company/screens/company_wallet_numb/CompanyWalletNumbImports.dart'
    as _i42;
import 'package:base_flutter/customer/screens/app_info/AppInfoImports.dart'
    as _i32;
import 'package:base_flutter/customer/screens/comments/CommentsImports.dart'
    as _i31;
import 'package:base_flutter/customer/screens/conversation/ConversationImports.dart'
    as _i30;
import 'package:base_flutter/customer/screens/details/DetailsImports.dart'
    as _i28;
import 'package:base_flutter/customer/screens/edit_profile/EditProfileImports.dart'
    as _i25;
import 'package:base_flutter/customer/screens/Home/HomeImports.dart' as _i20;
import 'package:base_flutter/customer/screens/Home/tabs/profile/ProfileImports.dart'
    as _i21;
import 'package:base_flutter/customer/screens/important/ImportantWidgets.dart'
    as _i29;
import 'package:base_flutter/customer/screens/invitation_details/InvitationDetailsImports.dart'
    as _i24;
import 'package:base_flutter/customer/screens/number_wallet/NumberWalletImports.dart'
    as _i26;
import 'package:base_flutter/customer/screens/profile_page/ProfilePageImports.dart'
    as _i22;
import 'package:base_flutter/customer/screens/provider_details/ProviderDetailsImports.dart'
    as _i23;
import 'package:base_flutter/customer/screens/register/RegisterImports.dart'
    as _i19;
import 'package:base_flutter/customer/screens/wallet/WalletImports.dart'
    as _i27;
import 'package:base_flutter/general/screens/about/AboutImports.dart' as _i13;
import 'package:base_flutter/general/screens/active_account/ActiveAccountImports.dart'
    as _i9;
import 'package:base_flutter/general/screens/change_password/ChangePasswordImports.dart'
    as _i17;
import 'package:base_flutter/general/screens/confirm_password/ConfirmPasswordImports.dart'
    as _i16;
import 'package:base_flutter/general/screens/contact_us/ContactUsImports.dart'
    as _i14;
import 'package:base_flutter/general/screens/customer_welcome/CustomerWelcomeImports.dart'
    as _i6;
import 'package:base_flutter/general/screens/forget_password/ForgetPasswordImports.dart'
    as _i7;
import 'package:base_flutter/general/screens/forget_password_email/ForgetPassEmailImports.dart'
    as _i8;
import 'package:base_flutter/general/screens/image_zoom/ImageZoom.dart' as _i18;
import 'package:base_flutter/general/screens/login/LoginImports.dart' as _i4;
import 'package:base_flutter/general/screens/reset_password/ResetPasswordImports.dart'
    as _i10;
import 'package:base_flutter/general/screens/select_lang/SelectLangImports.dart'
    as _i11;
import 'package:base_flutter/general/screens/select_user/SelectUserImports.dart'
    as _i15;
import 'package:base_flutter/general/screens/splash/SplashImports.dart' as _i3;
import 'package:base_flutter/general/screens/terms/TermsImports.dart' as _i12;
import 'package:base_flutter/general/screens/welcome_page/WelcomePageImports.dart'
    as _i5;
import 'package:flutter/cupertino.dart' as _i51;
import 'package:flutter/material.dart' as _i2;

class AppRouter extends _i1.RootStackRouter {
  AppRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<SplashRouteArgs>();
          return _i3.Splash(navigatorKey: args.navigatorKey);
        }),
    LoginRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i4.Login();
        },
        opaque: true,
        barrierDismissible: false),
    WelcomePageRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i5.WelcomePage();
        },
        transitionsBuilder: _i1.TransitionsBuilders.fadeIn,
        durationInMilliseconds: 1500,
        opaque: true,
        barrierDismissible: false),
    CustomerWelcomeRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i6.CustomerWelcome();
        },
        transitionsBuilder: _i1.TransitionsBuilders.fadeIn,
        durationInMilliseconds: 1500,
        opaque: true,
        barrierDismissible: false),
    ForgetPasswordRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i7.ForgetPassword();
        }),
    ForgetPasswordEmailRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i8.ForgetPasswordEmail();
        }),
    ActiveAccountRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<ActiveAccountRouteArgs>();
          return _i9.ActiveAccount(userId: args.userId);
        }),
    ResetPasswordRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<ResetPasswordRouteArgs>();
          return _i10.ResetPassword(userId: args.userId);
        }),
    SelectLangRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i11.SelectLang();
        }),
    TermsRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i12.Terms();
        }),
    AboutRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i13.About();
        }),
    ContactUsRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i14.ContactUs();
        }),
    SelectUserRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i15.SelectUser();
        },
        transitionsBuilder: _i1.TransitionsBuilders.fadeIn,
        durationInMilliseconds: 1500,
        opaque: true,
        barrierDismissible: false),
    ConfirmPasswordRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i16.ConfirmPassword();
        }),
    ChangePasswordRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i17.ChangePassword();
        }),
    ImageZoomRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<ImageZoomRouteArgs>();
          return _i18.ImageZoom(images: args.images);
        }),
    RegisterRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i19.Register();
        }),
    HomeRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<HomeRouteArgs>();
          return _i20.Home(args.index);
        }),
    ProfileRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i21.Profile();
        }),
    ProfilePageRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i22.ProfilePage();
        }),
    ProviderDetailsRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i23.ProviderDetails();
        }),
    InvitationDetailsRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i24.InvitationDetails();
        }),
    EditProfileRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i25.EditProfile();
        }),
    NumberWalletRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i26.NumberWallet();
        }),
    WalletRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i27.Wallet();
        }),
    DetailsRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i28.Details();
        }),
    ImportantRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i29.Important();
        }),
    ConversationRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i30.Conversation();
        }),
    CommentsRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i31.Comments();
        }),
    AppInfoRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i32.AppInfo();
        }),
    CompanyRegisterRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i33.CompanyRegister();
        }),
    CompanyHomeRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<CompanyHomeRouteArgs>();
          return _i34.CompanyHome(args.index);
        }),
    CompanyMainDetailsRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i35.CompanyMainDetails();
        }),
    CompanyProfileRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i36.CompanyProfile();
        }),
    CompanyEditProfileRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i37.CompanyEditProfile();
        }),
    CompanyEditActivityRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i38.CompanyEditActivity();
        }),
    CompanyFavDetailsRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i39.CompanyFavDetails();
        }),
    CompanyCommentsRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i40.CompanyComments();
        }),
    CompanyInterestsRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i41.CompanyInterests();
        }),
    CompanyWalletNumbRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i42.CompanyWalletNumb();
        }),
    CompanyStatisticsRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i43.CompanyStatistics();
        }),
    CompanyPointsRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i44.CompanyPoints();
        }),
    CompanySubscribeRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i45.CompanySubscribe();
        }),
    CompanyWalletRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i46.CompanyWallet();
        }),
    CompanyPackagesRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i47.CompanyPackages();
        }),
    CompanyConversationsRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i48.CompanyConversations();
        }),
    CompanyBrochureRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i49.CompanyBrochure();
        }),
    CompanyBarcodeRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i50.CompanyBarcode();
        })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(SplashRoute.name, path: '/'),
        _i1.RouteConfig(LoginRoute.name, path: '/Login'),
        _i1.RouteConfig(WelcomePageRoute.name, path: '/welcome-page'),
        _i1.RouteConfig(CustomerWelcomeRoute.name, path: '/customer-welcome'),
        _i1.RouteConfig(ForgetPasswordRoute.name, path: '/forget-password'),
        _i1.RouteConfig(ForgetPasswordEmailRoute.name,
            path: '/forget-password-email'),
        _i1.RouteConfig(ActiveAccountRoute.name, path: '/active-account'),
        _i1.RouteConfig(ResetPasswordRoute.name, path: '/reset-password'),
        _i1.RouteConfig(SelectLangRoute.name, path: '/select-lang'),
        _i1.RouteConfig(TermsRoute.name, path: '/Terms'),
        _i1.RouteConfig(AboutRoute.name, path: '/About'),
        _i1.RouteConfig(ContactUsRoute.name, path: '/contact-us'),
        _i1.RouteConfig(SelectUserRoute.name, path: '/select-user'),
        _i1.RouteConfig(ConfirmPasswordRoute.name, path: '/confirm-password'),
        _i1.RouteConfig(ChangePasswordRoute.name, path: '/change-password'),
        _i1.RouteConfig(ImageZoomRoute.name, path: '/image-zoom'),
        _i1.RouteConfig(RegisterRoute.name, path: '/Register'),
        _i1.RouteConfig(HomeRoute.name, path: '/Home'),
        _i1.RouteConfig(ProfileRoute.name, path: '/Profile'),
        _i1.RouteConfig(ProfilePageRoute.name, path: '/profile-page'),
        _i1.RouteConfig(ProviderDetailsRoute.name, path: '/provider-details'),
        _i1.RouteConfig(InvitationDetailsRoute.name,
            path: '/invitation-details'),
        _i1.RouteConfig(EditProfileRoute.name, path: '/edit-profile'),
        _i1.RouteConfig(NumberWalletRoute.name, path: '/number-wallet'),
        _i1.RouteConfig(WalletRoute.name, path: '/Wallet'),
        _i1.RouteConfig(DetailsRoute.name, path: '/Details'),
        _i1.RouteConfig(ImportantRoute.name, path: '/Important'),
        _i1.RouteConfig(ConversationRoute.name, path: '/Conversation'),
        _i1.RouteConfig(CommentsRoute.name, path: '/Comments'),
        _i1.RouteConfig(AppInfoRoute.name, path: '/app-info'),
        _i1.RouteConfig(CompanyRegisterRoute.name, path: '/company-register'),
        _i1.RouteConfig(CompanyHomeRoute.name, path: '/company-home'),
        _i1.RouteConfig(CompanyMainDetailsRoute.name,
            path: '/company-main-details'),
        _i1.RouteConfig(CompanyProfileRoute.name, path: '/company-profile'),
        _i1.RouteConfig(CompanyEditProfileRoute.name,
            path: '/company-edit-profile'),
        _i1.RouteConfig(CompanyEditActivityRoute.name,
            path: '/company-edit-activity'),
        _i1.RouteConfig(CompanyFavDetailsRoute.name,
            path: '/company-fav-details'),
        _i1.RouteConfig(CompanyCommentsRoute.name, path: '/company-comments'),
        _i1.RouteConfig(CompanyInterestsRoute.name, path: '/company-interests'),
        _i1.RouteConfig(CompanyWalletNumbRoute.name,
            path: '/company-wallet-numb'),
        _i1.RouteConfig(CompanyStatisticsRoute.name,
            path: '/company-statistics'),
        _i1.RouteConfig(CompanyPointsRoute.name, path: '/company-points'),
        _i1.RouteConfig(CompanySubscribeRoute.name, path: '/company-subscribe'),
        _i1.RouteConfig(CompanyWalletRoute.name, path: '/company-wallet'),
        _i1.RouteConfig(CompanyPackagesRoute.name, path: '/company-packages'),
        _i1.RouteConfig(CompanyConversationsRoute.name,
            path: '/company-conversations'),
        _i1.RouteConfig(CompanyBrochureRoute.name, path: '/company-brochure'),
        _i1.RouteConfig(CompanyBarcodeRoute.name, path: '/company-barcode')
      ];
}

class SplashRoute extends _i1.PageRouteInfo<SplashRouteArgs> {
  SplashRoute({required _i51.GlobalKey<_i51.NavigatorState> navigatorKey})
      : super(name,
            path: '/', args: SplashRouteArgs(navigatorKey: navigatorKey));

  static const String name = 'SplashRoute';
}

class SplashRouteArgs {
  const SplashRouteArgs({required this.navigatorKey});

  final _i51.GlobalKey<_i51.NavigatorState> navigatorKey;
}

class LoginRoute extends _i1.PageRouteInfo {
  const LoginRoute() : super(name, path: '/Login');

  static const String name = 'LoginRoute';
}

class WelcomePageRoute extends _i1.PageRouteInfo {
  const WelcomePageRoute() : super(name, path: '/welcome-page');

  static const String name = 'WelcomePageRoute';
}

class CustomerWelcomeRoute extends _i1.PageRouteInfo {
  const CustomerWelcomeRoute() : super(name, path: '/customer-welcome');

  static const String name = 'CustomerWelcomeRoute';
}

class ForgetPasswordRoute extends _i1.PageRouteInfo {
  const ForgetPasswordRoute() : super(name, path: '/forget-password');

  static const String name = 'ForgetPasswordRoute';
}

class ForgetPasswordEmailRoute extends _i1.PageRouteInfo {
  const ForgetPasswordEmailRoute()
      : super(name, path: '/forget-password-email');

  static const String name = 'ForgetPasswordEmailRoute';
}

class ActiveAccountRoute extends _i1.PageRouteInfo<ActiveAccountRouteArgs> {
  ActiveAccountRoute({required String userId})
      : super(name,
            path: '/active-account',
            args: ActiveAccountRouteArgs(userId: userId));

  static const String name = 'ActiveAccountRoute';
}

class ActiveAccountRouteArgs {
  const ActiveAccountRouteArgs({required this.userId});

  final String userId;
}

class ResetPasswordRoute extends _i1.PageRouteInfo<ResetPasswordRouteArgs> {
  ResetPasswordRoute({required String userId})
      : super(name,
            path: '/reset-password',
            args: ResetPasswordRouteArgs(userId: userId));

  static const String name = 'ResetPasswordRoute';
}

class ResetPasswordRouteArgs {
  const ResetPasswordRouteArgs({required this.userId});

  final String userId;
}

class SelectLangRoute extends _i1.PageRouteInfo {
  const SelectLangRoute() : super(name, path: '/select-lang');

  static const String name = 'SelectLangRoute';
}

class TermsRoute extends _i1.PageRouteInfo {
  const TermsRoute() : super(name, path: '/Terms');

  static const String name = 'TermsRoute';
}

class AboutRoute extends _i1.PageRouteInfo {
  const AboutRoute() : super(name, path: '/About');

  static const String name = 'AboutRoute';
}

class ContactUsRoute extends _i1.PageRouteInfo {
  const ContactUsRoute() : super(name, path: '/contact-us');

  static const String name = 'ContactUsRoute';
}

class SelectUserRoute extends _i1.PageRouteInfo {
  const SelectUserRoute() : super(name, path: '/select-user');

  static const String name = 'SelectUserRoute';
}

class ConfirmPasswordRoute extends _i1.PageRouteInfo {
  const ConfirmPasswordRoute() : super(name, path: '/confirm-password');

  static const String name = 'ConfirmPasswordRoute';
}

class ChangePasswordRoute extends _i1.PageRouteInfo {
  const ChangePasswordRoute() : super(name, path: '/change-password');

  static const String name = 'ChangePasswordRoute';
}

class ImageZoomRoute extends _i1.PageRouteInfo<ImageZoomRouteArgs> {
  ImageZoomRoute({required List<dynamic> images})
      : super(name,
            path: '/image-zoom', args: ImageZoomRouteArgs(images: images));

  static const String name = 'ImageZoomRoute';
}

class ImageZoomRouteArgs {
  const ImageZoomRouteArgs({required this.images});

  final List<dynamic> images;
}

class RegisterRoute extends _i1.PageRouteInfo {
  const RegisterRoute() : super(name, path: '/Register');

  static const String name = 'RegisterRoute';
}

class HomeRoute extends _i1.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({required int index})
      : super(name, path: '/Home', args: HomeRouteArgs(index: index));

  static const String name = 'HomeRoute';
}

class HomeRouteArgs {
  const HomeRouteArgs({required this.index});

  final int index;
}

class ProfileRoute extends _i1.PageRouteInfo {
  const ProfileRoute() : super(name, path: '/Profile');

  static const String name = 'ProfileRoute';
}

class ProfilePageRoute extends _i1.PageRouteInfo {
  const ProfilePageRoute() : super(name, path: '/profile-page');

  static const String name = 'ProfilePageRoute';
}

class ProviderDetailsRoute extends _i1.PageRouteInfo {
  const ProviderDetailsRoute() : super(name, path: '/provider-details');

  static const String name = 'ProviderDetailsRoute';
}

class InvitationDetailsRoute extends _i1.PageRouteInfo {
  const InvitationDetailsRoute() : super(name, path: '/invitation-details');

  static const String name = 'InvitationDetailsRoute';
}

class EditProfileRoute extends _i1.PageRouteInfo {
  const EditProfileRoute() : super(name, path: '/edit-profile');

  static const String name = 'EditProfileRoute';
}

class NumberWalletRoute extends _i1.PageRouteInfo {
  const NumberWalletRoute() : super(name, path: '/number-wallet');

  static const String name = 'NumberWalletRoute';
}

class WalletRoute extends _i1.PageRouteInfo {
  const WalletRoute() : super(name, path: '/Wallet');

  static const String name = 'WalletRoute';
}

class DetailsRoute extends _i1.PageRouteInfo {
  const DetailsRoute() : super(name, path: '/Details');

  static const String name = 'DetailsRoute';
}

class ImportantRoute extends _i1.PageRouteInfo {
  const ImportantRoute() : super(name, path: '/Important');

  static const String name = 'ImportantRoute';
}

class ConversationRoute extends _i1.PageRouteInfo {
  const ConversationRoute() : super(name, path: '/Conversation');

  static const String name = 'ConversationRoute';
}

class CommentsRoute extends _i1.PageRouteInfo {
  const CommentsRoute() : super(name, path: '/Comments');

  static const String name = 'CommentsRoute';
}

class AppInfoRoute extends _i1.PageRouteInfo {
  const AppInfoRoute() : super(name, path: '/app-info');

  static const String name = 'AppInfoRoute';
}

class CompanyRegisterRoute extends _i1.PageRouteInfo {
  const CompanyRegisterRoute() : super(name, path: '/company-register');

  static const String name = 'CompanyRegisterRoute';
}

class CompanyHomeRoute extends _i1.PageRouteInfo<CompanyHomeRouteArgs> {
  CompanyHomeRoute({required int index})
      : super(name,
            path: '/company-home', args: CompanyHomeRouteArgs(index: index));

  static const String name = 'CompanyHomeRoute';
}

class CompanyHomeRouteArgs {
  const CompanyHomeRouteArgs({required this.index});

  final int index;
}

class CompanyMainDetailsRoute extends _i1.PageRouteInfo {
  const CompanyMainDetailsRoute() : super(name, path: '/company-main-details');

  static const String name = 'CompanyMainDetailsRoute';
}

class CompanyProfileRoute extends _i1.PageRouteInfo {
  const CompanyProfileRoute() : super(name, path: '/company-profile');

  static const String name = 'CompanyProfileRoute';
}

class CompanyEditProfileRoute extends _i1.PageRouteInfo {
  const CompanyEditProfileRoute() : super(name, path: '/company-edit-profile');

  static const String name = 'CompanyEditProfileRoute';
}

class CompanyEditActivityRoute extends _i1.PageRouteInfo {
  const CompanyEditActivityRoute()
      : super(name, path: '/company-edit-activity');

  static const String name = 'CompanyEditActivityRoute';
}

class CompanyFavDetailsRoute extends _i1.PageRouteInfo {
  const CompanyFavDetailsRoute() : super(name, path: '/company-fav-details');

  static const String name = 'CompanyFavDetailsRoute';
}

class CompanyCommentsRoute extends _i1.PageRouteInfo {
  const CompanyCommentsRoute() : super(name, path: '/company-comments');

  static const String name = 'CompanyCommentsRoute';
}

class CompanyInterestsRoute extends _i1.PageRouteInfo {
  const CompanyInterestsRoute() : super(name, path: '/company-interests');

  static const String name = 'CompanyInterestsRoute';
}

class CompanyWalletNumbRoute extends _i1.PageRouteInfo {
  const CompanyWalletNumbRoute() : super(name, path: '/company-wallet-numb');

  static const String name = 'CompanyWalletNumbRoute';
}

class CompanyStatisticsRoute extends _i1.PageRouteInfo {
  const CompanyStatisticsRoute() : super(name, path: '/company-statistics');

  static const String name = 'CompanyStatisticsRoute';
}

class CompanyPointsRoute extends _i1.PageRouteInfo {
  const CompanyPointsRoute() : super(name, path: '/company-points');

  static const String name = 'CompanyPointsRoute';
}

class CompanySubscribeRoute extends _i1.PageRouteInfo {
  const CompanySubscribeRoute() : super(name, path: '/company-subscribe');

  static const String name = 'CompanySubscribeRoute';
}

class CompanyWalletRoute extends _i1.PageRouteInfo {
  const CompanyWalletRoute() : super(name, path: '/company-wallet');

  static const String name = 'CompanyWalletRoute';
}

class CompanyPackagesRoute extends _i1.PageRouteInfo {
  const CompanyPackagesRoute() : super(name, path: '/company-packages');

  static const String name = 'CompanyPackagesRoute';
}

class CompanyConversationsRoute extends _i1.PageRouteInfo {
  const CompanyConversationsRoute()
      : super(name, path: '/company-conversations');

  static const String name = 'CompanyConversationsRoute';
}

class CompanyBrochureRoute extends _i1.PageRouteInfo {
  const CompanyBrochureRoute() : super(name, path: '/company-brochure');

  static const String name = 'CompanyBrochureRoute';
}

class CompanyBarcodeRoute extends _i1.PageRouteInfo {
  const CompanyBarcodeRoute() : super(name, path: '/company-barcode');

  static const String name = 'CompanyBarcodeRoute';
}
