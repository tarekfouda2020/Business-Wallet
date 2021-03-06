part of 'CompanyBranchesWidgetImports.dart';

class BuildBranchItem extends StatelessWidget {
  final BranchModel model;
  final CompanyBranchesData branchesData;

  const BuildBranchItem({required this.model, required this.branchesData});

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
                  size: 11,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(
                title: "رقم الجوال :",
                color: MyColors.white,
                size: 10,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(width: 5),
              Expanded(
                child: MyText(
                  title: model.phone,
                  color: MyColors.primary,
                  size: 11,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(
                title: "العمل من :",
                color: MyColors.white,
                size: 10,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(width: 5),
              Expanded(
                child: MyText(
                  title: model.hourWork,
                  color: MyColors.primary,
                  size: 11,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(
                title: "العمل الي :",
                color: MyColors.white,
                size: 10,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(width: 5),
              Expanded(
                child: MyText(
                  title: model.hourWorkTo,
                  color: MyColors.primary,
                  size: 11,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(
                title: "الحالة :",
                color: MyColors.white,
                size: 10,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(width: 5),
              Expanded(
                child: MyText(
                  title: model.statues ? "فعال" : "غير فعال",
                  color: MyColors.primary,
                  size: 11,
                  fontWeight: FontWeight.w700,
                ),
              ),
              OpenContainer(
                closedColor: Colors.transparent,
                closedElevation: 0,
                openBuilder: (context, action) {
                  return BlocProvider.value(
                    value: branchesData.branchesCubit,
                    child: EditBranch(model: model),
                  );
                },
                closedBuilder: (context, action) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: Icon(
                      Icons.edit,
                      size: 20,
                      color: MyColors.primary,
                    ),
                  );
                },
              ),
              SizedBox(width: 5),
              InkWell(
                onTap: () => branchesData.removeBranch(context, model),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Icon(
                    Icons.close,
                    size: 22,
                    color: MyColors.primary,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
