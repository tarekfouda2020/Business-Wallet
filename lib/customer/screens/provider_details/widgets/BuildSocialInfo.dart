part of 'ProviderDetailsWidgetsImports.dart';

class BuildSocialInfo extends StatelessWidget {
  final ProviderDetailsData providerDetailsData;
  const BuildSocialInfo({required this.providerDetailsData});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericCubit<bool>, GenericState<bool>>(
      bloc: providerDetailsData.socialCubit,
      builder: (_, state){
        return Column(
          children: [
            BuildTitle(
              title: "روابط التواصل الإجتماعي",
              onTap: ()=> providerDetailsData.socialCubit.onUpdateData(!state.data),
              open: state.data,
            ),
            Visibility(
              visible: state.data,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BuildSocialItem(image: Res.wha),
                    BuildSocialItem(image: Res.facebook),
                    BuildSocialItem(image: Res.twitter),
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
