part of 'DetailsWidgetsImports.dart';

class BuildSocialDrop extends StatelessWidget {
  final CompanyMainDetailsData companyMainDetailsData;
  final DetailsModel? detailsModel;

  BuildSocialDrop(
      {required this.companyMainDetailsData, required this.detailsModel});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericCubit<bool>, GenericState<bool>>(
      bloc: companyMainDetailsData.socialDropCubit,
      builder: (_, state) {
        return Column(
          children: [
            BuildDropItem(
                title: " روابط التواصل الاجتماعي",
                genericCubit: companyMainDetailsData.socialDropCubit),
            Visibility(
              visible: state.data,
              child: Container(
                margin:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BuildSocialItem(
                      image: Res.wha,
                      onTap: () => Utils.launchWhatsApp(
                        detailsModel!.whatsUp,
                      ),
                    ),
                    BuildSocialItem(
                      image: Res.facebook,
                      onTap: () => Utils.launchWhatsApp(
                        detailsModel!.faceBook,
                      ),
                    ),
                    BuildSocialItem(
                      image: Res.twitter,
                      onTap: () => Utils.launchWhatsApp(
                        detailsModel!.twitter,
                      ),
                    ),
                  ],
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
