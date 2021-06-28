part of 'FirstStepBrochureWidgetsImports.dart';

class BuildFileView extends StatelessWidget {
  final String pdf;

  const BuildFileView({required this.pdf}) ;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BuildAdsItem(title: "الملفات"),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 7),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText(
                title:pdf.split("/").last,
                size: 13,
                color: MyColors.white,
              ),
              InkWell(
                onTap: ()=>Utils.launchURL(url: pdf),
                child: Icon(
                  MdiIcons.cloudDownload,
                  size: 30,
                  color: MyColors.primary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
