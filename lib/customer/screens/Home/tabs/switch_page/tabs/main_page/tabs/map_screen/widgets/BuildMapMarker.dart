part of 'MapScreenWidgetImports.dart';

class BuildMapMarker extends StatelessWidget {
  final MainModel? mainModel;
  final FollowerModel? followerModel;
  final bool checkFollow;
  const BuildMapMarker({this.mainModel, this.followerModel, this.checkFollow = false});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black, width: 1),
        color: MyColors.darken,
        shape: BoxShape.rectangle,
      ),
      child: MyText(title: checkFollow
          ? followerModel!.name
          : mainModel!.kayanName, size: 12, color: MyColors.white,),
    );
  }
}

