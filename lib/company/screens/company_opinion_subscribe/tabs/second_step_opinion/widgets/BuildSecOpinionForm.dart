part of 'SecStepOpinionWidgetsImports.dart';

class BuildSecOpinionForm extends StatelessWidget {
  final CompOpinionSubscribeData compOpinionSubscribeData;

  const BuildSecOpinionForm({required this.compOpinionSubscribeData});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Form(
        key: compOpinionSubscribeData.secFormKey,
        child: Column(
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
                          hint: "لا يقل عن 500",
                          controller: compOpinionSubscribeData.views,
                          margin: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 5),
                          action: TextInputAction.done,
                          type: TextInputType.number,
                          onChange: (value) => compOpinionSubscribeData
                              .getCostSubscribe(context),
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
                          bloc: compOpinionSubscribeData.durationCubit,
                          listener: (_, state) {
                            compOpinionSubscribeData.duration.text =
                                DurationModel()
                                    .duration
                                    .firstWhere((e) => e.id == state.data)
                                    .name!;
                            compOpinionSubscribeData.getCostSubscribe(context);
                          },
                          builder: (_, state) {
                            return InkWellTextField(
                              icon: Icon(Icons.arrow_drop_down),
                              controller: compOpinionSubscribeData.duration,
                              validate: (value) =>
                                  value!.validateEmpty(context),
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              onTab: () {
                                DownBottomSheet(
                                  context: context,
                                  title: '',
                                  onTab: (name, id) => compOpinionSubscribeData
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
              bloc: compOpinionSubscribeData.dateCubit,
              listener: (_, state) {
                compOpinionSubscribeData.startDate.text = state.data;
              },
              builder: (_, state) {
                return InkWellTextField(
                  hint: "تاريخ البداية",
                  controller: compOpinionSubscribeData.startDate,
                  icon: Icon(
                    Icons.calendar_today_outlined,
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  validate: (value) => value!.validateEmpty(context),
                  onTab: () => compOpinionSubscribeData.getDatePicker(context),
                );
              },
            ),
            BuildFormText(text: "المنطقة"),
            DropdownTextField<CitiesModel>(
              dropKey: compOpinionSubscribeData.city,
              label: "المنطقة",
              selectedItem: compOpinionSubscribeData.regionModel,
              margin: const EdgeInsets.symmetric(vertical: 10),
              validate: (CitiesModel value) => value.validateDropDown(context),
              onChange: compOpinionSubscribeData.changeRegion,
              useName: true,
              finData: (filter) async =>
                  await CompanyRepository(context).getCompCities(3),
            ),
            BuildFormText(text: "تحديد العملاء المهتمين ب"),
            InkWellTextField(
              icon: Icon(Icons.arrow_drop_down),
              controller: compOpinionSubscribeData.interest,
              validate: (value) {},
              margin: const EdgeInsets.symmetric(vertical: 10),
              onTab: () => compOpinionSubscribeData.showInterestDialog(
                  context, compOpinionSubscribeData),
              hint: 'تحديد العملاء المهتمين ب',
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: BlocBuilder<GenericCubit<List<DropDownSelected>>,
                  GenericState<List<DropDownSelected>>>(
                bloc: compOpinionSubscribeData.interestCubit,
                builder: (_, state) {
                  return Wrap(
                    alignment: WrapAlignment.start,
                    runAlignment: WrapAlignment.start,
                    children: List.generate(
                      state.data.length,
                      (index) {
                        return Visibility(
                          visible: state.data[index].selected,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            margin: EdgeInsets.all(5),
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
                                  onPressed: () => compOpinionSubscribeData
                                      .onDeletePeopleInterest(
                                          context, state.data[index], index),
                                  icon: Icon(
                                    MdiIcons.closeCircle,
                                    size: 23,
                                    color: MyColors.primary,
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            BuildFormText(text: "الجنس"),
            BlocConsumer<GenericCubit<String>, GenericState<String>>(
              bloc: compOpinionSubscribeData.genderCubit,
              listener: (_, state) {
                compOpinionSubscribeData.gender.text = GenderModel()
                    .genders
                    .firstWhere((e) => e.id == state.data)
                    .name!;
              },
              builder: (_, state) {
                return InkWellTextField(
                  icon: Icon(Icons.arrow_drop_down),
                  controller: compOpinionSubscribeData.gender,
                  validate: (value) => value!.validateEmpty(context),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  onTab: () => DownBottomSheet(
                    context: context,
                    title: 'الجنس',
                    onTab: (name, id) =>
                        compOpinionSubscribeData.selectType(id, context),
                    data: GenderModel().genders,
                  ).show(),
                  hint: 'الجنس',
                );
              },
            ),
            BuildFormText(text: "السكن"),
            BlocConsumer<GenericCubit<String>, GenericState<String>>(
              bloc: compOpinionSubscribeData.livingCubit,
              listener: (_, state) {
                compOpinionSubscribeData.living.text = LivingModel()
                    .living
                    .firstWhere((e) => e.id == state.data)
                    .name!;
              },
              builder: (_, state) {
                return InkWellTextField(
                  icon: Icon(Icons.arrow_drop_down),
                  controller: compOpinionSubscribeData.living,
                  validate: (value) => value!.validateEmpty(context),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  onTab: () => DownBottomSheet(
                          context: context,
                          title: 'السكن',
                          onTab: (name, id) => compOpinionSubscribeData
                              .selectLiving(id, context),
                          data: LivingModel().living)
                      .show(),
                  hint: 'السكن',
                );
              },
            ),
            BuildFormText(text: "مستوي التعليم"),
            BlocConsumer<GenericCubit<String>, GenericState<String>>(
              bloc: compOpinionSubscribeData.educationCubit,
              listener: (_, state) {
                compOpinionSubscribeData.educationLevel.text = EducationModel()
                    .education
                    .firstWhere((e) => e.id == state.data)
                    .name!;
              },
              builder: (_, state) {
                return InkWellTextField(
                  icon: Icon(Icons.arrow_drop_down),
                  controller: compOpinionSubscribeData.educationLevel,
                  validate: (value) => value!.validateEmpty(context),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  onTab: () => DownBottomSheet(
                          context: context,
                          title: 'مستوي التعليم',
                          onTab: (name, id) => compOpinionSubscribeData
                              .selectEducation(id, context),
                          data: EducationModel().education)
                      .show(),
                  hint: 'مستوي التعليم',
                );
              },
            ),
            BuildFormText(text: "افراد الاسره"),
            BlocConsumer<GenericCubit<String>, GenericState<String>>(
              bloc: compOpinionSubscribeData.familyCubit,
              listener: (_, state) {
                compOpinionSubscribeData.familyMembers.text =
                    FamilyMemberModel()
                        .family
                        .firstWhere((e) => e.id == state.data)
                        .name!;
              },
              builder: (_, state) {
                return InkWellTextField(
                  icon: Icon(Icons.arrow_drop_down),
                  controller: compOpinionSubscribeData.familyMembers,
                  validate: (value) => value!.validateEmpty(context),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  onTab: () => DownBottomSheet(
                          context: context,
                          title: 'افراد الاسره',
                          onTab: (name, id) => compOpinionSubscribeData
                              .selectFamily(id, context),
                          data: FamilyMemberModel().family)
                      .show(),
                  hint: 'افراد الاسره',
                );
              },
            ),
            BuildFormText(text: "الفئة العمرية"),
            BlocConsumer<GenericCubit<String>, GenericState<String>>(
              bloc: compOpinionSubscribeData.ageCubit,
              listener: (_, state) {
                compOpinionSubscribeData.age.text =
                    AgeModel().age.firstWhere((e) => e.id == state.data).name!;
              },
              builder: (_, state) {
                return InkWellTextField(
                  icon: Icon(Icons.arrow_drop_down),
                  controller: compOpinionSubscribeData.age,
                  validate: (value) => value!.validateEmpty(context),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  onTab: () => DownBottomSheet(
                          context: context,
                          title: 'الفئة العمرية',
                          onTab: (name, id) =>
                              compOpinionSubscribeData.selectAge(id, context),
                          data: AgeModel().age)
                      .show(),
                  hint: 'الفئة العمرية',
                );
              },
            ),
            BuildFormText(text: "متوسط الدخل في الشهر"),
            BlocConsumer<GenericCubit<String>, GenericState<String>>(
              bloc: compOpinionSubscribeData.incomeCubit,
              listener: (_, state) {
                compOpinionSubscribeData.averageSalary.text = IncomeModel()
                    .income
                    .firstWhere((e) => e.id == state.data)
                    .name!;
              },
              builder: (_, state) {
                return InkWellTextField(
                  icon: Icon(Icons.arrow_drop_down),
                  controller: compOpinionSubscribeData.averageSalary,
                  validate: (value) => value!.validateEmpty(context),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  onTab: () => DownBottomSheet(
                          context: context,
                          title: 'متوسط الدخل في الشهر',
                          onTab: (name, id) => compOpinionSubscribeData
                              .selectIncome(id, context),
                          data: IncomeModel().income)
                      .show(),
                  hint: 'متوسط الدخل في الشهر',
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
