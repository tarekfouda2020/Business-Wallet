part of 'ProviderDetailsWidgetsImports.dart';

class BuildSocialInfo extends StatelessWidget {
  final ProviderDetailsData providerDetailsData;
  final DetailsModel? detailsModel;

  const BuildSocialInfo(
      {required this.providerDetailsData, required this.detailsModel});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericCubit<bool>, GenericState<bool>>(
      bloc: providerDetailsData.socialCubit,
      builder: (_, state) {
        return Column(
          children: [
            BuildTitle(
              title: "روابط التواصل الإجتماعي",
              onTap: () =>
                  providerDetailsData.socialCubit.onUpdateData(!state.data),
              open: state.data,
            ),
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
                      onTap: () => Utils.launchURL(
                        url: detailsModel!.faceBook,
                      ),
                    ),
                    BuildSocialItem(
                      image: Res.twitter,
                      onTap: () => Utils.launchURL(
                        url: detailsModel!.twitter,
                      ),
                    ),
                    BuildSocialItem(
                      image: Res.instaa,
                      onTap: () => Utils.launchURL(
                        url: detailsModel!.instagram,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
