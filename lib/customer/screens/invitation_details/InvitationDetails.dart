part of 'InvitationDetailsImports.dart';

class InvitationDetails extends StatefulWidget {
  @override
  _InvitationDetailsState createState() => _InvitationDetailsState();
}

class _InvitationDetailsState extends State<InvitationDetails>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    invitationDetailsData.controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 5000,
      ),
    );

    invitationDetailsData.animation = Tween<double>(
      begin: 0,
      end: 40,
    ).animate(CurvedAnimation(
        parent: invitationDetailsData.controller, curve: Curves.easeOut))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          invitationDetailsData.expandCubit.onUpdateData(220);
          Future.delayed(Duration(milliseconds: 500), () {
            invitationDetailsData.showExpandCubit.onUpdateData(true);
          });
        }
      });
    invitationDetailsData.controller.forward();
  }

  InvitationDetailsData invitationDetailsData = InvitationDetailsData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darken,
      body: Column(
        children: [
          Container(
            height: 180,
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                BuildInvAppBar(),
                BuildInvAnimation(
                  invitationDetailsData: invitationDetailsData,
                ),
                BuildAnimationDetails(
                  invitationDetailsData: invitationDetailsData,
                )
              ],
            ),
          ),
          Flexible(
            child: ListView(
              padding: const EdgeInsets.only(top: 10),
              physics: BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              children: [
                BuildInvInfo(),
                BuildInvTitle(
                  title: "وصف الاعلان",
                ),
                BuildInvDescription(),
                BuildInvTitle(
                  title: "الصور",
                ),
                BuildInvSwiper(),
                BuildInvTitle(
                  title: "صاحب الإعلان",
                ),
                BuildAdOwner(),
                BuildInvComments(invitationDetailsData: invitationDetailsData)
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BuildAddComment(
        invitationDetailsData: invitationDetailsData,
      ),
    );
  }

  @override
  void dispose() {
    invitationDetailsData.controller.dispose();
    super.dispose();
  }
}
