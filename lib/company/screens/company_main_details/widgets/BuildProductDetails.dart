part of 'DetailsWidgetsImports.dart';

class BuildProductDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: MyColors.primary),
                shape: BoxShape.circle),
            padding: const EdgeInsets.all(5),
            child: CachedImage(
              url:
                  "https://www.ibelieveinsci.com/wp-content/uploads/GettyImages-498928946-59cd1dd3af5d3a0011d3a87e.jpg",
              boxShape: BoxShape.circle,
              haveRadius: false,
              width: 50,
              height: 50,
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    title: "اسم",
                    size: 10,
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
              ),
            ),
          ),
          Column(
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                margin: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: MyColors.black),
                alignment: Alignment.center,
                child: Icon(
                  Icons.thumb_up,
                  size: 13,
                  color: MyColors.primary,
                ),
              ),
              MyText(
                title: "4",
                size: 9,
              )
            ],
          ),
          Spacer(),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: MyColors.primary,
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: MyText(
                  title: "ارسال بروشور",
                  size: 9,
                  color: Colors.black,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: MyColors.primary,
                ),
                margin: const EdgeInsets.symmetric(vertical: 5),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: MyText(
                  title: "متابعة",
                  size: 9,
                  color: Colors.black,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
