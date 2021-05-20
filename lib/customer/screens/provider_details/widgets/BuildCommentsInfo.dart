part of 'ProviderDetailsWidgetsImports.dart';

class BuildCommentsInfo extends StatelessWidget {
  final ProviderDetailsData providerDetailsData;

  const BuildCommentsInfo({required this.providerDetailsData});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericCubit<bool>, GenericState<bool>>(
      bloc: providerDetailsData.commentsCubit,
      builder: (context, state) {
        return Column(
          children: [
            BuildTitle(
              title: "التعليقات",
              open: state.data,
              onTap: ()=> providerDetailsData.commentsCubit.onUpdateData(!state.data),
            ),
            Visibility(
              visible: state.data,
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 1,
                itemBuilder: (_, index){
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: MyColors.white,
                                  image: DecorationImage(
                                      image: AssetImage(Res.pic), fit: BoxFit.fill)),
                            ),
                            Expanded(
                                child: Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 10),
                                  child: MyText(
                                    title: "اسم المستخدم كاملا اويييييييييي",
                                    size: 9,
                                  ),
                                )),
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
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: MyText(
                                  title:
                                  "التعليق هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى",
                                  size: 9,
                                  color: MyColors.grey,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: ()=> AutoRouter.of(context)
                                  .push(ImageZoomRoute(images: [Res.pic])),
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 10),
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(Res.pic), fit: BoxFit.fill)),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        );
      },
    );
  }
}
