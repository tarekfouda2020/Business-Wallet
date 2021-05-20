part of 'ProviderDetailsWidgetsImports.dart';

class BuildProviderDescription extends StatelessWidget {
  final ProviderDetailsData providerDetailsData;

  const BuildProviderDescription({required this.providerDetailsData});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericCubit<bool>, GenericState<bool>>(
      bloc: providerDetailsData.descCubit,
      builder: (context, state) {
        return Column(
          children: [
            BuildTitle(
              title: "وصف الكيان",
              open: state.data,
              onTap: ()=> providerDetailsData.descCubit.onUpdateData(!state.data),
            ),
            Visibility(
              visible: state.data,
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: MyText(
                  title:
                      "وصف الكيان هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق.",
                  size: 10,
                  color: MyColors.grey,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
