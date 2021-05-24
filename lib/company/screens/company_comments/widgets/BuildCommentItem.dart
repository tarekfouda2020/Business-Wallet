part of 'CompCommentsWidgetsImports.dart';

class BuildCommentItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 7),
      margin: const EdgeInsets.symmetric(vertical: 7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: MyColors.greyWhite),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CachedImage(
            url:
                "https://www.ibelieveinsci.com/wp-content/uploads/GettyImages-498928946-59cd1dd3af5d3a0011d3a87e.jpg",
            borderRadius: BorderRadius.circular(10),
            width: 75,
            height: 95,
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      MyText(
                        title: "اسم مستخدم",
                        size: 11,
                        color: MyColors.white,
                      ),
                      SizedBox(
                        width: 10,
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
                      Spacer(),
                      Icon(
                        Icons.more_vert_outlined,
                        size: 27,
                        color: MyColors.grey,
                      )
                    ],
                  ),
                  MyText(
                    title: "تم",
                    size: 10,
                    color: MyColors.white,
                  ),
                    SizedBox(
                      height: 5,
                    ),
                    CachedImage(
                    url:
                    "https://www.ibelieveinsci.com/wp-content/uploads/GettyImages-498928946-59cd1dd3af5d3a0011d3a87e.jpg",
                    borderRadius: BorderRadius.circular(5),
                    width: 40,
                    height: 25,
                  ),
                ],
              )
            ),
          ),
        ],
      ),
    );
  }
}
