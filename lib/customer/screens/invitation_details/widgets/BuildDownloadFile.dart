part of 'InvDetailsWidgetsImports.dart';

class BuildDownloadFile extends StatelessWidget {
  final AdsDetailsModel adsDetailsModel;

  const BuildDownloadFile({required this.adsDetailsModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 5),
      child: Row(
        children: [
          MyText(
            title: adsDetailsModel.typeFile,
            color: MyColors.white,
            size: 11,
          ),
          Spacer(),
          InkWell(
            onTap: () => Utils.launchURL(url: adsDetailsModel.catalog),
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: MyColors.primary),
              child: Row(
                children: [
                  MyText(
                    title: "اضغط لتحميل الملف",
                    color: MyColors.black,
                    size: 11,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    MdiIcons.cloudDownload,
                    color: MyColors.blackOpacity,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
