part of 'InvDetailsWidgetsImports.dart';

class BuildAdOwner extends StatelessWidget {
  final KayanOwnerModel kayanOwnerModel;
  final AdsDetailsModel adsDetailsModel;
  final InvitationDetailsData invitationDetailsData;

  const BuildAdOwner(
      {required this.kayanOwnerModel,
      required this.adsDetailsModel,
      required this.invitationDetailsData});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        children: [
          InkWell(
            onTap: () {},
            child: BuildInvPic(
              image: kayanOwnerModel.image,
            ),
          ),
          Flexible(
            child: InkWell(
              onTap: () {},
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    title: kayanOwnerModel.name,
                    size: 11,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 15,
                        color: MyColors.primary,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: MyText(
                          title: kayanOwnerModel.addressKayan,
                          size: 9,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Offstage(
            offstage: adsDetailsModel.business,
            child: InkWell(
              onTap: () => invitationDetailsData.addOrRemoveFollow(
                  context, kayanOwnerModel.id, adsDetailsModel.id),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: MyColors.primary,
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: MyText(
                  title: adsDetailsModel.follow == true
                      ? "الغاء المتابعة"
                      : "متابعة",
                  size: 11,
                  color: MyColors.blackOpacity,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
