part of 'CompProductAdsWidgetsImports.dart';

class BuildProductImages extends StatelessWidget {
  final List<String> images;

  const BuildProductImages({required this.images}) ;

  @override
  Widget build(BuildContext context) {
  return  Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      width: MediaQuery.of(context).size.width,
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        itemBuilder: (_, index) {
          return InkWell(
            onTap: () => AutoRouter.of(context).push(
              ImageZoomRoute(
                images: images,
              ),
            ),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: CachedImage(
                url: images[index],
                haveRadius: false,
                height: 70,
                width: 120,
                borderColor: MyColors.greyWhite,
              ),
            ),
          );
        },
      ),
    );  }
}
