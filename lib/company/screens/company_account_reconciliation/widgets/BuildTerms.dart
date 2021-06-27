part of 'CompAccountWidgetsImports.dart';

class BuildTerms extends StatelessWidget {
final CompAccountReconciliationData compAccountReconciliationData;

  const BuildTerms({required this.compAccountReconciliationData});
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        BlocBuilder<GenericCubit<bool>, GenericState<bool>>(
          bloc: compAccountReconciliationData.termsCubit,
          builder: (_, state) {
            return Checkbox(
              value: state.data,
              onChanged: (val) => compAccountReconciliationData
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
