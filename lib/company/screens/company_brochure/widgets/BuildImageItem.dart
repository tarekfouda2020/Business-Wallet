part of 'CompBrochureWidgetsImports.dart';

class BuildImageItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Container(
      alignment: Alignment.topLeft,
      width: 100,
      height: 100,
      child: Icon(
        Icons.cancel,
        size: 30,
        color: MyColors.white,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: MyColors.grey, width: 1),
        borderRadius: BorderRadius.all(Radius.circular(5)),
        image: DecorationImage(
          image: NetworkImage(
            "https://www.ibelieveinsci.com/wp-content/uploads/GettyImages-498928946-59cd1dd3af5d3a0011d3a87e.jpg",
          ),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
