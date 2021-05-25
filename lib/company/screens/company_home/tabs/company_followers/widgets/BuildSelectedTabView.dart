part of 'CompFollowersWidgetsImport.dart';

class BuildSelectedTabView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: Container(
        height: 55,
        padding: const EdgeInsets.symmetric(horizontal: 5),
        margin: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          color: MyColors.secondary,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: MyColors.black,
              spreadRadius: 1,
              blurRadius: 1,
            )
          ],
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: InkWell(
                child: Row(
                  children: [
                    MyText(
                      title: "المنطقة",
                      size: 10,
                      color: MyColors.white,
                    ),
                    Icon(Icons.arrow_drop_down)
                  ],
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                child: Row(
                  children: [
                    MyText(
                      title: "الاهتمامات",
                      size: 10,
                      color: MyColors.white,
                    ),
                    Icon(Icons.arrow_drop_down)
                  ],
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                child: Row(
                  children: [
                    MyText(
                      title: "اخري",
                      size: 10,
                      color: MyColors.white,
                    ),
                    Icon(Icons.arrow_drop_down)
                  ],
                ),
              ),
            ),
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
                size: 10,
                color: MyColors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
