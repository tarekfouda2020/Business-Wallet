part of 'CompanyWidgetsImports.dart';

class BuildFloatButton extends StatelessWidget {
  final CompanyHomeData companyHomeData;

  const BuildFloatButton({required this.companyHomeData});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => companyHomeData.onChangePage(2),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: MyColors.primary,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: MyColors.black,
              blurRadius: 8,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Icon(
          MdiIcons.home,
          color: MyColors.white,
        ),
      ),
    );
  }
}
