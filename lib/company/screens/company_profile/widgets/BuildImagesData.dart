part of 'CompProfileWidgetsImports.dart';

class BuildImagesData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (_, index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 3),
          child: InkWell(
            onTap: () => AutoRouter.of(context).push(
              ImageZoomRoute(images: [
                "https://www.ibelieveinsci.com/wp-content/uploads/GettyImages-498928946-59cd1dd3af5d3a0011d3a87e.jpg",
                "https://www.ibelieveinsci.com/wp-content/uploads/GettyImages-498928946-59cd1dd3af5d3a0011d3a87e.jpg",
              ]),
            ),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              child: CachedImage(
                url:
                    "https://www.ibelieveinsci.com/wp-content/uploads/GettyImages-498928946-59cd1dd3af5d3a0011d3a87e.jpg",
                borderRadius: BorderRadius.circular(10),
                width: 130,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
