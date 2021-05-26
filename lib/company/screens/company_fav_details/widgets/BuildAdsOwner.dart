part of 'CompFavDetailsWidgetsImports.dart';

class BuildAdsOwner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BuildAdsItem(title: "صاحب الاعلان"),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: MyColors.primary),
                    shape: BoxShape.circle),
                padding: const EdgeInsets.all(5),
                child: CachedImage(
                  url:
                  "https://www.ibelieveinsci.com/wp-content/uploads/GettyImages-498928946-59cd1dd3af5d3a0011d3a87e.jpg",
                  width: 55,
                  height: 55,
                  haveRadius: false,
                  boxShape: BoxShape.circle,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    title: "اسم مستخدم",
                    size: 11,
                    color: MyColors.white,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 17,
                        color: MyColors.primary,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      MyText(
                        title: "اسم مستخدم",
                        size: 11,
                        color: MyColors.white,
                      ),
                    ],
                  )
                ],
              ),
              Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: MyColors.primary,
                ),
                child: MyText(
                  title: "متابعة",
                  color: MyColors.blackOpacity,
                  size: 11,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
