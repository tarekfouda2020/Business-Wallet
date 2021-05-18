part of 'HomeWidgetsImports.dart';

class BuildProviderItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.15,
      width: MediaQuery.of(context).size.width * 0.40,
      decoration: BoxDecoration(
          color: MyColors.white,
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
              image: AssetImage(Res.on3),
              fit: BoxFit.fill,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.6),
                  BlendMode.darken)
          )
      ),
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            height: 40, width: 40,
            decoration: BoxDecoration(
                color: MyColors.white,
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage(Res.on1),
                    fit: BoxFit.fill
                )
            ),
          ),
          SizedBox(width: 5,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MyText(
                title: "اسم الكيان",
                size: 9,
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
                    onRatingUpdate: (rating) => (){},
                  ),
                  SizedBox(width: 3,),
                  MyText(
                    title: "(12)",
                    size: 8,
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
