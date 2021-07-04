part of 'MapScreenWidgetImports.dart';

class BuildMapMarker extends StatelessWidget {
  final MainModel? mainModel;
  final FollowerModel? followerModel;
  final bool checkFollow;
  const BuildMapMarker({this.mainModel, this.followerModel, this.checkFollow = false});
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
              url: checkFollow ? followerModel!.img : mainModel!.Img,
              width: 45,
              height: 45,
              boxShape: BoxShape.circle,
              haveRadius: false,
            ),
            SizedBox(width: 5),
            MyText(title: checkFollow
                ? followerModel!.name
                : mainModel!.kayanName, size: 12, color: MyColors.white,),
          ],
        ),
      ),
    );
  }
}

