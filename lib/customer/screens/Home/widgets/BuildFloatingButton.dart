part of 'HomeWidgetsImports.dart';

class BuildFloatingButton extends StatelessWidget {
  final HomeData homeData;
  const BuildFloatingButton(this.homeData);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        homeData.tabController.animateTo(2);
      },
      child: Container(
        height: 65,
        width: 65,
        decoration: BoxDecoration(
            color: MyColors.primary,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                  color: MyColors.darken,
                  spreadRadius: 3,
                  blurRadius: 10,
                  // offset: Offset(0, 2)
              )
            ]
        ),
        margin: const EdgeInsets.only(top: 20),
        child: Icon(Icons.home, size: 35, color: MyColors.white,),
      ),
    );
  }
}
