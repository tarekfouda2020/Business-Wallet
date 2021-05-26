part of 'CompFavDetailsWidgetsImports.dart';
class BuildAdsInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: MyColors.black,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: MyColors.primary),
                  shape: BoxShape.circle
              ),
              padding: const EdgeInsets.all(5),
              child: CachedImage(
                url:
                "https://www.ibelieveinsci.com/wp-content/uploads/GettyImages-498928946-59cd1dd3af5d3a0011d3a87e.jpg",
                width: 55,
                height: 55,
                haveRadius: false,
                boxShape: BoxShape.circle,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            MyText(
              title: "اسم مستخدم",
              size: 11,
              color: MyColors.white,
            ),
          ],
        ),
      ),
    );  }
}
