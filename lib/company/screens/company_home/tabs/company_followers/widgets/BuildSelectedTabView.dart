part of 'CompFollowersWidgetsImport.dart';

class BuildSelectedTabView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: MyColors.black,
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
                  SizedBox(
                    width: 10,
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
                  SizedBox(
                    width: 10,
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
                  SizedBox(
                    width: 10,
                  ),
                  Icon(Icons.arrow_drop_down)
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            margin: EdgeInsets.symmetric(vertical: 8),
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
    );
  }
}
