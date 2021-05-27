part of 'SuccessActiveWidgetsImports.dart';

class BuildConfirmPay extends StatelessWidget {
  final SuccessfullyActiveData successfullyActiveData;

  BuildConfirmPay({required this.successfullyActiveData});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericCubit<bool>, GenericState<bool>>(
      bloc: successfullyActiveData.termCubit,
      builder: (_, state) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 30),
          child:  Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Checkbox(
                value: state.data,
                onChanged: (val) =>
                    successfullyActiveData.termCubit.onUpdateData(!state.data),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    MyText(
                      title: " للموافقه :",
                      color: MyColors.white,
                      size: 13,
                    ),
                    MyText(
                      title:
                      "خصم رسوم الاشتراك السنوية 600 ريال وخصم رسوم فحص السجل التجاري 10 ريال",
                      color: MyColors.white,
                      size: 13,
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
