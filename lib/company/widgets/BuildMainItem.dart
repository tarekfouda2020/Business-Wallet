import 'package:auto_route/auto_route.dart';
import 'package:base_flutter/customer/models/follower_model.dart';
import 'package:base_flutter/customer/models/main_model.dart';
import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:base_flutter/general/utilities/routers/RouterImports.gr.dart';
import 'package:base_flutter/general/widgets/CachedImage.dart';
import 'package:base_flutter/general/widgets/MyText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class BuildMainItem extends StatelessWidget {
  final MainModel? mainModel;
  final FollowerModel? followerModel;
  final bool checkFollow;

  const BuildMainItem(
      {this.mainModel, this.followerModel, this.checkFollow = true});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => navigate(context, checkFollow),
      child: CachedImage(
        url: checkFollow ? followerModel!.background : mainModel!.backgroundImg,
        borderColor: MyColors.greyWhite,
        alignment: Alignment.bottomCenter,
        borderRadius: BorderRadius.circular(10),
        fit: BoxFit.fill,
        colorFilter: ColorFilter.mode(Colors.black26, BlendMode.darken),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              CachedImage(
                url: checkFollow ? followerModel!.img : mainModel!.Img,
                haveRadius: false,
                width: 50,
                height: 50,
                borderColor: MyColors.white,
                boxShape: BoxShape.circle,
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    MyText(
                      title: checkFollow
                          ? followerModel!.name
                          : mainModel!.kayanName,
                      size: 9,
                      color: MyColors.white,
                    ),
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
                          initialRating: checkFollow
                              ? followerModel!.rate
                              : mainModel!.rate.toDouble(),
                          itemBuilder: (_, index) {
                            return Icon(
                              Icons.star,
                              color: MyColors.primary,
                            );
                          },
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        MyText(
                          title: checkFollow
                              ? "( ${followerModel!.count.toString()} )"
                              : "( ${mainModel!.count.toString()} )",
                          size: 9,
                          color: MyColors.white,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void navigate(BuildContext context, bool checkFollow) {
    if (checkFollow == true) {
      AutoRouter.of(context)
          .push(CompanyMainDetailsRoute(kayanId: followerModel!.id));
    } else {
      AutoRouter.of(context)
          .push(CompanyMainDetailsRoute(kayanId: mainModel!.kayanId));
    }
  }
}
