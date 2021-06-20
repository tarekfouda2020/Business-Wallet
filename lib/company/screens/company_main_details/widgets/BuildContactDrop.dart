part of 'DetailsWidgetsImports.dart';

class BuildContactDrop extends StatelessWidget {
  final CompanyMainDetailsData companyMainDetailsData;
  final DetailsModel? detailsModel;

  BuildContactDrop(
      {required this.companyMainDetailsData, required this.detailsModel});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericCubit<bool>, GenericState<bool>>(
      bloc: companyMainDetailsData.contactDropCubit,
      builder: (_, state) {
        return Column(
          children: [
            BuildDropItem(
              title: "معلومات التواصل",
              genericCubit: companyMainDetailsData.contactDropCubit,
            ),
            Visibility(
              visible: state.data,
              child: BuildContactData(
                companyMainDetailsData: companyMainDetailsData,
                detailsModel: detailsModel,
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
