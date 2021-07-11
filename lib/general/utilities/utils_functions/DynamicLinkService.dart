import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:base_flutter/general/models/user_model.dart';
import 'package:base_flutter/general/utilities/routers/RouterImports.gr.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DynamicLinkService {
  Future<Uri> createDynamicLink(String id) async {
    final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: 'https://bwallet.page.link',
      link: Uri.parse('https://bwallet.page.link/kayan?id=$id'),
      androidParameters: AndroidParameters(
        packageName: 'com.sa.aait.shopping.shopping',
        minimumVersion: 1,
      ),
      dynamicLinkParametersOptions: DynamicLinkParametersOptions(
        shortDynamicLinkPathLength: ShortDynamicLinkPathLength.short,
      ),
      iosParameters: IosParameters(
        bundleId: 'com.sa.aait.shopping.shopping',
        minimumVersion: '1',
        appStoreId: '1524605659',
      ),
      // socialMetaTagParameters: SocialMetaTagParameters(
      //     title: "${title.toUpperCase()}", description: desc)
    );
    final ShortDynamicLink shortLink = await parameters.buildShortLink();
    Uri url = shortLink.shortUrl;

    return url;
  }

  Future<void> retrieveDynamicLink(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var strUser = prefs.getString("user");
    if (strUser != null) {
      final UserModel user = UserModel.fromJson(json.decode(strUser));

      try {
        FirebaseDynamicLinks.instance.onLink(
            onSuccess: (PendingDynamicLinkData? dynamicLink) async {
          final Uri? deepLink = dynamicLink?.link;
          print("ahmed move $deepLink");
          if (deepLink != null) {
            print("deep id ${deepLink.queryParameters.containsKey('id')}");
            if (deepLink.queryParameters.containsKey('id')) {
              String? id = deepLink.queryParameters['id'];
              print("ahmed move");
              if (user.typeUser == 2) {
                AutoRouter.of(context).push(ProviderDetailsRoute(kayanId: id!));
              } else {
                AutoRouter.of(context)
                    .push(CompanyMainDetailsRoute(kayanId: id!));
              }
            }
          }
        });
        final PendingDynamicLinkData? data =
            await FirebaseDynamicLinks.instance.getInitialLink();
        final Uri? deepLink = data?.link;

        if (deepLink != null) {
          if (deepLink.queryParameters.containsKey('id') &
              deepLink.queryParameters.containsKey('kayan')) {
            String? id = deepLink.queryParameters['id'];
            if (user.typeUser == 2) {
              AutoRouter.of(context).push(ProviderDetailsRoute(kayanId: id!));
            } else {
              AutoRouter.of(context)
                  .push(CompanyMainDetailsRoute(kayanId: id!));
            }
          }
        }
      } catch (e) {
        print(e.toString());
      }
    }
  }
}
