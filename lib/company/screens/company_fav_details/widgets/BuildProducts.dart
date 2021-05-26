part of 'CompFavDetailsWidgetsImports.dart';

class BuildProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BuildAdsItem(title: "اهم المنتجات"),
        Container(
          height: 90,
          margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          child: ListView.builder(
            itemCount: 7,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                child: CachedImage(
                  url:
                  "https://www.ibelieveinsci.com/wp-content/uploads/GettyImages-498928946-59cd1dd3af5d3a0011d3a87e.jpg",
                  width: 90,
                  borderRadius: BorderRadius.circular(10),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
