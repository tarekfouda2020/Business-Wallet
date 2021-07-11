part of 'CompProfileWidgetsImports.dart';

class BuildSocialDrop extends StatelessWidget {
  final CompanyProfileData companyProfileData;

  BuildSocialDrop({required this.companyProfileData});

  @override
  Widget build(BuildContext context) {
    var company = context.read<UserCubit>().state.model.companyModel;

    return BlocBuilder<GenericCubit<bool>, GenericState<bool>>(
      bloc: companyProfileData.socialDropCubit,
      builder: (_, state) {
        return Column(
          children: [
            BuildDropItem(
                title: "روابط التواصل الاجتماعي",
                genericCubit: companyProfileData.socialDropCubit),
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
                      onTap: () => Utils.launchURL(
                        url: "https://api.whatsapp.com/send?phone=+966${company?.whats}",
                      ),
                    ),
                    BuildSocialItem(
                      image: Res.facebook,
                      onTap: () => Utils.launchURL(
                        url: "${company?.facebook}",
                      ),
                    ),
                    BuildSocialItem(
                      image: Res.twitter,
                      onTap: () => Utils.launchURL(
                        url: "${company?.twitter}",
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
