part of 'CompProfileWidgetsImports.dart';

class BuildInterestDrop extends StatelessWidget {
  final CompanyProfileData companyProfileData;

  BuildInterestDrop({required this.companyProfileData});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericCubit<bool>, GenericState<bool>>(
      bloc: companyProfileData.interestDropCubit,
      builder: (_, state) {
        return Column(
          children: [
            BuildDropItem(
                title: "اهتمامات العملاء التي ترغب بالظهور بها",
                onTap: () => companyProfileData.interestDropCubit
                    .onUpdateData(!state.data),
                genericCubit: companyProfileData.interestDropCubit),
            Visibility(
              visible: state.data,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BuildInterestItem(
                    title: "اعلام وتسويق",
                  ),
                  BuildInterestItem(
                    title: "خدمات ادارية وكوادر بشرية",
                  ),
                  BuildInterestItem(
                    title: "استشارات",
                  ),
                ],
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
