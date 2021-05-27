part of 'CompProfileWidgetsImports.dart';

class BuildContactDrop extends StatelessWidget {
  final CompanyProfileData companyProfileData;

  BuildContactDrop({required this.companyProfileData});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericCubit<bool>, GenericState<bool>>(
      bloc: companyProfileData.contactDropCubit,
      builder: (_, state) {
        return Column(
          children: [
            BuildDropItem(
                title: "معلومات التواصل",
                genericCubit: companyProfileData.contactDropCubit),
            Visibility(
              visible: state.data,
              child: BuildContactData(),
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
