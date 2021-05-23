part of 'InvDetailsWidgetsImports.dart';

class BuildInvSwiper extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      margin:
      const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
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
            url:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTUoQZSsfmS3ZPKPHu-KORypJzT3ue3T00eSA&usqp=CAU",
            fit: BoxFit.fill,
            bgColor: MyColors.white,
            borderRadius: BorderRadius.circular(10),
          );
        },
        pagination: SwiperPagination(),
        itemCount: 4,
        autoplay: true,
        itemWidth: MediaQuery.of(context).size.width,
        itemHeight: 160,
        layout: SwiperLayout.STACK,
      ),
    );
  }
}
