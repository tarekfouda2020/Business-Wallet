part of 'HomeWidgetsImports.dart';

class BuildFloatingButton extends StatelessWidget {
  final HomeData homeData;
  const BuildFloatingButton(this.homeData);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: ()=> homeData.homeClick(context),
      child: Icon(Icons.home, color: MyColors.white,),
    );
  }
}
