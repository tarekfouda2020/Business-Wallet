part of 'WalletWidgetsImports.dart';

class BuildHelpText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        children: [
          MyText(
            title: "للمساعده",
            size: 10,
            color: MyColors.greyWhite.withOpacity(0.8),
          ),
          SizedBox(width: 5,),
          InkWell(
            onTap: () {},
            child: MyText(
              title: "اضغط هنا",
              size: 13,
              color: MyColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}
