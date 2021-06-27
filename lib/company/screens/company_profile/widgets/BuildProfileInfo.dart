part of 'CompProfileWidgetsImports.dart';

class BuildProfileInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var company = context.read<UserCubit>().state.model.companyModel;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: MyColors.primary),
                    shape: BoxShape.circle),
                padding: const EdgeInsets.all(5),
                child: CachedImage(
                  url: company!.img!,
                  boxShape: BoxShape.circle,
                  haveRadius: false,
                  width: 50,
                  height: 50,
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(
                        title: company.kayanName!,
                        size: 10,
                      ),
                      Row(
                        children: [
                          RatingBar.builder(
                            itemCount: 5,
                            allowHalfRating: true,
                            ignoreGestures: true,
                            onRatingUpdate: (double val) {},
                            unratedColor: MyColors.white,
                            itemSize: 13,
                            itemPadding:
                                const EdgeInsets.symmetric(vertical: 7),
                            initialRating: company.rate!.toDouble(),
                            itemBuilder: (_, index) {
                              return Icon(
                                Icons.star,
                                color: MyColors.primary,
                              );
                            },
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          MyText(
                            title: "( ${company.CountRate.toString()} )",
                            size: 8,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: MyColors.black),
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.thumb_up,
                      size: 13,
                      color: MyColors.primary,
                    ),
                  ),
                  MyText(
                    title: "( ${company.countLike.toString()} )",
                    size: 9,
                  )
                ],
              ),
              Spacer(),
              InkWell(
                onTap: () =>
                    AutoRouter.of(context).push(CompanyEditProfileRoute()),
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
                        title: "تعديل",
                        size: 10,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Visibility(
            visible: company.showDescription == true,
            child: MyText(
              title: company.description!,
              size: 10,
              color: MyColors.greyWhite.withOpacity(.9),
            ),
            replacement: Container(),
          ),
        ],
      ),
    );
  }
}
