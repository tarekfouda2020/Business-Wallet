part of 'AddBranchImports.dart';

class AddBranchData {
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GlobalKey<CustomButtonState> btnKey = new GlobalKey();

  final GenericCubit<String?> fromCubit = new GenericCubit(null);
  final GenericCubit<String?> toCubit = new GenericCubit(null);
  final LocationCubit locationCubit = LocationCubit();

  final TextEditingController branchLocation = new TextEditingController();
  final TextEditingController branchPhone = new TextEditingController();
  final TextEditingController workHoursFrom = new TextEditingController();
  final TextEditingController workHoursTo = new TextEditingController();
  final TextEditingController branchStatus = new TextEditingController();

  String? lat;
  String? lng;

  DropDownModel? stateModel;

  onStateChanged(DropDownModel? model) {
    if (model != null) {
      stateModel = model;
    }
  }

  setFromTime(BuildContext context) {
    AdaptivePicker.timePicker(
      context: context,
      title: "ساعات العمل من",
      onConfirm: (date) {
        if (date != null) {
          String time = DateFormat("HH:mm").format(date);
          fromCubit.onUpdateData(time);
        }
      },
    );
  }

  setToTime(BuildContext context) {
    AdaptivePicker.timePicker(
      context: context,
      title: "ساعات العمل الي",
      onConfirm: (date) {
        if (date != null) {
          String time = DateFormat("HH:mm").format(date);
          toCubit.onUpdateData(time);
        }
      },
    );
  }

  setAddBranch(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      btnKey.currentState!.animateForward();
      AddBranchModel model = new AddBranchModel(
          id: 0,
          phone: branchPhone.text,
          address: branchLocation.text,
          lat: lat,
          lng: lng,
          fromHour: workHoursFrom.text,
          toHour: workHoursTo.text,
          code: "+966",
          status: stateModel!.id == 1 ? true : false);
      var data = await CompanyRepository(context).addBranch(model);
      if (data != null) {
        var branCubit = context.read<BranchesCubit>();
        branCubit.state.branches.add(data);
        branCubit.onUpdateData(branCubit.state.branches);
        AutoRouter.of(context).pop();
      }
      btnKey.currentState!.animateReverse();
    }
  }
}
