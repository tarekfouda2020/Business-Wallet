part of 'DetailsWidgetsImports.dart';

class BuildCommentItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CachedImage(
                url:
                    "https://www.ibelieveinsci.com/wp-content/uploads/GettyImages-498928946-59cd1dd3af5d3a0011d3a87e.jpg",
                haveRadius: false,
                boxShape: BoxShape.circle,
                width: 60,
                height: 60,
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: MyText(
                    title: "اسم المستخدم  ",
                    size: 9,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  MyText(
                    title: "PM 05:55 05/20/2021",
                    size: 8,
                    color: MyColors.grey,
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
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: MyText(
                    title:
                        "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                    size: 9,
                    color: MyColors.grey,
                  ),
                ),
              ),
              CachedImage(
                url:
                    "https://www.ibelieveinsci.com/wp-content/uploads/GettyImages-498928946-59cd1dd3af5d3a0011d3a87e.jpg",
                width: 100,
                height: 100,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
