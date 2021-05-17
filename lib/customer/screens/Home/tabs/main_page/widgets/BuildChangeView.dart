part of 'MainPageWidgetsImports.dart';

class BuildChangeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Image.asset(
            Res.noun_men,
            height: 10,
            color: MyColors.white,
          ),
          SizedBox(
              height: 15,
              child: VerticalDivider(
                thickness: 1,
                color: MyColors.white,
              )),
          Image.asset(
            Res.noun_mapp,
            height: 13,
            color: MyColors.white,
          ),
        ],
      ),
    );
  }
}
