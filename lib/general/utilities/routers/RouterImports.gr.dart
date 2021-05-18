// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:base_flutter/company/screens/company_home/CompanyHomeImports.dart'
    as _i27;
import 'package:base_flutter/company/screens/company_register/CompanyRegisterImports.dart'
    as _i26;
import 'package:base_flutter/customer/screens/Home/HomeImports.dart' as _i20;
import 'package:base_flutter/customer/screens/Home/tabs/favorites/FavoritesImports.dart'
    as _i21;
import 'package:base_flutter/customer/screens/Home/tabs/followers/FollowersImports.dart'
    as _i23;
import 'package:base_flutter/customer/screens/Home/tabs/invitations/InvitationsImports.dart'
    as _i22;
import 'package:base_flutter/customer/screens/Home/tabs/main_page/MainPageImports.dart'
    as _i24;
import 'package:base_flutter/customer/screens/Home/tabs/profile/ProfileImports.dart'
    as _i25;
import 'package:base_flutter/customer/screens/register/RegisterImports.dart'
    as _i19;
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
import 'package:flutter/cupertino.dart' as _i28;
import 'package:flutter/material.dart' as _i2;

class AppRouter extends _i1.RootStackRouter {
  AppRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      final args = routeData.argsAs<SplashRouteArgs>();
      return _i1.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i3.Splash(navigatorKey: args.navigatorKey));
    },
    LoginRoute.name: (routeData) {
      return _i1.CustomPage<dynamic>(
          routeData: routeData,
          child: _i4.Login(),
          opaque: true,
          barrierDismissible: false);
    },
    WelcomePageRoute.name: (routeData) {
      return _i1.CustomPage<dynamic>(
          routeData: routeData,
          child: _i5.WelcomePage(),
          transitionsBuilder: _i1.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 1500,
          opaque: true,
          barrierDismissible: false);
    },
    CustomerWelcomeRoute.name: (routeData) {
      return _i1.CustomPage<dynamic>(
          routeData: routeData,
          child: _i6.CustomerWelcome(),
          transitionsBuilder: _i1.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 1500,
          opaque: true,
          barrierDismissible: false);
    },
    ForgetPasswordRoute.name: (routeData) {
      return _i1.AdaptivePage<dynamic>(
          routeData: routeData, child: _i7.ForgetPassword());
    },
    ForgetPasswordEmailRoute.name: (routeData) {
      return _i1.AdaptivePage<dynamic>(
          routeData: routeData, child: _i8.ForgetPasswordEmail());
    },
    ActiveAccountRoute.name: (routeData) {
      final args = routeData.argsAs<ActiveAccountRouteArgs>();
      return _i1.AdaptivePage<dynamic>(
          routeData: routeData, child: _i9.ActiveAccount(userId: args.userId));
    },
    ResetPasswordRoute.name: (routeData) {
      final args = routeData.argsAs<ResetPasswordRouteArgs>();
      return _i1.AdaptivePage<dynamic>(
          routeData: routeData, child: _i10.ResetPassword(userId: args.userId));
    },
    SelectLangRoute.name: (routeData) {
      return _i1.AdaptivePage<dynamic>(
          routeData: routeData, child: _i11.SelectLang());
    },
    TermsRoute.name: (routeData) {
      return _i1.AdaptivePage<dynamic>(
          routeData: routeData, child: _i12.Terms());
    },
    AboutRoute.name: (routeData) {
      return _i1.AdaptivePage<dynamic>(
          routeData: routeData, child: _i13.About());
    },
    ContactUsRoute.name: (routeData) {
      return _i1.AdaptivePage<dynamic>(
          routeData: routeData, child: _i14.ContactUs());
    },
    SelectUserRoute.name: (routeData) {
      return _i1.CustomPage<dynamic>(
          routeData: routeData,
          child: _i15.SelectUser(),
          transitionsBuilder: _i1.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 1500,
          opaque: true,
          barrierDismissible: false);
    },
    ConfirmPasswordRoute.name: (routeData) {
      return _i1.AdaptivePage<dynamic>(
          routeData: routeData, child: _i16.ConfirmPassword());
    },
    ChangePasswordRoute.name: (routeData) {
      return _i1.AdaptivePage<dynamic>(
          routeData: routeData, child: _i17.ChangePassword());
    },
    ImageZoomRoute.name: (routeData) {
      final args = routeData.argsAs<ImageZoomRouteArgs>();
      return _i1.AdaptivePage<dynamic>(
          routeData: routeData, child: _i18.ImageZoom(images: args.images));
    },
    RegisterRoute.name: (routeData) {
      return _i1.AdaptivePage<dynamic>(
          routeData: routeData, child: _i19.Register());
    },
    HomeRoute.name: (routeData) {
      final args = routeData.argsAs<HomeRouteArgs>();
      return _i1.AdaptivePage<dynamic>(
          routeData: routeData, child: _i20.Home(args.index));
    },
    FavoritesRoute.name: (routeData) {
      return _i1.AdaptivePage<dynamic>(
          routeData: routeData, child: _i21.Favorites());
    },
    InvitationsRoute.name: (routeData) {
      return _i1.AdaptivePage<dynamic>(
          routeData: routeData, child: _i22.Invitations());
    },
    FollowersRoute.name: (routeData) {
      return _i1.AdaptivePage<dynamic>(
          routeData: routeData, child: _i23.Followers());
    },
    MainPageRoute.name: (routeData) {
      return _i1.AdaptivePage<dynamic>(
          routeData: routeData, child: _i24.MainPage());
    },
    ProfileRoute.name: (routeData) {
      return _i1.AdaptivePage<dynamic>(
          routeData: routeData, child: _i25.Profile());
    },
    CompanyRegisterRoute.name: (routeData) {
      return _i1.AdaptivePage<dynamic>(
          routeData: routeData, child: _i26.CompanyRegister());
    },
    CompanyHomeRoute.name: (routeData) {
      final args = routeData.argsAs<CompanyHomeRouteArgs>();
      return _i1.AdaptivePage<dynamic>(
          routeData: routeData, child: _i27.CompanyHome(args.index));
    }
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
        _i1.RouteConfig(FavoritesRoute.name, path: '/Favorites'),
        _i1.RouteConfig(InvitationsRoute.name, path: '/Invitations'),
        _i1.RouteConfig(FollowersRoute.name, path: '/Followers'),
        _i1.RouteConfig(MainPageRoute.name, path: '/main-page'),
        _i1.RouteConfig(ProfileRoute.name, path: '/Profile'),
        _i1.RouteConfig(CompanyRegisterRoute.name, path: '/company-register'),
        _i1.RouteConfig(CompanyHomeRoute.name, path: '/company-home')
      ];
}

