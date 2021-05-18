part of 'FavMenuWidgetsImports.dart';

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
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.zero,
          padding: EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
            color: MyColors.darken,

          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
