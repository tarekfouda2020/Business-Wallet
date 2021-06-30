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
            size: 12,
            color: MyColors.grey,
          ),
          SizedBox(width: 5,),
          InkWell(
            onTap: ()=>AutoRouter.of(context).push(WalletHelpRoute()),
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
