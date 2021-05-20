part of 'DetailsWidgetsImports.dart';

class BuildProductImg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: CachedImage(
        url:
            "https://www.ibelieveinsci.com/wp-content/uploads/GettyImages-498928946-59cd1dd3af5d3a0011d3a87e.jpg",
        borderRadius: BorderRadius.circular(10),
        width: MediaQuery.of(context).size.width,
        height: 170,
      ),
    );
  }
}
