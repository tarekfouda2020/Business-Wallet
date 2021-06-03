part of 'RegisterWidgetsImports.dart';

class BuildRegisterInputs extends StatelessWidget {
  final RegisterData registerData;

  const BuildRegisterInputs(this.registerData);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: registerData.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(
            title: "اسم المستخدم",
          ),
          LabelTextField(
            hint: "اسم المستخدم",
            controller: registerData.userName,
            validate: (value) => value!.validateEmpty(context),
            margin: const EdgeInsets.symmetric(vertical: 10),
            action: TextInputAction.next,
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: MyText(
              title: "البريد الالكتروني",
            ),
          ),
          LabelTextField(
            hint: "البريد الالكتروني",
            controller: registerData.mail,
            validate: (value) => value!.validateEmail(context),
            margin: const EdgeInsets.symmetric(vertical: 10),
            action: TextInputAction.next,
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: MyText(
              title: "رقم الجوال",
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: LabelTextField(
                    hint: "رقم الجوال",
                    controller: registerData.phone,
                    validate: (value) => value!.validatePhone(context),
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    action: TextInputAction.next,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  flex: 2,
                  child: Container(
                    constraints: BoxConstraints(
                        minHeight: 55,
                        maxHeight: 80,
                        minWidth: double.infinity,
                        maxWidth: double.infinity),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: MyColors.black),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyText(title: "+966"),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: MyText(
              title: "الدولة",
            ),
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
            child: MyText(title: "السعودية"),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: MyText(
              title: "المنطقة",
            ),
          ),
          DropdownTextField<CitiesModel>(
            dropKey: registerData.city,
            label: "المنطقة",
            margin: const EdgeInsets.symmetric(vertical: 10),
            validate: (CitiesModel value) => value.validateDropDown(context),
            onChange: registerData.onSelectCities,
            useName: true,
            finData: (filter) async =>
                await CustomerRepository(context).getCities(3),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: MyText(
              title: "الجنس",
            ),
          ),
          BlocConsumer<GenericCubit<String>, GenericState<String>>(
            bloc: registerData.genderCubit,
            listener: (_, state) {
              registerData.gender.text = GenderModel()
                  .genders
                  .firstWhere((e) => e.id == state.data)
                  .name!;
            },
            builder: (_, state) {
              return InkWellTextField(
                icon: Icon(Icons.arrow_drop_down),
                controller: registerData.gender,
                validate: (value) => value!.validateEmpty(context),
                margin: const EdgeInsets.symmetric(vertical: 10),
                onTab: () => DownBottomSheet(
                  context: context,
                  title: 'الجنس',
                  onTab: (name, id) => registerData.selectType(id, context),
                  data: GenderModel().genders,
                ).show(),
                hint: 'الجنس',
              );
            },
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: MyText(
              title: "تاريخ الميلاد",
            ),
          ),
          BlocConsumer<GenericCubit, GenericState>(
            bloc: registerData.dateCubit,
            listener: (_, state) {
              registerData.birthDate.text = state.data;
            },
            builder: (_, state) {
              return InkWellTextField(
                hint: "تاريخ الميلاد",
                controller: registerData.birthDate,
                icon: Icon(
                  Icons.calendar_today_outlined,
                ),
                margin: const EdgeInsets.symmetric(vertical: 10),
                validate: (value) => value!.validateEmpty(context),
                onTab: () => registerData.getDatePicker(context),
              );
            },
          ),

          Container(
            margin: const EdgeInsets.only(top: 10),
            child: MyText(
              title: "كلمة المرور",
            ),
          ),
          IconTextFiled(
            hint: "كلمة المرور",
            controller: registerData.pass,
            validate: (value) => value!.validatePassword(context),
            margin: const EdgeInsets.symmetric(vertical: 10),
            action: TextInputAction.next,
            isPassword: true,
            suffixIcon: Icon(
              Icons.remove_red_eye,
              color: MyColors.white,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: MyText(
              title: "تأكيد كلمة المرور",
            ),
          ),
          IconTextFiled(
            hint: "تأكيد كلمة المرور",
            controller: registerData.confirmPass,
            validate: (value) => value!
                .validatePasswordConfirm(context, pass: registerData.pass.text),
            margin: const EdgeInsets.symmetric(vertical: 10),
            action: TextInputAction.next,
            isPassword: true,
            suffixIcon: Icon(
              Icons.remove_red_eye,
              color: MyColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
