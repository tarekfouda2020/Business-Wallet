part of 'CompProfileWidgetsImports.dart';

class BuildCommentItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(vertical: 7,horizontal: 5),
      decoration: BoxDecoration(
        border: Border.all(color: MyColors.greyWhite),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: MyText(
                          title: "gfgfg",
                          size: 9,
                          color: MyColors.greyWhite.withOpacity(.9),
                        ),
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
                      MyText(
                        title: "(3.0)",
                        size: 9,
                        color: MyColors.greyWhite.withOpacity(.9),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      MyText(
                        title: "10/03/2020",
                        size: 9,
                        color: MyColors.greyWhite.withOpacity(.9),
                      ),
                      Icon(
                        Icons.info,
                        color: MyColors.greyWhite.withOpacity(.9),
                        size: 20,
                      )
                    ],
                  ),
                  MyText(
                    title: "gfgfddddddg",
                    size: 9,
                    color: MyColors.greyWhite.withOpacity(.9),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
