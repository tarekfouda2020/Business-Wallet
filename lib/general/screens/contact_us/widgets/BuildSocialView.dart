part of 'ContactUsWidgetsImports.dart';

class BuildSocialView extends StatelessWidget {
  final ContactUsData contactUsData;

  const BuildSocialView({required this.contactUsData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyText(
          title: "وسائل التواصل الاجتماعي",
          size: 13,
          color: MyColors.primary,
        ),
        BlocBuilder<GenericCubit<SocialModel?>, GenericState<SocialModel?>>(
          bloc: contactUsData.socialCubit,
          builder: (_, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BuildSocialItem(
                  iconData: MdiIcons.facebook,
                  onTap: () => Utils.launchURL(url: state.data!.facebook),
                ),
                BuildSocialItem(
                  iconData: MdiIcons.whatsapp,
                  onTap: () => Utils.launchURL(url: state.data!.whatsup),
                ),
                BuildSocialItem(
                  iconData: MdiIcons.twitter,
                  onTap: () => Utils.launchURL(url: state.data!.twitter),
                ),
                BuildSocialItem(
                  iconData: MdiIcons.instagram,
                  onTap: () => Utils.launchURL(url: state.data!.instgram),
                ),
              ],
            );
          },
        )
      ],
    );
  }
}
