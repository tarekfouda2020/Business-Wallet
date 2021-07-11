part of 'AddBranchImports.dart';

class BuildAddForm extends StatelessWidget {
  final EditBranchData branchData;

  const BuildAddForm({required this.branchData});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: branchData.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BuildFormText(text: "الموقع"),
          BlocConsumer<LocationCubit, LocationState>(
            bloc: branchData.locationCubit,
            listener: (context, state) {
              branchData.branchLocation.text = state.model!.address;
              branchData.lat = state.model!.lat;
              branchData.lng = state.model!.lng;
            },
            builder: (context, state) {
              return InkWellTextField(
                hint: " من فضلك ادخل الموقع",
                controller: branchData.branchLocation,
                icon: Icon(Icons.location_on_outlined),
                margin: const EdgeInsets.symmetric(vertical: 10),
                validate: (value) => value!.validateEmpty(context),
                onTab: () => Utils.navigateToLocationAddress(
                    context, branchData.locationCubit),
              );
            },
          ),
          BuildFormText(text: "رقم الهاتف"),
          Row(
            children: [
              Expanded(
                flex: 4,
                child: IconTextFiled(
                  hint: "رقم الهاتف",
                  controller: branchData.branchPhone,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  action: TextInputAction.next,
                  suffixIcon: Icon(
                    Icons.edit,
                    size: 20,
                  ),
                  type: TextInputType.phone,
                  validate: (value) => value!.validatePhone(context),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: MyColors.black,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                        minHeight: 30,
                        maxHeight: 50,
                        minWidth: double.infinity,
                        maxWidth: double.infinity),
                    child: MyText(
                      alien: TextAlign.start,
                      title: "+966",
                      color: MyColors.white,
                      size: 13,
                    ),
                  ),
                ),
              )
            ],
          ),
          BuildFormText(text: "ساعات العمل من"),
          BlocConsumer<GenericCubit<String?>, GenericState<String?>>(
            bloc: branchData.fromCubit,
            listener: (_,state){
              if (state.data!=null) {
                branchData.workHoursFrom.text=state.data!;
              }
            },
            builder: (context, state) {
              return InkWellTextField(
                hint: "ساعات العمل من",
                controller: branchData.workHoursFrom,
                type: TextInputType.text,
                icon: Icon(
                  Icons.edit,
                  size: 20,
                ),
                margin: const EdgeInsets.symmetric(vertical: 10),
                validate: (value) => value!.validateEmpty(context),
                onTab: () => branchData.setFromTime(context),
              );
            },
          ),
          BuildFormText(text: "ساعات العمل الي"),
          BlocConsumer<GenericCubit<String?>, GenericState<String?>>(
            bloc: branchData.toCubit,
            listener: (_,state){
              if (state.data!=null) {
                branchData.workHoursTo.text=state.data!;
              }
            },
            builder: (context, state) {
              return InkWellTextField(
                hint: "ساعات العمل الي",
                controller: branchData.workHoursTo,
                type: TextInputType.text,
                icon: Icon(
                  Icons.edit,
                  size: 20,
                ),
                margin: const EdgeInsets.symmetric(vertical: 10),
                validate: (value) => value!.validateEmpty(context),
                onTab: () => branchData.setToTime(context),
              );
            },
          ),
          BuildFormText(text: "الحالة"),
          DropdownTextField<DropDownModel>(
            hint: "الحالة",
            selectedItem: branchData.stateModel,
            data: [
              DropDownModel(id: 1, name: "فعال"),
              DropDownModel(id: 2, name: "غير فعال")
            ],
            onChange: (model)=> branchData.onStateChanged(model),
            margin: const EdgeInsets.symmetric(vertical: 10),
            validate: (DropDownModel value) => value.validateDropDown(context),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
