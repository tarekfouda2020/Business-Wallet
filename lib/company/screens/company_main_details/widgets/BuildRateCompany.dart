part of 'DetailsWidgetsImports.dart';

class BuildRateCompany extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyText(
            title: "قيم المنشأة",
            size: 13,
          ),
          SizedBox(width: 10,),
          RatingBar.builder(
            initialRating: 1,
            minRating: 0,
            direction: Axis.horizontal,
            allowHalfRating: false,
            updateOnDrag: false,
            itemCount: 5,
            itemSize: 25,
            itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) => () {},
          ),
        ],
      ),
    );
  }
}
