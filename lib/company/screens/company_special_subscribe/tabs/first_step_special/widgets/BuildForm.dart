part of 'FisrtStepSpecialWidgetImports.dart';

class BuildForm extends StatelessWidget {
  final FirstStepSpecialData firstStepSpecialData;

  const BuildForm({required this.firstStepSpecialData});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BuildFormText(text: "تاريخ البداية"),
        BlocBuilder<GenericCubit<String>, GenericState<String>>(
          bloc: firstStepSpecialData.dateCubit,
          builder: (context, state) {
            return InkWellTextField(
              controller: firstStepSpecialData.startDate,
              margin: const EdgeInsets.symmetric(vertical: 10),
              hint: "تاريخ البداية",
              onTab: () => firstStepSpecialData.getDatePicker(context),
              // onTab: (){},
              validate: (value) => value!.validatePhone(context),
              icon: Icon(
                Icons.calendar_today_outlined,
                color: MyColors.white,
              ),
            );
          },
        ),
        BuildFormText(text: "مدة الترقية"),
        DropdownTextField<DropDownModel>(
          dropKey: firstStepSpecialData.duration,
          label: "مدة الترقية",
          margin: const EdgeInsets.symmetric(vertical: 10),
          onChange: firstStepSpecialData.changeDuration,
          validate: (DropDownModel value) => value.validateDropDown(context),
          // finData: (filter) async =>
          // await CustomerRepository(context).getCountries(),
        ),
        BuildFormText(text: "المنطقة"),
        DropdownTextField<DropDownModel>(
          dropKey: firstStepSpecialData.region,
          label: "المنطقة",
          margin: const EdgeInsets.symmetric(vertical: 10),
          onChange: firstStepSpecialData.changeRegion,
          validate: (DropDownModel value) => value.validateDropDown(context),
          // finData: (filter) async =>
          // await CustomerRepository(context).getCountries(),
        ),
        BuildFormText(text: "تحديد العملاء المهتمين ب"),
        DropdownTextField<DropDownModel>(
          dropKey: firstStepSpecialData.interest,
          label: "تحديد الاقسام",
          margin: const EdgeInsets.symmetric(vertical: 10),
          onChange: firstStepSpecialData.changeInterest,
          validate: (DropDownModel value) => value.validateDropDown(context),
          // finData: (filter) async =>
          // await CustomerRepository(context).getCountries(),
        ),
      ],
    );
  }
}
