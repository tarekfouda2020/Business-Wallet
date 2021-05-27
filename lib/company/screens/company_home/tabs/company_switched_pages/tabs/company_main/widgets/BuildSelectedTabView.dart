part of 'CompMainWidgetsImports.dart';

class BuildSelectedTabView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: Container(
        height: 55,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        margin: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          color: MyColors.black.withOpacity(0.95),
          boxShadow: [
            BoxShadow(
              color: MyColors.greyWhite,
              spreadRadius: 1,
              blurRadius: 1,
            )
          ],
          borderRadius: BorderRadius.circular(30),
        ),
        alignment: Alignment.center,
        child: Row(
          children: <Widget>[
            BuildHeaderDrop(title: "المنطقة"),
            BuildHeaderDrop(title: "الاهتمامات"),
            BuildHeaderDrop(title: "اخري"),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              margin: EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: MyColors.primary,
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                ),
              ),
              alignment: Alignment.center,
              child: MyText(
                title: "تأكيد",
                size: 9,
                color: MyColors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
