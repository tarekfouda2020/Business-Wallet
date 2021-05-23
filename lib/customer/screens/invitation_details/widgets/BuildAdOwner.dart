part of 'InvDetailsWidgetsImports.dart';

class BuildAdOwner extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          BuildInvPic(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(
                  title: "اسم صاحب الاعلان",
                  size: 11,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 15,
                      color: MyColors.primary,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    MyText(
                      title: "الرياض - المملكة العربية السعودية",
                      size: 9,
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: MyColors.primary,
            ),
            padding: const EdgeInsets.symmetric(
                horizontal: 10, vertical: 5),
            child: MyText(
              title: "متابعة",
              size: 11,
              color: MyColors.blackOpacity,
            ),
          )
        ],
      ),
    );
  }
}
