part of 'InvDetailsWidgetsImports.dart';

class BuildInvInfo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText(
                title: "اسم الاعلان",
                size: 14,
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
              Container(
                child: Row(
                  children: [
                    Container(
                      height: 30,
                      width: 30,
                      padding: const EdgeInsets.all(5),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10),
                      decoration: BoxDecoration(
                          color: MyColors.black,
                          shape: BoxShape.circle),
                      alignment: Alignment.centerLeft,
                      child: Icon(
                        MdiIcons.shareVariant,
                        size: 18,
                      ),
                    ),
                    Container(
                      height: 30,
                      width: 30,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: MyColors.black,
                          shape: BoxShape.circle),
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.favorite,
                        size: 17,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(
                    vertical: 10, horizontal: 5),
                child: Icon(
                  Icons.location_on,
                  size: 15,
                  color: MyColors.primary,
                ),
              ),
              MyText(
                title: "الرياض - المملكة العربية السعودية",
                size: 9,
              )
            ],
          )
        ],
      ),
    );
  }
}
