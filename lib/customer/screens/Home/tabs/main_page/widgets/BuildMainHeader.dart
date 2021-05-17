part of 'MainPageWidgetsImports.dart';

class BuildMainHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: 130,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(Res.bgheader), fit: BoxFit.fill)),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.search,
                  size: 30,
                  color: MyColors.white,
                ),
                Image.asset(
                  Res.logo,
                  height: 40,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 55,
              margin: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: MyColors.secondary,
                boxShadow: [
                  BoxShadow(
                    color: MyColors.black,
                  )
                ],
                borderRadius: BorderRadius.circular(30),
              ),
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 BuildHeaderDrop(title: "المنطقة",),
                 BuildHeaderDrop(title: "الاهتمامات",),
                 BuildHeaderDrop(title: "أخرى",),

                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: MyColors.primary,
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 5),
                    child: MyText(
                      title: "البحث",
                      size: 10,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
