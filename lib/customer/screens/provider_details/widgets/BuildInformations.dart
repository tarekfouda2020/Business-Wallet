part of 'ProviderDetailsWidgetsImports.dart';

class BuildInformations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BuildUserPhoto(),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(title: "اسم الكيان كاملا اوييييييييي", size: 10,),
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
                    shape: BoxShape.circle,
                    color: MyColors.black
                ),
                alignment: Alignment.center,
                child: Icon(Icons.thumb_up, size: 13, color: MyColors.primary,),
              ),
              MyText(
                title: "4",
                size: 9,
              )
            ],
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: MyColors.primary,
            ),
            padding: const EdgeInsets.symmetric(
                horizontal: 10, vertical: 5),
            child: MyText(
              title: "الغاء المتابعة",
              size: 10,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
