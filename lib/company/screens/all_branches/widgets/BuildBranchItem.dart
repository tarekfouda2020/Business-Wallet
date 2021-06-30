part of 'AllBranchesWidgetsImports.dart';

class BuildBranchItem extends StatelessWidget {
  final BranchModel model;
  final AllBranchesData allBranchesData;

  const BuildBranchItem({required this.model, required this.allBranchesData});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: MyColors.darken,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: MyColors.primary.withOpacity(.3),
            spreadRadius: .5,
            blurRadius: .2,
          ),
        ],
      ),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.location_on,
                size: 20,
                color: MyColors.white,
              ),
              SizedBox(width: 5),
              Expanded(
                child: MyText(
                  title: model.address,
                  color: MyColors.primary,
                  size: 10,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                      title: "رقم الجوال :",
                      color: MyColors.white,
                      size: 10,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(width: 5),
                    MyText(
                      title: model.phone,
                      color: MyColors.primary,
                      size: 10,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                      title: "الحالة :",
                      color: MyColors.white,
                      size: 10,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(width: 5),
                    MyText(
                      title: model.statues ? "فعال" : "غير فعال",
                      color: MyColors.primary,
                      size: 10,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                      title: "العمل الي :",
                      color: MyColors.white,
                      size: 10,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(width: 5),
                    MyText(
                      title: model.hourWork,
                      color: MyColors.primary,
                      size: 10,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                      title: "العمل من :",
                      color: MyColors.white,
                      size: 10,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(width: 5),
                    MyText(
                      title: model.hourWork,
                      color: MyColors.primary,
                      size: 10,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
