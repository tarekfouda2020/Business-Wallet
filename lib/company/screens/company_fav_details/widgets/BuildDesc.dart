part of 'CompFavDetailsWidgetsImports.dart';

class BuildDesc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BuildAdsItem(
          title: "وصف الاعلان",
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: MyText(
            title:
                " نص يمكن استبداله نص يمكن استبداله نص يمكن استبداله نص يمكن استبداله نص يمكن استبداله نص يمكن استبداله نص يمكن استبداله",
            size: 11,
            color: MyColors.grey,
          ),
        )
      ],
    );
  }
}
