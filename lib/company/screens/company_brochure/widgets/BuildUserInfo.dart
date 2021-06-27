part of 'CompBrochureWidgetsImports.dart';

class BuildUserInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var company = context.read<UserCubit>().state.model.companyModel;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: MyColors.black,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: MyColors.primary),
                shape: BoxShape.circle),
            padding: const EdgeInsets.all(5),
            child: CachedImage(
              url:company!.img!,
              width: 55,
              height: 55,
              haveRadius: false,
              boxShape: BoxShape.circle,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          MyText(
            title: company.kayanName!,
            size: 11,
            color: MyColors.white,
          ),
        ],
      ),
    );
  }
}
