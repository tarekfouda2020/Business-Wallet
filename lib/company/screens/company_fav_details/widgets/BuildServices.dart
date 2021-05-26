part of 'CompFavDetailsWidgetsImports.dart';

class BuildServices extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BuildAdsItem(title: "الخدمات"),
        ListView.builder(
          padding: const EdgeInsets.only(top: 10),
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 3,
          itemBuilder: (_, index) =>
              BuildServiceItem(title: "اسم الخدمة", price: "0 ريال "),
        )
      ],
    );
  }
}
