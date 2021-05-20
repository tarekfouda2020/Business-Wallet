import 'package:auto_route/auto_route.dart';
import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:base_flutter/general/utilities/routers/RouterImports.gr.dart';
import 'package:base_flutter/general/widgets/CachedImage.dart';
import 'package:base_flutter/general/widgets/MyText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class BuildFavoritesItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> AutoRouter.of(context).push(InvitationDetailsRoute()),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        padding: EdgeInsets.zero,
        child: CachedImage(
          url:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTUoQZSsfmS3ZPKPHu-KORypJzT3ue3T00eSA&usqp=CAU",
          height: 200,
          alignment: Alignment.bottomCenter,
          // borderRadius: BorderRadius.circular(20),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          fit: BoxFit.fill,
          colorFilter:
          ColorFilter.mode(Colors.black26, BlendMode.darken),
          child: Container(
            height: 60,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              // borderRadius: BorderRadius.only(
              //   bottomRight: Radius.circular(20),
              //   bottomLeft: Radius.circular(20),
              // ),
              color: MyColors.black,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    MyText(
                      title: "اسم الكيان",
                      size: 9,
                      color: MyColors.white,
                    ),
                    RatingBar.builder(
                      initialRating: 1,
                      minRating: 0,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      updateOnDrag: false,
                      itemCount: 5,
                      itemSize: 12,
                      itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) => () {},
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    MyText(
                      title: "التصنيف : شركات",
                      size: 9,
                      color: MyColors.white,
                    ),
                    MyText(
                      title: "التاريخ :  10/20/1020",
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
}
