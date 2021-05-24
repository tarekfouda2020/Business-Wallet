part of 'CompanyFavDetailsImports.dart';

class CompanyFavDetails extends StatefulWidget {
  @override
  _CompanyFavDetailsState createState() => _CompanyFavDetailsState();
}

class _CompanyFavDetailsState extends State<CompanyFavDetails>
    with SingleTickerProviderStateMixin {
  final CompanyFavDetailsData companyFavDetailsData =
      new CompanyFavDetailsData();

  @override
  void initState() {
    super.initState();
    companyFavDetailsData.controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 5000,
      ),
    );

    companyFavDetailsData.animation = Tween<double>(
      begin: 0,
      end: 40,
    ).animate(CurvedAnimation(
        parent: companyFavDetailsData.controller, curve: Curves.easeOut))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          companyFavDetailsData.expandCubit.onUpdateData(220);
          Future.delayed(Duration(milliseconds: 500), () {
            companyFavDetailsData.showExpandCubit.onUpdateData(true);
          });
        }
      });
    companyFavDetailsData.controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darken,
      appBar: DefaultAppBar(
        title: "fdfdf",
      ),
      // body: Column(
      //       //   children: [
      //       //     Container(
      //       //       height: 180,
      //       //       child: Stack(
      //       //         alignment: Alignment.bottomRight,
      //       //         children: [
      //       //           BuildInvAppBar(),
      //       //           BuildInvAnimation(
      //       //             invitationDetailsData: invitationDetailsData,
      //       //           ),
      //       //           BuildAnimationDetails(
      //       //             invitationDetailsData: invitationDetailsData,
      //       //           )
      //       //         ],
      //       //       ),
      //       //     ),
      //       //     Flexible(
      //       //       child: ListView(
      //       //         padding: const EdgeInsets.only(top: 10),
      //       //         physics: BouncingScrollPhysics(
      //       //             parent: AlwaysScrollableScrollPhysics()),
      //       //         children: [
      //       //           BuildInvInfo(),
      //       //           BuildInvTitle(
      //       //             title: "وصف الاعلان",
      //       //           ),
      //       //           BuildInvDescription(),
      //       //           BuildInvTitle(
      //       //             title: "الصور",
      //       //           ),
      //       //           BuildInvSwiper(),
      //       //           BuildInvTitle(
      //       //             title: "صاحب الإعلان",
      //       //           ),
      //       //           BuildAdOwner(),
      //       //           BuildInvComments(invitationDetailsData: invitationDetailsData)
      //       //         ],
      //       //       ),
      //       //     ),
      //       //   ],
      //       // ),
      bottomNavigationBar: BuildAddComment(
        companyFavDetailsData: companyFavDetailsData,
      ),
    );
  }

  @override
  void dispose() {
    companyFavDetailsData.controller.dispose();
    super.dispose();
  }
}
