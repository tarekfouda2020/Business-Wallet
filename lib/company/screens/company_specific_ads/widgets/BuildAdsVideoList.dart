part of 'CompSpecificAdsWidgetsImports.dart';

class BuildAdsVideoList extends StatelessWidget {
  final List<String> videos;

  const BuildAdsVideoList({required this.videos});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: List.generate(videos.length, (index) {
          return InkWell(
            onTap: () => AutoRouter.of(context)
                .push(VideoPageRoute(link: videos[index])),
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
        }),
      ),
    );
  }
}
