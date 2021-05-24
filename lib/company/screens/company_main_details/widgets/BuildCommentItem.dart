part of 'DetailsWidgetsImports.dart';

class BuildCommentItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: MyColors.greyWhite)
      ),
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
              Icon(Icons.more_vert_outlined,size: 27,color: MyColors.grey,)
            ],
          ),
         Container(
           margin: const EdgeInsets.symmetric(horizontal: 15),
           child:  Row(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Expanded(
                 child: Container(
                   margin:
                   const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                   child: MyText(
                     title:
                     "نص يمكن استبداله نص يمكن استبداله نص يمكن استبداله نص يمكن استبداله نص يمكن استبداله ",
                     size: 9,
                     color: MyColors.grey,
                   ),
                 ),
               ),
               CachedImage(
                 url:
                 "https://www.ibelieveinsci.com/wp-content/uploads/GettyImages-498928946-59cd1dd3af5d3a0011d3a87e.jpg",
                 width: 70,
                 height: 70,
               ),
             ],
           ),
         )
        ],
      ),
    );
    // return Container(
    //   margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.end,
    //     children: [
    //       Row(
    //         children: [
    //           CachedImage(
    //             url:
    //                 "https://www.ibelieveinsci.com/wp-content/uploads/GettyImages-498928946-59cd1dd3af5d3a0011d3a87e.jpg",
    //             haveRadius: false,
    //             boxShape: BoxShape.circle,
    //             width: 60,
    //             height: 60,
    //           ),
    //           Column(
    //             mainAxisAlignment: MainAxisAlignment.start,
    //             children: [
    //               MyText(
    //                 title: "اسم المستخدم كاملا",
    //                 size: 9,
    //               ),
    //               MyText(
    //                 title: "اسم المستخدم كاملا",
    //                 size: 9,
    //               ),
    //             ],
    //           ),
    //           Spacer(),
    //           Column(
    //             children: [
    //               MyText(
    //                 title: "منذ 3 دقيقة",
    //                 size: 8,
    //                 color: MyColors.grey,
    //               ),
    //               RatingBar.builder(
    //                 initialRating: 1,
    //                 minRating: 0,
    //                 direction: Axis.horizontal,
    //                 allowHalfRating: true,
    //                 updateOnDrag: false,
    //                 itemCount: 5,
    //                 itemSize: 12,
    //                 itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
    //                 itemBuilder: (context, _) => Icon(
    //                   Icons.star,
    //                   color: Colors.amber,
    //                 ),
    //                 onRatingUpdate: (rating) => () {},
    //               ),
    //             ],
    //           ),
    //           Icon(
    //             Icons.more_vert,
    //             color: MyColors.grey,
    //             size: 27,
    //           )
    //         ],
    //       ),
    //       CachedImage(
    //         url:
    //             "https://www.ibelieveinsci.com/wp-content/uploads/GettyImages-498928946-59cd1dd3af5d3a0011d3a87e.jpg",
    //         width: 60,
    //         height: 60,
    //         borderRadius: BorderRadius.circular(5),
    //       ),
    //     ],
    //   ),
    // );
  }
}
