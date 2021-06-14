part of 'ReconciliationWidgetsImports.dart';
class BuildTerms extends StatelessWidget {
final AccountReconciliationData accountReconciliationData;

  const BuildTerms({required this.accountReconciliationData});
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        BlocBuilder<GenericCubit<bool>, GenericState<bool>>(
          bloc: accountReconciliationData.termsCubit,
          builder: (_, state) {
            return Checkbox(
              value: state.data,
              onChanged: (val) => accountReconciliationData
                  .termsCubit
                  .onUpdateData(!state.data),
              activeColor: MyColors.primary,
            );
          },
        ),
        MyText(
          title:
          "الموافقة علي جميع المعلومات الشخصية والحساب البنكي",
          size: 11,
          color: MyColors.primary,
        ),
      ],
    );
  }
}
