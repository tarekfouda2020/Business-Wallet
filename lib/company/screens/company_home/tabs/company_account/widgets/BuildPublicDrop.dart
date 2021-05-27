part of 'CompAccountWidgetsImports.dart';

class BuildPublicDrop extends StatelessWidget {
  final CompanyAccountData companyAccountData;

  BuildPublicDrop({required this.companyAccountData});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericCubit<bool>, GenericState<bool>>(
      bloc: companyAccountData.closedPublicDrop,
      builder: (_, state) {
        return Column(
          children: [
            BuildDropItem(
              title: "خصائص عامة",
              genericCubit: companyAccountData.closedPublicDrop,
            ),
            Visibility(
              visible: state.data,
              child: BuildPublicData(
                companyAccountData: companyAccountData,
              ),
              replacement: Container(),
            ),
          ],
        );
      },
    );
  }
}
