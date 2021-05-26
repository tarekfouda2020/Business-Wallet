part of 'SecondStepWidgetsImports.dart';

class BuildSecForm extends StatelessWidget {
  final SecondStepData secondStepData;

  BuildSecForm({required this.secondStepData});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BuildFormText(text: "عدد المشاهدات المطلوب"),
                    LabelTextField(
                      hint: "عدد المشاهدات المطلوب",
                      controller: secondStepData.views,
                      margin: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 5),
                      action: TextInputAction.next,
                      type: TextInputType.emailAddress,
                      validate: (value) => value!.validateEmpty(context),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BuildFormText(text: "المدة الزمنية للمشاهدة"),
                    DropdownTextField<DropDownModel>(
                      dropKey: secondStepData.duration,
                      label: "المدة بالثواني",
                      margin: EdgeInsets.symmetric(vertical: 10),
                      onChange: secondStepData.changeDuration,
                      validate: (DropDownModel value) =>
                          value.validateDropDown(context),
                      // finData: (filter) async =>
                      // await CustomerRepository(context).getCountries(),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        BuildFormText(text: "تاريخ البداية"),
        BlocBuilder<GenericCubit<String>, GenericState<String>>(
          bloc: secondStepData.dateCubit,
          builder: (context, state) {
            return InkWellTextField(
              controller: secondStepData.startDate,
              margin: const EdgeInsets.symmetric(vertical: 10),
              hint: "تاريخ البداية",
              onTab: () => secondStepData.getDatePicker(context),
              // onTab: (){},
              validate: (value) => value!.validatePhone(context),
              icon: Icon(
                Icons.calendar_today_outlined,
                color: MyColors.white,
              ),
            );
          },
        ),
        BuildFormText(text: "المنطقة"),
        DropdownTextField<DropDownModel>(
          dropKey: secondStepData.region,
          label: "المنطقة",
          margin: const EdgeInsets.symmetric(vertical: 10),
          onChange: secondStepData.changeRegion,
          validate: (DropDownModel value) => value.validateDropDown(context),
          // finData: (filter) async =>
          // await CustomerRepository(context).getCountries(),
        ),
        BuildFormText(text: "تحديد العملاء المهتمين ب"),
        DropdownTextField<DropDownModel>(
          dropKey: secondStepData.interest,
          label: "تحديد الاقسام",
          margin: const EdgeInsets.symmetric(vertical: 10),
          onChange: secondStepData.changeInterest,
          validate: (DropDownModel value) => value.validateDropDown(context),
          // finData: (filter) async =>
          // await CustomerRepository(context).getCountries(),
        ),
        BuildFormText(text: "الجنس"),
        BlocConsumer<GenericCubit<int>, GenericState<int>>(
          bloc: secondStepData.genderCubit,
          listener: (_, state) {
            secondStepData.gender.text = GenderModel()
                .genders
                .firstWhere((e) => e.id == state.data)
                .name!;
          },
          builder: (_, state) {
            return InkWellTextField(
              icon: Icon(Icons.arrow_drop_down),
              controller: secondStepData.gender,
              validate: (value) => value!.validatePhone(context),
              margin: const EdgeInsets.symmetric(vertical: 10),
              onTab: () => DownBottomSheet(
                context: context,
                title: '',
                onTab: (name, id) => secondStepData.selectType(id, context),
                data: GenderModel().genders,
              ).show(),
              hint: 'الجنس',
            );
          },
        ),
        BuildFormText(text: "السكن"),
        DropdownTextField<DropDownModel>(
          dropKey: secondStepData.living,
          label: "السكن",
          margin: const EdgeInsets.symmetric(vertical: 10),
          onChange: secondStepData.changeLiving,
          validate: (DropDownModel value) => value.validateDropDown(context),
          // finData: (filter) async =>
          // await CustomerRepository(context).getCountries(),
        ),
        BuildFormText(text: "مستوي التعليم"),
        DropdownTextField<DropDownModel>(
          dropKey: secondStepData.education,
          label: "مستوي التعليم",
          margin: const EdgeInsets.symmetric(vertical: 10),
          onChange: secondStepData.changeEducation,
          validate: (DropDownModel value) => value.validateDropDown(context),
          // finData: (filter) async =>
          // await CustomerRepository(context).getCountries(),
        ),
        BuildFormText(text: "افراد الاسره"),
        DropdownTextField<DropDownModel>(
          dropKey: secondStepData.familyMembers,
          label: "افراد الاسره",
          margin: const EdgeInsets.symmetric(vertical: 10),
          onChange: secondStepData.changeFamilyMember,
          validate: (DropDownModel value) => value.validateDropDown(context),
          // finData: (filter) async =>
          // await CustomerRepository(context).getCountries(),
        ),
        BuildFormText(text: "الفئة العمرية"),
        DropdownTextField<DropDownModel>(
          dropKey: secondStepData.ages,
          label: "الفئة العمرية",
          margin: const EdgeInsets.symmetric(vertical: 10),
          onChange: secondStepData.changeAge,
          validate: (DropDownModel value) => value.validateDropDown(context),
          // finData: (filter) async =>
          // await CustomerRepository(context).getCountries(),
        ),
        BuildFormText(text: "متوسط الدخل في الشهر"),
        DropdownTextField<DropDownModel>(
          dropKey: secondStepData.salary,
          label: "المتوسط الدخل في الشهر",
          margin: const EdgeInsets.symmetric(vertical: 10),
          onChange: secondStepData.changeSalary,
          validate: (DropDownModel value) => value.validateDropDown(context),
          // finData: (filter) async =>
          // await CustomerRepository(context).getCountries(),
        ),
      ],
    );
  }
}
