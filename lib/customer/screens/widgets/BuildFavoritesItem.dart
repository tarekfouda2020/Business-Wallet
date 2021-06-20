import 'package:auto_route/auto_route.dart';
import 'package:base_flutter/customer/models/favorite_model.dart';
import 'package:base_flutter/customer/models/invitation_model.dart';
import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:base_flutter/general/utilities/routers/RouterImports.gr.dart';
import 'package:base_flutter/general/widgets/CachedImage.dart';
import 'package:base_flutter/general/widgets/MyText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class BuildFavoritesItem extends StatelessWidget {
  final FavoriteModel? favoriteModel;
  final InvitationModel? invitationModel;
  final bool checkInvite;

  BuildFavoritesItem(
      {this.favoriteModel, this.invitationModel, this.checkInvite = true});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => navigate(context, checkInvite),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        padding: EdgeInsets.zero,
        child: CachedImage(
          url: checkInvite
              ? invitationModel!.img
              : favoriteModel!.imgAnnouncement,
          height: 200,
          haveBorder: false,
          alignment: Alignment.bottomCenter,
          borderColor: MyColors.greyWhite,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          fit: BoxFit.fill,
          colorFilter: ColorFilter.mode(Colors.black26, BlendMode.darken),
          child: Container(
            height: 85,
            margin: EdgeInsets.zero,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: MyColors.black,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(
                        title: checkInvite
                            ? invitationModel!.name
                            : favoriteModel!.favoriteDetailsModel.nameKayan,
                        size: 9,
                        color: MyColors.white,
                      ),
                      MyText(
                        title:
                            "التصنيف : ${checkInvite ? invitationModel!.category : favoriteModel!.favoriteDetailsModel.mainField}",
                        size: 9,
                        color: MyColors.white,
                        // overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        RatingBar.builder(
                          itemCount: 5,
                          allowHalfRating: true,
                          ignoreGestures: true,
                          onRatingUpdate: (double val) {},
                          unratedColor: MyColors.white,
                          itemSize: 12,
                          itemPadding: const EdgeInsets.symmetric(vertical: 7),
                          initialRating: checkInvite
                              ? invitationModel!.rate.toDouble()
                              : favoriteModel!.rateSp.toDouble(),
                          itemBuilder: (_, index) {
                            return Icon(
                              Icons.star,
                              color: MyColors.primary,
                            );
                          },
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        MyText(
                          title:
                              " ( ${checkInvite ? invitationModel!.rate : favoriteModel!.count.toString()})",
                          size: 10,
                          color: MyColors.white,
                        ),
                      ],
                    ),
                    MyText(
                      title:
                          "التاريخ :  ${checkInvite ? invitationModel!.date : favoriteModel!.date}",
                      size: 9,
                      color: MyColors.white,
                    ),
                    MyText(
                      title:
                          "الربح :  ${checkInvite ? invitationModel!.numPoint : favoriteModel!.numPoint}",
                      size: 9,
                      color: MyColors.white,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void navigate(BuildContext context, bool checkInvite) {
    if (checkInvite == true) {
      if (invitationModel!.type == 1) {
        AutoRouter.of(context)
            .push(InvitationDetailsRoute(adsId: invitationModel!.id));
      } else {
        AutoRouter.of(context)
            .push(FavoriteDetailsRoute(adsId: invitationModel!.id));
      }
    } else {
      if (favoriteModel!.typeAds == 1) {
        AutoRouter.of(context).push(InvitationDetailsRoute(
            adsId: favoriteModel!.adsId, checkInvite: false));
      } else {
        AutoRouter.of(context).push(FavoriteDetailsRoute(
            adsId: favoriteModel!.adsId, checkInvite: false));
      }
    }
  }
}
