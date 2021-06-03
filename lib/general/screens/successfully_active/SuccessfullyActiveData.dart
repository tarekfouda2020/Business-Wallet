part of 'SuccessfullyActiveImports.dart';

class SuccessfullyActiveData {
  final GenericCubit<bool> termCubit = new GenericCubit(false);

  navigateToPayment(BuildContext context, String userId,int id) {
    if (!termCubit.state.data) {
      LoadingDialog.showSimpleToast("هل وافقت علي الشروط والاحكام");
      return;
    }
    AutoRouter.of(context)
        .push(CompanyPaymentRoute(userId: userId, id: id));
  }
}
