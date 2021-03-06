part of 'InvDetailsWidgetsImports.dart';

class BuildInvSwiper extends StatelessWidget {
  final List<String> images;
  final AdsDetailsModel adsDetailsModel;

  const BuildInvSwiper({required this.images, required this.adsDetailsModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Visibility(
          visible: images.isEmpty,
          child: Center(
            child: MyText(
              title: "لا يوجد صور",
            ),
          ),
          replacement: Container(
            height: 140,
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
                return InkWell(
                  onTap: () => AutoRouter.of(context).push(
                    ImageZoomRoute(
                      images: images,
                    ),
                  ),
                  child: CachedImage(
                    url: images[index],
                    fit: BoxFit.fill,
                    bgColor: MyColors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                );
              },
              pagination: SwiperPagination(),
              itemCount: images.length,
              autoplay: true,
              itemWidth: MediaQuery.of(context).size.width,
              itemHeight: 140,
              layout: SwiperLayout.STACK,
            ),
          ),
        ),
        Visibility(
          visible: adsDetailsModel.typeFile == "" ||
              adsDetailsModel.typeFile == null ||
              adsDetailsModel.catalog == "" ||
              adsDetailsModel.catalog == null,
          child: Center(),
          replacement: BuildDownloadFile(
            adsDetailsModel: adsDetailsModel,
          ),
        )
      ],
    );
  }
}
