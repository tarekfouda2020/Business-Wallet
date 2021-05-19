import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:base_flutter/general/widgets/CachedImage.dart';
import 'package:base_flutter/general/widgets/MyText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class BuildMainItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CachedImage(
        url:
            "https://www.ibelieveinsci.com/wp-content/uploads/GettyImages-498928946-59cd1dd3af5d3a0011d3a87e.jpg",
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
                url:
                    "https://www.ibelieveinsci.com/wp-content/uploads/GettyImages-498928946-59cd1dd3af5d3a0011d3a87e.jpg",
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
                      title: "اسم الاعلان",
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
                          initialRating: 3,
                          itemBuilder: (_, index) {
                            return Icon(
                              Icons.star,
                              color: MyColors.primary,
                            );
                          },
                        ),
                        MyText(
                          title: "(1)",
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
        ));
  }
}
