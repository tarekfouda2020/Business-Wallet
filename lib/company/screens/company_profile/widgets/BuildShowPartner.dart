part of 'CompProfileWidgetsImports.dart';

class BuildShowPartner extends StatelessWidget {
  final CompanyProfileData companyProfileData;

  BuildShowPartner({required this.companyProfileData});

  @override
  Widget build(BuildContext context) {
    var company = context.read<UserCubit>().state.model.companyModel;

    return BlocBuilder<GenericCubit<bool>, GenericState<bool>>(
      bloc: companyProfileData.partnersCubit,
      builder: (_, state) {
        return Column(
          children: [
            BuildDropItem(
              title: "الشركاء",
              genericCubit: companyProfileData.partnersCubit,
            ),
            Visibility(
              visible: state.data,
              child: Visibility(
                visible: company!.partnersKayan!.isEmpty,
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  child: MyText(
                    title: "لا يوجد شركاء",
                    size: 12,
                    color: MyColors.white,
                  ),
                ),
                replacement: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: company.partnersKayan!.length,
                    itemBuilder: (_, index) {
                      return InkWell(
                        onTap: () => AutoRouter.of(context).push(
                          ImageZoomRoute(
                              images: [company.partnersKayan![index].img!]),
                        ),
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: CachedImage(
                            url: company.partnersKayan![index].img!,
                            haveRadius: false,
                            height: 70,
                            width: 120,
                            borderColor: MyColors.greyWhite,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              replacement: Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
              ),
            ),
          ],
        );
      },
    );
  }
}
