part of 'DetailsWidgetsImports.dart';

class BuildImagesData extends StatelessWidget {
  final List<String>? products;

  const BuildImagesData({required this.products});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: MediaQuery.of(context).size.width,
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: products!.length,
        itemBuilder: (_, index) {
          return InkWell(
            onTap: () => AutoRouter.of(context).push(
              ImageZoomRoute(
                images: products,
              ),
            ),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: CachedImage(
                url: products![index],
                haveRadius: false,
                height: 70,
                width: 120,
                borderColor: MyColors.greyWhite,
              ),
            ),
          );
        },
      ),
    );
  }
}
