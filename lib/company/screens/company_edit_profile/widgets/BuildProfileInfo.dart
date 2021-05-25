part of 'EditProfileWidgetsImports.dart';

class BuildProfileInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: CachedImage(
            url:
                "https://www.ibelieveinsci.com/wp-content/uploads/GettyImages-498928946-59cd1dd3af5d3a0011d3a87e.jpg",
            borderRadius: BorderRadius.circular(10),
            width: MediaQuery.of(context).size.width,
            height: 150,
          ),
        ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
        child:   Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: MyColors.primary),
                  shape: BoxShape.circle),
              padding: const EdgeInsets.all(5),
              child: CachedImage(
                url:
                "https://www.ibelieveinsci.com/wp-content/uploads/GettyImages-498928946-59cd1dd3af5d3a0011d3a87e.jpg",
                boxShape: BoxShape.circle,
                haveRadius: false,
                width: 60,
                height: 60,
                borderColor: MyColors.white,
                alignment: Alignment.center,
                child: Icon(
                  Icons.camera_alt,
                  color: MyColors.white,
                  size: 25,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            MyText(
              title: "اسم",
              size: 13,
            ),
            Spacer(),
            InkWell(
              onTap: () =>
                  AutoRouter.of(context).push(CompanyEditActivityRoute()),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: MyColors.primary,
                ),
                padding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  children: [
                    Icon(
                      Icons.settings,
                      color: MyColors.darken,
                      size: 23,
                    ),
                    MyText(
                      title: " تعديل النشاطات",
                      size: 10,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      )
      ],
    );
  }
}
