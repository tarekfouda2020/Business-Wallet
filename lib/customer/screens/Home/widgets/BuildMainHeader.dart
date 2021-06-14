part of 'HomeWidgetsImports.dart';

class BuildMainHeader extends StatelessWidget {
  final String? title;
  final Widget? search;
  final Function()? searchOnTap;

  const BuildMainHeader({this.title, this.search, this.searchOnTap});

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
                image: AssetImage(Res.bgheader),
                fit: BoxFit.fill,
                colorFilter: ColorFilter.mode(
                  Colors.white24,
                  BlendMode.softLight,
                ),
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                title == null
                    ? IconButton(
                        onPressed: searchOnTap,
                        icon: Icon(
                          Icons.search,
                          size: 30,
                          color: MyColors.white,
                        ),
                      )
                    : MyText(
                        title: title ?? "",
                        size: 14,
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
                child: search),
          )
        ],
      ),
    );
  }
}
