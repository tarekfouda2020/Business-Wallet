part of 'SuccessActiveWidgetsImports.dart';

class BuildConfirmPay extends StatelessWidget {
  final SuccessfullyActiveData successfullyActiveData;

  BuildConfirmPay({required this.successfullyActiveData});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericCubit<bool>, GenericState<bool>>(
      bloc: successfullyActiveData.termCubit,
      builder: (_, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            children: [
              Checkbox(
                value: state.data,
                onChanged: (val) =>
                    successfullyActiveData.termCubit.onUpdateData(!state.data),
              ),
              Column(
                children: [
                  MyText(
                    title: "للموافقه",
                    color: MyColors.white,
                    size: 11,
                  ),
                  MyText(
                    title: "الشروط والاحكام",
                    color: MyColors.primary,
                    decoration: TextDecoration.underline,
                    size: 11,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
