part of 'CompConversationWidgetImports.dart';

class BuildConversationItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 7),
      margin: const EdgeInsets.symmetric(vertical: 7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: MyColors.greyWhite),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CachedImage(
            url:
                "https://www.ibelieveinsci.com/wp-content/uploads/GettyImages-498928946-59cd1dd3af5d3a0011d3a87e.jpg",
            width: 65,
            height: 65,
            haveRadius: false,
            boxShape: BoxShape.circle,
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      MyText(
                        title: "اسم مستخدم",
                        size: 11,
                        color: MyColors.white,
                      ),
                      Spacer(),
                      MyText(
                        title: "10/20/2020",
                        size: 10,
                        color: MyColors.white,
                      ),

                    ],
                  ),
                  MyText(
                    title: "تم",
                    size: 10,
                    color: MyColors.white,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
