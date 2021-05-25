part of 'CompWalletWidgetsImports.dart';

class BuildHelp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Flexible(
            child: MyText(
              title:
                  " طريقة الاستفادة من النقاط او الاستبدال منها او مشاركة النقاط او استخدامها للاعلانات ",
              size: 11,
              color: MyColors.greyWhite.withOpacity(0.9),
            ),
          ),
          InkWell(
            onTap: ()=>AutoRouter.of(context).push(TermsRoute()),
            child: MyText(
              title: " اضغط هنا",
              size: 13,
              decoration: TextDecoration.underline,
              color: MyColors.primary,
            ),
          )
        ],
      ),
    );
  }
}
