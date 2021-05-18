import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:base_flutter/general/widgets/CachedImage.dart';
import 'package:base_flutter/general/widgets/MyText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class BuildFavItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: CachedImage(
        url:
            "https://www.ibelieveinsci.com/wp-content/uploads/GettyImages-498928946-59cd1dd3af5d3a0011d3a87e.jpg",
        height: 200,
        alignment: Alignment.bottomCenter,
        borderRadius: BorderRadius.circular(20),
        fit: BoxFit.fill,
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
                    title: "اسم الاعلان",
                    size: 9,
                    color: MyColors.white,
                  ),
                  RatingBar.builder(
                    itemCount: 5,
                    allowHalfRating: true,
                    ignoreGestures: true,
                    onRatingUpdate: (double val) {},
                    unratedColor: MyColors.white,
                    itemSize: 12,
                    itemPadding: const EdgeInsets.symmetric(vertical: 7),
                    initialRating: 3,
                    itemBuilder: (_, index) {
                      return Icon(
                        Icons.star,
                        color: MyColors.primary,
                      );
                    },
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
                    title: "التاريخ : 10/20/1020",
                    size: 9,
                    color: MyColors.white,
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
