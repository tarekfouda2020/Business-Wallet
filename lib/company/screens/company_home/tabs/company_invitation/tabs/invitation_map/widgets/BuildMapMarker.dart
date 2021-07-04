part of 'InvitationMapWidgetsImports.dart';
class BuildMapMarker extends StatelessWidget {
  final String img;
  final String name;

  const BuildMapMarker({required this.img, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black, width: 1),
          color: MyColors.darken,
          shape: BoxShape.rectangle,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CachedImage(
              url: img,
              width: 45,
              height: 45,
              boxShape: BoxShape.circle,
              haveRadius: false,
            ),
            SizedBox(width: 5),
            MyText(title: name, size: 12, color: MyColors.white,),
          ],
        ),
      ),
    );
  }
}
