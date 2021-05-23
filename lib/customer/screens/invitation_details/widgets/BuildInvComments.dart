part of 'InvDetailsWidgetsImports.dart';

class BuildInvComments extends StatelessWidget {
  final InvitationDetailsData invitationDetailsData;
  const BuildInvComments({required this.invitationDetailsData});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericCubit<bool>, GenericState<bool>>(
      bloc: invitationDetailsData.commentCubit,
      builder: (context, state) {
        return ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            BuildTitle(
              title: "التعليقات",
              open: state.data,
              onTap: ()=> invitationDetailsData.commentCubit.onUpdateData(!state.data),
            ),
            Visibility(
              visible: state.data,
              child: Container(
                margin:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        BuildInvPic(),
                        Expanded(
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 10),
                              child: MyText(
                                title: "اسم المستخدم كاملا",
                                size: 9,
                              ),
                            )),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            MyText(
                              title: "منذ 3 دقيقة",
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
                              itemPadding:
                              EdgeInsets.symmetric(horizontal: 1.0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) => () {},
                            ),
                          ],
                        ),
                        Icon(Icons.more_vert)
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
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
