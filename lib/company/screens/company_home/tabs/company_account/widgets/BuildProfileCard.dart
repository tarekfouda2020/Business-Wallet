part of 'CompAccountWidgetsImports.dart';

class BuildProfileCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var company = context.read<UserCubit>().state.model.companyModel;

    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      color: MyColors.black,
      alignment: Alignment.center,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: MyColors.primary),
            ),
            child: CachedImage(
              url: company!.img!,
              haveRadius: false,
              boxShape: BoxShape.circle,
              width: 50,
              height: 50,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          MyText(
            title:company.kayanName!,
            size: 13,
            color: MyColors.white,
          ),
          Spacer(),
          OpenContainer(
            closedElevation: 0,
            openElevation: 0,
            closedColor: Colors.transparent,
            middleColor: Colors.transparent,
            transitionDuration: Duration(milliseconds: 800),
            transitionType: ContainerTransitionType.fadeThrough,
            closedBuilder: (context, action) {
              return Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                decoration: BoxDecoration(
                  color: MyColors.primary,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: MyText(
                  title: "الصفحة الشخصية",
                  color: MyColors.blackOpacity,
                  size: 10,
                ),
              );
            },
            openBuilder: (context, action) {
              return CompanyProfile();
            },
          ),
        ],
      ),
    );
  }
}
