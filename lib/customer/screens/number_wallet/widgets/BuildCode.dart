part of'NumberWalletWidgetsImports.dart';
class BuildCode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          alignment: Alignment.center,
          height: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: MyColors.greyWhite
          ),
          child: MyText(
            title: "9AHTM6BR",
            size: 40,
            color: MyColors.greyWhite.withOpacity(0.7),
            // alien: TextAlign.center,
          ),
        ),
        Container(
          alignment: Alignment.center,
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: MyColors.gold,
          ),
          child: Icon(
            Icons.copy,
            color: MyColors.black,
          ),
        ),
      ],
    );
  }
}
