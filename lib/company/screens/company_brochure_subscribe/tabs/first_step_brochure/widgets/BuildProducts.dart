part of 'FirstStepBrochureWidgetsImports.dart';

class BuildProducts extends StatelessWidget {
  final List<ImageModel>? images;

  const BuildProducts({required this.images});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BuildAdsItem(title: "اهم المنتجات"),
        Visibility(
          visible: images == null || images?.length == 0,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 15),
            alignment: Alignment.center,
            child: MyText(
              title: "لا يوجد منتجات ",
              size: 12,
              color: MyColors.white,
            ),
          ),
          replacement: Container(
            height: 90,
            margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            child: ListView.builder(
              itemCount: images?.length ?? 0,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  child: CachedImage(
                    borderColor: MyColors.greyWhite,
                    url: images![index].img,
                    width: 90,
                    borderRadius: BorderRadius.circular(10),
                  ),
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
