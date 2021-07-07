part of 'EditProfileWidgetsImports.dart';

class BuildEditProfileFormInputs extends StatelessWidget {
  final EditProfileData editProfileData;

  const BuildEditProfileFormInputs({required this.editProfileData});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Form(
        key: editProfileData.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText(
              title: "اسم المستخدم",
              size: 11,
              color: MyColors.white,
            ),
            IconTextFiled(
              hint: "اسم المستخدم",
              controller: editProfileData.name,
              margin: const EdgeInsets.symmetric(vertical: 10),
              action: TextInputAction.next,
              type: TextInputType.name,
              suffixIcon: Icon(Icons.edit),
              validate: (value) => value!.validateName(context),
            ),
            MyText(
              title: "البريد الالكتروني",
              size: 11,
              color: MyColors.white,
            ),
            IconTextFiled(
              hint: "البريد الالكتروني",
              controller: editProfileData.email,
              margin: const EdgeInsets.symmetric(vertical: 10),
              action: TextInputAction.next,
              type: TextInputType.emailAddress,
              suffixIcon: Icon(Icons.edit),
              validate: (value) => value!.validateEmpty(context),
            ),
            MyText(
              title: "رقم الجوال",
              size: 11,
              color: MyColors.white,
            ),
            LabelTextField(
              hint: "رقم الجوال",
              controller: editProfileData.phone,
              margin: const EdgeInsets.symmetric(vertical: 10),
              action: TextInputAction.next,
              type: TextInputType.phone,
              validate: (value) => value!.validatePhone(context),
            ),
            MyText(
              title: "الدوله",
              size: 11,
              color: MyColors.white,
            ),
            Container(
              constraints: BoxConstraints(
                  minHeight: 55,
                  maxHeight: 80,
                  minWidth: double.infinity,
                  maxWidth: double.infinity),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30), color: MyColors.black),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: MyText(title: "السعودية"),
            ),
            MyText(
              title: "المنطقه",
              size: 11,
              color: MyColors.white,
            ),
            DropdownTextField<CitiesModel>(
              dropKey: editProfileData.city,
              label: "المنطقة",
              selectedItem: editProfileData.cityId,
              margin: const EdgeInsets.symmetric(vertical: 10),
              validate: (CitiesModel value) => value.validateDropDown(context),
              onChange: editProfileData.onSelectCities,
              useName: true,
              finData: (filter) async =>
                  await CustomerRepository(context).getCities(3),
            ),
            MyText(
              title: "الجنس",
              size: 11,
              color: MyColors.white,
            ),
            BlocConsumer<GenericCubit<String>, GenericState<String>>(
              bloc: editProfileData.genderCubit,
              listener: (_, state) {
                editProfileData.gender.text = GenderModel()
                    .genders
                    .firstWhere((e) => e.id == state.data)
                    .name!;
              },
              builder: (_, state) {
                return InkWellTextField(
                  icon: Icon(Icons.arrow_drop_down),
                  controller: editProfileData.gender,
                  validate: (value) => value!.validateEmpty(context),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  onTab: () => DownBottomSheet(
                    context: context,
                    title: 'الجنس',
                    onTab: (name, id) =>
                        editProfileData.selectType(id, context),
                    data: GenderModel().genders,
                  ).show(),
                  hint: 'الجنس',
                );
              },
            ),
            MyText(
              title: "تاريخ الميلاد",
              size: 11,
              color: MyColors.white,
            ),

            BlocConsumer<GenericCubit, GenericState>(
              bloc: editProfileData.dateCubit,
              listener: (_, state) {
                editProfileData.birthDate.text = state.data;
              },
              builder: (_, state) {
                return InkWellTextField(
                  hint: "تاريخ الميلاد",
                  controller: editProfileData.birthDate,
                  icon: Icon(
                    Icons.calendar_today_outlined,
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  validate: (value) => value!.validateEmpty(context),
                  onTab: () => editProfileData.getDatePicker(context),
                );
              },
             ),

            MyText(
              title: "السكن",
              size: 11,
              color: MyColors.white,
            ),
            BlocConsumer<GenericCubit<String>, GenericState<String>>(
              bloc: editProfileData.livingCubit,
              listener: (_, state) {
                editProfileData.living.text = LivingModel()
                    .living
                    .firstWhere((e) => e.id == state.data)
                    .name!;
              },
              builder: (_, state) {
                return InkWellTextField(
                  icon: Icon(Icons.arrow_drop_down),
                  controller: editProfileData.living,
                  validate: (value) => value!.validateEmpty(context),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  onTab: () => DownBottomSheet(
                          context: context,
                          title: 'السكن',
                          onTab: (name, id) =>
                              editProfileData.selectLiving(id, context),
                          data: LivingModel().living)
                      .show(),
                  hint: 'السكن',
                );
              },
            ),
            MyText(
              title: "مستوي التعليم",
              size: 11,
              color: MyColors.white,
            ),
            BlocConsumer<GenericCubit<String>, GenericState<String>>(
              bloc: editProfileData.educationCubit,
              listener: (_, state) {
                print("================> ${state.data}");
                editProfileData.educationLevel.text = EducationModel()
                    .education
                    .firstWhere((e) => e.id == state.data)
                    .name!;
              },
              builder: (_, state) {
                return InkWellTextField(
                  icon: Icon(Icons.arrow_drop_down),
                  controller: editProfileData.educationLevel,
                  validate: (value) => value!.validateEmpty(context),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  onTab: () => DownBottomSheet(
                          context: context,
                          title: 'مستوي التعليم',
                          onTab: (name, id) =>
                              editProfileData.selectEducation(id, context),
                          data: EducationModel().education)
                      .show(),
                  hint: 'مستوي التعليم',
                );
              },
            ),
            MyText(
              title: "افراد الاسره",
              size: 11,
              color: MyColors.white,
            ),
            BlocConsumer<GenericCubit<String>, GenericState<String>>(
              bloc: editProfileData.familyCubit,
              listener: (_, state) {
                editProfileData.familyMembers.text = FamilyMemberModel()
                    .family
                    .firstWhere((e) => e.id == state.data)
                    .name!;
              },
              builder: (_, state) {
                return InkWellTextField(
                  icon: Icon(Icons.arrow_drop_down),
                  controller: editProfileData.familyMembers,
                  validate: (value) => value!.validateEmpty(context),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  onTab: () => DownBottomSheet(
                          context: context,
                          title: 'افراد الاسره',
                          onTab: (name, id) =>
                              editProfileData.selectFamily(id, context),
                          data: FamilyMemberModel().family)
                      .show(),
                  hint: 'افراد الاسره',
                );
              },
            ),
            MyText(
              title: "متوسط الدخل في الشهر",
              size: 11,
              color: MyColors.white,
            ),
            BlocConsumer<GenericCubit<String>, GenericState<String>>(
              bloc: editProfileData.incomeCubit,
              listener: (_, state) {
                editProfileData.averageSalary.text = IncomeModel()
                    .income
                    .firstWhere((e) => e.id == state.data)
                    .name!;
              },
              builder: (_, state) {
                return InkWellTextField(
                  icon: Icon(Icons.arrow_drop_down),
                  controller: editProfileData.averageSalary,
                  validate: (value) => value!.validateEmpty(context),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  onTab: () => DownBottomSheet(
                          context: context,
                          title: 'متوسط الدخل في الشهر',
                          onTab: (name, id) =>
                              editProfileData.selectIncome(id, context),
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
