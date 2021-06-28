part of 'ThirdStepWidgetsImports.dart';

class BuildVideosView extends StatelessWidget {
  final CompanySubscribeData companySubscribeData;

  const BuildVideosView({required this.companySubscribeData});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText(
          title: "الفيديوهات",
          size: 11,
          color: MyColors.primary,
        ),
        Column(
          children: List.generate(
            companySubscribeData.addSubscribeModel.videos!.length,
                (index) {
              return InkWell(
                onTap: () => AutoRouter.of(context).push(
                  VideoPageRoute(
                    link: companySubscribeData.addSubscribeModel.videos![index]
                        .toString(),
                  ),
                ),
                child: Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(top: 15),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(Res.logo)),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: MyColors.greyWhite),
                  ),
                  child: Icon(
                    Icons.play_circle_fill,
                    size: 35,
                    color: MyColors.white,
                  ),
                ),
              );
            },
          ),
        ),
        Divider(
          color: MyColors.grey,
          height: 30,
        )
      ],
    );
  }
}