class SplashRoute extends _i1.PageRouteInfo<SplashRouteArgs> {
  SplashRoute({required _i28.GlobalKey<_i28.NavigatorState> navigatorKey})
      : super(name,
            path: '/', args: SplashRouteArgs(navigatorKey: navigatorKey));

  static const String name = 'SplashRoute';
}

class SplashRouteArgs {
  const SplashRouteArgs({required this.navigatorKey});

  final _i28.GlobalKey<_i28.NavigatorState> navigatorKey;
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

class FavoritesRoute extends _i1.PageRouteInfo {
  const FavoritesRoute() : super(name, path: '/Favorites');

  static const String name = 'FavoritesRoute';
}

class InvitationsRoute extends _i1.PageRouteInfo {
  const InvitationsRoute() : super(name, path: '/Invitations');

  static const String name = 'InvitationsRoute';
}

class FollowersRoute extends _i1.PageRouteInfo {
  const FollowersRoute() : super(name, path: '/Followers');

  static const String name = 'FollowersRoute';
}

class MainPageRoute extends _i1.PageRouteInfo {
  const MainPageRoute() : super(name, path: '/main-page');

  static const String name = 'MainPageRoute';
}

class ProfileRoute extends _i1.PageRouteInfo {
  const ProfileRoute() : super(name, path: '/Profile');

  static const String name = 'ProfileRoute';
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
