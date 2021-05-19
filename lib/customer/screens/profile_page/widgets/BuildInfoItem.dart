part of 'ProfilePageWidgetsImports.dart';

class BuildInfoItem extends StatelessWidget {
  final IconData iconData;
  final String title;
  final String details;
  final Color? iconColor;

  const BuildInfoItem(
      {required this.iconData,
      required this.title,
      this.iconColor,
      required this.details});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(
            title: title,
            size: 10.5,
            color: MyColors.white,
          ),
          Row(
            children: [
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 7, vertical: 8),
                  child: Icon(
                    iconData,
                    size: 17,
                    color: iconColor ?? MyColors.primary,
                  )),
              MyText(title: details, size: 9.5,)
            ],
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 8),
            child: Divider(thickness: 1,),
          )
        ],
      ),
    );
  }
}
