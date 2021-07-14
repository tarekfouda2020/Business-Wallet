part of 'InvDetailsWidgetsImports.dart';

class BuildInvAnimation extends StatelessWidget {
  final InvitationDetailsData invitationDetailsData;
  final AdsDetailsModel? adsDetailsModel;
  const BuildInvAnimation(
      {required this.invitationDetailsData, required this.adsDetailsModel});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericCubit<double>, GenericState<double>>(
      bloc: invitationDetailsData.expandCubit,
      builder: (context, state) {
        return AnimatedContainer(
          height: 70,
          width: state.data,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          duration: Duration(milliseconds: 500),
          decoration: BoxDecoration(
              color: MyColors.darken,
              borderRadius: BorderRadius.circular(35),
              border: Border.all(color: MyColors.primary)),
          child: BlocBuilder<GenericCubit<bool>, GenericState<bool>>(
            bloc: invitationDetailsData.showExpandCubit,
            builder: (context, state) {
              return Offstage(
                offstage: !state.data,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 35,
                    ),
                    MyText(
                      title: "${adsDetailsModel?.pointsForEachUser}  هللة",
                      color: MyColors.white,
                      alien: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: MyColors.black),
                      alignment: Alignment.center,
                      child: Icon(
                        MdiIcons.handHeartOutline,
                        size: 20,
                        color: MyColors.primary.withOpacity(0.7),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
