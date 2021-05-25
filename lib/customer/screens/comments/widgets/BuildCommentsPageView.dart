part of 'CommentsWidgetsImports.dart';

class BuildCommentsPageView extends StatelessWidget {
  final String? text;
  final String? title;

  const BuildCommentsPageView({this.text, this.title});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            border: Border.all(
                color: MyColors.greyWhite.withOpacity(0.5), width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: MyColors.white,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(Res.pic),
                      fit: BoxFit.fill,
                    )),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            MyText(
                              title: text??"",
                              size: 10,
                              color: MyColors.white,
                            ),
                            SizedBox(width: 5,),
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: RatingBar.builder(
                                minRating: 0,
                                initialRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemSize: 15,
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (v) {},
                              ),
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: (){},
                          child: Icon(
                            Icons.more_vert,
                            color: MyColors.greyWhite.withOpacity(0.7),
                          ),
                        )
                      ],
                    ),
                    MyText(
                      title: title??"",
                      size: 10,
                      color: MyColors.greyWhite.withOpacity(0.7),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
