part of 'DetailsWidgetsImports.dart';

class BuildShowAccreditation extends StatelessWidget {
  final CompanyMainDetailsData companyMainDetailsData;
  final DetailsModel? detailsModel;

  BuildShowAccreditation(
      {required this.companyMainDetailsData, required this.detailsModel});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericCubit<bool>, GenericState<bool>>(
      bloc: companyMainDetailsData.accreditationCubit,
      builder: (_, state) {
        return Column(
          children: [
            BuildDropItem(
                title: "شهادات الاعتماد",
                genericCubit: companyMainDetailsData.accreditationCubit),
            Visibility(
              visible: state.data,
              child: Visibility(
                visible: detailsModel!.accreditationCertificates.isEmpty,
               child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  child: MyText(
                    title: "لا يوجد شهادات",
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
                    itemCount: detailsModel!.accreditationCertificates.length,
                    itemBuilder: (_, index) {
                      return InkWell(
                        onTap: () => AutoRouter.of(context).push(
                          ImageZoomRoute(
                            images: detailsModel!.accreditationCertificates,
                          ),
                        ),
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: CachedImage(
                            url: detailsModel!.accreditationCertificates[index],
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
