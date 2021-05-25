part of 'CompPackagesWidgetsImports.dart';

class BuildPackagesItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .45,
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: MyColors.primary),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyText(
                title: "باقة اعلان 30",
                size: 11,
                color: MyColors.primary,
              ),
              MyText(
                title: "هللة",
                size: 11,
              ),
            ],
          ),
          ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 15),
            itemCount: 3,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (_, index) => BuildTextItem(),
          ),
          MyText(
            title: "(30 هللة - 500 ريال) لكل مشاهدة",
            size: 9.5,
            color: MyColors.offWhite,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 3),
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 3),
            decoration: BoxDecoration(
              border: Border.all(color: MyColors.primary),
              borderRadius: BorderRadius.circular(20),
            ),
            child: MyText(
              title: "اشترك الان",
              size: 10,
              color: MyColors.primary,
            ),
          )
        ],
      ),
    );
  }
}
