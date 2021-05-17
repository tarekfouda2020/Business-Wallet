part of 'MainPageWidgetsImports.dart';

class BuildHeaderDrop extends StatelessWidget {
  final String ?title;
  const BuildHeaderDrop({this.title});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: ,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(
            horizontal: 8, vertical: 5),
        child: Row(
          children: [
            MyText(
              title: title?? "",
              size: 7,
              color: MyColors.white,
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.arrow_drop_down_outlined,
              size: 15,
            )
          ],
        ),
      ),
    );
  }
}
