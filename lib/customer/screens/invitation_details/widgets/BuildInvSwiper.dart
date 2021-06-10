part of 'InvDetailsWidgetsImports.dart';

class BuildInvSwiper extends StatelessWidget {
  final List<MediaModel> mediaModel;
  final AdsDetailsModel adsDetailsModel;

  const BuildInvSwiper(
      {required this.mediaModel, required this.adsDetailsModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 160,
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: MyColors.greyWhite,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Swiper(
            itemBuilder: (BuildContext context, int index) {
              return CachedImage(
                url: mediaModel[index].file,
                fit: BoxFit.fill,
                bgColor: MyColors.white,
                borderRadius: BorderRadius.circular(10),
              );
            },
            pagination: SwiperPagination(),
            itemCount: mediaModel.length,
            autoplay: true,
            itemWidth: MediaQuery.of(context).size.width,
            itemHeight: 160,
            layout: SwiperLayout.STACK,
          ),
        ),
        BuildDownloadFile(adsDetailsModel: adsDetailsModel,)
      ],
    );
  }
}
