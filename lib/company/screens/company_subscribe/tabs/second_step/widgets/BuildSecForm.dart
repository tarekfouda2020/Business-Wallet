part of 'SecondStepWidgetsImports.dart';

class BuildSecForm extends StatelessWidget {
  final CompanySubscribeData companySubscribeData;

  BuildSecForm({required this.companySubscribeData});

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
                      controller: companySubscribeData.views,
                      margin: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 5),
                      action: TextInputAction.next,
                      type: TextInputType.emailAddress,
                      onChange: (value) =>
                          companySubscribeData.getCostSubscribe(context),
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
                    BlocConsumer<GenericCubit<int>, GenericState<int>>(
                      bloc: companySubscribeData.durationCubit,
                      listener: (_, state) {
                        companySubscribeData.duration.text = DurationModel()
                            .duration
                            .firstWhere((e) => e.id == state.data)
                            .name!;
                        companySubscribeData.getCostSubscribe(context);

                      },
                      builder: (_, state) {
                        return InkWellTextField(
                          icon: Icon(Icons.arrow_drop_down),
                          controller: companySubscribeData.duration,
                          validate: (value) => value!.validateEmpty(context),
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          onTab: () {
                            DownBottomSheet(
                              context: context,
                              title: '',
                              onTab: (name, id) => companySubscribeData
                                  .selectDuration(id, context),
                              data: DurationModel().duration,
                            ).show();
                          },
                          hint: 'المدة الزمنية للمشاهدة',
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        BuildFormText(text: "تاريخ البداية"),
        BlocConsumer<GenericCubit, GenericState>(
          bloc: companySubscribeData.dateCubit,
          listener: (_, state) {
            companySubscribeData.startDate.text = state.data;
          },
          builder: (_, state) {
            return InkWellTextField(
              hint: "تاريخ البداية",
              controller: companySubscribeData.startDate,
              icon: Icon(
                Icons.calendar_today_outlined,
              ),
              margin: const EdgeInsets.symmetric(vertical: 10),
              validate: (value) => value!.validateEmpty(context),
              onTab: () => companySubscribeData.getDatePicker(context),
            );
          },
        ),
        BuildFormText(text: "المنطقة"),
        DropdownTextField<CitiesModel>(
          dropKey: companySubscribeData.city,
          label: "المنطقة",
          selectedItem: companySubscribeData.regionId,
          margin: const EdgeInsets.symmetric(vertical: 10),
          validate: (CitiesModel value) => value.validateDropDown(context),
          onChange: companySubscribeData.changeRegion,
          useName: true,
          finData: (filter) async =>
              await CompanyRepository(context).getCompCities(3),
        ),
        BuildFormText(text: "تحديد العملاء المهتمين ب"),
        DropdownTextField<DropDownSelected>(
          dropKey: companySubscribeData.subField,
          hint: "تحديد الاقسام",
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          validate: (DropDownSelected value) => value.validateDropDown(context),
          onChange: (model) =>
              companySubscribeData.onSelectPeopleInterest(model, context),
          useName: true,
          finData: (filter) async => await CompanyRepository(context)
              .getPeopleInterests(refresh: false),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: BlocBuilder<GenericCubit<List<DropDownSelected>>,
              GenericState<List<DropDownSelected>>>(
            bloc: companySubscribeData.subFieldCubit,
            builder: (_, state) {
              return Wrap(
                alignment: WrapAlignment.start,
                runSpacing: 10,
                spacing: 10,
                runAlignment: WrapAlignment.start,
                children: List.generate(
                  state.data.length,
                  (index) {
                    return Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: MyColors.secondary,
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          MyText(
                            title: "${state.data[index].name}",
                            size: 11,
                            color: MyColors.white,
                          ),
                          IconButton(
                            onPressed: () =>
                                companySubscribeData.onDeletePeopleInterest(
                                    context, state.data[index], index),
                            icon: Icon(
                              MdiIcons.closeCircle,
                              size: 23,
                              color: MyColors.primary,
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
        BuildFormText(text: "الجنس"),
        BlocConsumer<GenericCubit<int>, GenericState<int>>(
          bloc: companySubscribeData.genderCubit,
          listener: (_, state) {
            companySubscribeData.gender.text = GenderModel()
                .genders
                .firstWhere((e) => e.id == state.data)
                .name!;
          },
          builder: (_, state) {
            return InkWellTextField(
              icon: Icon(Icons.arrow_drop_down),
              controller: companySubscribeData.gender,
              validate: (value) => value!.validateEmpty(context),
              margin: const EdgeInsets.symmetric(vertical: 10),
              onTab: () => DownBottomSheet(
                context: context,
                title: '',
                onTab: (name, id) =>
                    companySubscribeData.selectType(id, context),
                data: GenderModel().genders,
              ).show(),
              hint: 'الجنس',
            );
          },
        ),
        BuildFormText(text: "السكن"),
        BlocConsumer<GenericCubit<String>, GenericState<String>>(
          bloc: companySubscribeData.livingCubit,
          listener: (_, state) {
            companySubscribeData.living.text = LivingModel()
                .living
                .firstWhere((e) => e.id == state.data)
                .name!;
          },
          builder: (_, state) {
            return InkWellTextField(
              icon: Icon(Icons.arrow_drop_down),
              controller: companySubscribeData.living,
              validate: (value) => value!.validateEmpty(context),
              margin: const EdgeInsets.symmetric(vertical: 10),
              onTab: () => DownBottomSheet(
                      context: context,
                      title: 'السكن',
                      onTab: (name, id) =>
                          companySubscribeData.selectLiving(id, context),
                      data: LivingModel().living)
                  .show(),
              hint: 'السكن',
            );
          },
        ),
        BuildFormText(text: "مستوي التعليم"),
        BlocConsumer<GenericCubit<String>, GenericState<String>>(
          bloc: companySubscribeData.educationCubit,
          listener: (_, state) {
            companySubscribeData.educationLevel.text = EducationModel()
                .education
                .firstWhere((e) => e.id == state.data)
                .name!;
          },
          builder: (_, state) {
            return InkWellTextField(
              icon: Icon(Icons.arrow_drop_down),
              controller: companySubscribeData.educationLevel,
              validate: (value) => value!.validateEmpty(context),
              margin: const EdgeInsets.symmetric(vertical: 10),
              onTab: () => DownBottomSheet(
                      context: context,
                      title: 'مستوي التعليم',
                      onTab: (name, id) =>
                          companySubscribeData.selectEducation(id, context),
                      data: EducationModel().education)
                  .show(),
              hint: 'مستوي التعليم',
            );
          },
        ),
        BuildFormText(text: "افراد الاسره"),
        BlocConsumer<GenericCubit<String>, GenericState<String>>(
          bloc: companySubscribeData.familyCubit,
          listener: (_, state) {
            companySubscribeData.familyMembers.text = FamilyMemberModel()
                .family
                .firstWhere((e) => e.id == state.data)
                .name!;
          },
          builder: (_, state) {
            return InkWellTextField(
              icon: Icon(Icons.arrow_drop_down),
              controller: companySubscribeData.familyMembers,
              validate: (value) => value!.validateEmpty(context),
              margin: const EdgeInsets.symmetric(vertical: 10),
              onTab: () => DownBottomSheet(
                      context: context,
                      title: 'افراد الاسره',
                      onTab: (name, id) =>
                          companySubscribeData.selectFamily(id, context),
                      data: FamilyMemberModel().family)
                  .show(),
              hint: 'افراد الاسره',
            );
          },
        ),
        BuildFormText(text: "الفئة العمرية"),
        BlocConsumer<GenericCubit<String>, GenericState<String>>(
          bloc: companySubscribeData.ageCubit,
          listener: (_, state) {
            companySubscribeData.age.text =
                AgeModel().age.firstWhere((e) => e.id == state.data).name!;
          },
          builder: (_, state) {
            return InkWellTextField(
              icon: Icon(Icons.arrow_drop_down),
              controller: companySubscribeData.age,
              validate: (value) => value!.validateEmpty(context),
              margin: const EdgeInsets.symmetric(vertical: 10),
              onTab: () => DownBottomSheet(
                      context: context,
                      title: 'الفئة العمرية',
                      onTab: (name, id) =>
                          companySubscribeData.selectAge(id, context),
                      data: AgeModel().age)
                  .show(),
              hint: 'الفئة العمرية',
            );
          },
        ),
        BuildFormText(text: "متوسط الدخل في الشهر"),
        BlocConsumer<GenericCubit<String>, GenericState<String>>(
          bloc: companySubscribeData.incomeCubit,
          listener: (_, state) {
            companySubscribeData.averageSalary.text = IncomeModel()
                .income
                .firstWhere((e) => e.id == state.data)
                .name!;
          },
          builder: (_, state) {
            return InkWellTextField(
              icon: Icon(Icons.arrow_drop_down),
              controller: companySubscribeData.averageSalary,
              validate: (value) => value!.validateEmpty(context),
              margin: const EdgeInsets.symmetric(vertical: 10),
              onTab: () => DownBottomSheet(
                      context: context,
                      title: 'متوسط الدخل في الشهر',
                      onTab: (name, id) =>
                          companySubscribeData.selectIncome(id, context),
                      data: IncomeModel().income)
                  .show(),
              hint: 'متوسط الدخل في الشهر',
            );
          },
        ),
      ],
    );
  }
}
