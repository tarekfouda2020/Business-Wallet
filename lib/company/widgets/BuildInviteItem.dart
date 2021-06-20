import 'package:auto_route/auto_route.dart';
import 'package:base_flutter/company/models/comp_favorite_model.dart';
import 'package:base_flutter/company/models/comp_invitation_model.dart';
import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:base_flutter/general/utilities/routers/RouterImports.gr.dart';
import 'package:base_flutter/general/widgets/CachedImage.dart';
import 'package:base_flutter/general/widgets/MyText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class BuildInviteItem extends StatelessWidget {
  final CompInvitationModel? invitationModel;

  const BuildInviteItem({this.invitationModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => AutoRouter.of(context).push(CompanyFavDetailsRoute()),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.zero,
        child: CachedImage(
          url: invitationModel!.img,
          height: 200,
          haveBorder: false,
          borderColor: MyColors.greyWhite,
          alignment: Alignment.bottomCenter,
          borderRadius: BorderRadius.circular(20),
          fit: BoxFit.fill,
          colorFilter: ColorFilter.mode(Colors.black26, BlendMode.lighten),
          child: Container(
            height: 70,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
              color: MyColors.black,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    MyText(
                      title: invitationModel!.name,
                      size: 9,
                      color: MyColors.white,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.call,
                          color: MyColors.primary,
                          size: 15,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        MyText(
                          title: invitationModel!.phone,
                          size: 10,
                          color: MyColors.white,
                        ),
                      ],
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.location_on,
                      color: Colors.red,
                      size: 14,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    MyText(
                      title: invitationModel!.address,
                      size: 9,
                      color: MyColors.white,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
