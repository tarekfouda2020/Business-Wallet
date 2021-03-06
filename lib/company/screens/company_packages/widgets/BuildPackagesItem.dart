part of 'CompPackagesWidgetsImports.dart';

class BuildPackagesItem extends StatelessWidget {
  final PackagesModel packagesModel;
  final CompanyPackagesData companyPackagesData;

  const BuildPackagesItem(
      {required this.packagesModel, required this.companyPackagesData});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 335,
      width: MediaQuery.of(context).size.width * .45,
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: MyColors.primary),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyText(
            title: packagesModel.title,
            size: 11,
            color: MyColors.primary,
          ),
          Offstage(
            offstage: packagesModel.desc.isEmpty,
            child: Container(
              margin: const EdgeInsets.all(5),
              child: MyText(
                title: "${packagesModel.desc}",
                size: 8,
                color: MyColors.white,
                alien: TextAlign.center,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Offstage(
                  offstage: packagesModel.desc.isNotEmpty,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    child: Icon(
                      MdiIcons.gift,
                      size: 30,
                    ),
                  ),
                ),
                ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  itemCount: packagesModel.content.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (_, index) => BuildTextItem(
                    contentItem: packagesModel.content[index],
                  ),
                ),
                MyText(
                  title:
                      "${packagesModel.start}: ${packagesModel.price} ${packagesModel.data}",
                  size: 9.5,
                  color: MyColors.offWhite,
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () =>
                companyPackagesData.navigate(context, packagesModel.type),
            child: Container(
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 3),
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 3),
              decoration: BoxDecoration(
                border: Border.all(color: MyColors.primary),
                borderRadius: BorderRadius.circular(20),
              ),
              child: MyText(
                title: "?????????? ????????",
                size: 10,
                color: MyColors.primary,
              ),
            ),
          )
        ],
      ),
    );
  }
}
