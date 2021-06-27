part of 'CompSpecificAdsWidgetsImports.dart';

class BuildSwiperView extends StatelessWidget {
  final List<String> images;
  final AdsDetailsModel adsDetailsModel;

  const BuildSwiperView({required this.images, required this.adsDetailsModel});

  @override
  Widget build(BuildContext context) {
    return Container(
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
          return CachedImage(
            url: images[index],
            width: 70,
            height: 70,
            fit: BoxFit.fill,
            bgColor: MyColors.white,
            borderRadius: BorderRadius.circular(10),
          );
        },
        pagination: SwiperPagination(),
        itemCount: images.length,
        autoplay: true,
        itemWidth: MediaQuery.of(context).size.width,
        itemHeight: 140,
        layout: SwiperLayout.STACK,
      ),
    );
  }
}
