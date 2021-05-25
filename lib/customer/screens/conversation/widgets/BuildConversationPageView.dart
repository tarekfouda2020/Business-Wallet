part of 'ConversationWidgetsImports.dart';

class BuildConversationPageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          color: MyColors.black,
          child: Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(Res.pic),
                      fit: BoxFit.fill,
                    )),
              ),
              SizedBox(width: 10,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyText(
                          title: "AutoCode",
                          size: 10,
                          color: MyColors.white,
                        ),
                        MyText(
                          title: "pm 05:39 25/5/2021",
                          size: 10,
                          color: MyColors.greyWhite.withOpacity(0.7),
                        ),
                      ],
                    ),
                    MyText(
                      title: "new",
                      size: 10,
                      color: MyColors.greyWhite.withOpacity(0.7),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
