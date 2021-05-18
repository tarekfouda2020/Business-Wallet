part of 'CompMainWidgetsImports.dart';

class BuildMainItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CachedImage(
      url:
          "https://www.ibelieveinsci.com/wp-content/uploads/GettyImages-498928946-59cd1dd3af5d3a0011d3a87e.jpg",
      alignment: Alignment.bottomCenter,
      borderRadius: BorderRadius.circular(10),
      fit: BoxFit.fill,
      colorFilter:
          ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.darken),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
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
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
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
        ],
      ),
    );
  }
}
