part of 'CompanyWidgetsImports.dart';

class BuildFloatButton extends StatelessWidget {
  final CompanyHomeData companyHomeData;

  const BuildFloatButton({required this.companyHomeData});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => companyHomeData.homeClick(context),
      child: Icon(
        Icons.home,
        color: MyColors.white,
      ),
    );
  }
}
