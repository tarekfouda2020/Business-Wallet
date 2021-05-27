part of 'CompAccountWidgetsImports.dart';

class BuildProfileCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 110,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        color: MyColors.black,
        alignment: Alignment.center,

        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: MyColors.primary),),
              child: CachedImage(
                url:
                    "https://www.ibelieveinsci.com/wp-content/uploads/GettyImages-498928946-59cd1dd3af5d3a0011d3a87e.jpg",
                haveRadius: false,
                boxShape: BoxShape.circle,

                width: 50,
                height: 50,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            MyText(
              title: "اسم العميل",
              size: 13,
              color: MyColors.white,
            ),
            Spacer(),
            InkWell(
              onTap: () => AutoRouter.of(context).push(CompanyProfileRoute()),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                decoration: BoxDecoration(
                  color: MyColors.primary,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: MyText(
                  title: "الصفحة الشخصية",
                  color: MyColors.blackOpacity,
                  size: 10,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
