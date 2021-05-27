part of 'CompAccountWidgetsImports.dart';

class BuildAccountDrop extends StatelessWidget {
  final CompanyAccountData companyAccountData;

  BuildAccountDrop({required this.companyAccountData});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericCubit<bool>, GenericState<bool>>(
      bloc: companyAccountData.closedDrop,
      builder: (_, state) {
        return Column(
          children: [
            BuildDropItem(
              title: "منطقة العميل",
              genericCubit: companyAccountData.closedDrop,
            ),
            Visibility(
              visible: state.data,
              child: BuildCustomerData(),
              replacement: Container(),
            ),
          ],
        );
      },
    );
  }
}
