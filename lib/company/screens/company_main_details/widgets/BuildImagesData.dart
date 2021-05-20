part of 'DetailsWidgetsImports.dart';

class BuildImagesData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 120,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 3,
        itemBuilder: (_, index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 3),
          child: Container(
            margin: const EdgeInsets.symmetric(
                horizontal: 5, vertical: 10),
            child: CachedImage(
              url:
              "https://www.ibelieveinsci.com/wp-content/uploads/GettyImages-498928946-59cd1dd3af5d3a0011d3a87e.jpg",
              borderRadius: BorderRadius.circular(10),
              width: 130,
            ),
          ),
        ),
      ),
    );
  }
}
