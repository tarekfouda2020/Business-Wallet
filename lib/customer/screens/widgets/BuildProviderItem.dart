import 'package:auto_route/auto_route.dart';
import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:base_flutter/general/utilities/routers/RouterImports.gr.dart';
import 'package:base_flutter/general/widgets/MyText.dart';
import 'package:base_flutter/res.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class BuildProviderItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> AutoRouter.of(context).push(ProviderDetailsRoute()),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.165,
        width: MediaQuery.of(context).size.width * 0.44,
        decoration: BoxDecoration(
            color: MyColors.white,
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
                image: AssetImage(Res.on3),
                fit: BoxFit.fill,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.6), BlendMode.darken))),
        alignment: Alignment.bottomCenter,
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: MyColors.white,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage(Res.on1), fit: BoxFit.fill)),
            ),
            SizedBox(
              width: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyText(
                  title: "اسم الكيان",
                  size: 9,
                ),
                Row(
                  children: [
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
                    SizedBox(
                      width: 3,
                    ),
                    MyText(
                      title: "(12)",
                      size: 8,
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
