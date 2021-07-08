part of 'CompRegisterWidgetsImport.dart';

class BuildCompRegisterForm extends StatelessWidget {
  final CompanyRegisterData companyRegisterData;

  BuildCompRegisterForm({required this.companyRegisterData});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: companyRegisterData.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: MyText(
              title: "بزنسس والت يرحب بكم",
              size: 15,
              color: MyColors.white,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 20, top: 8),
            child: MyText(
              title: "ادخل معلومات حسابك",
              size: 13,
              color: MyColors.white,
            ),
          ),
          BuildFormText(text: "اسم المستخدم"),
          LabelTextField(
            hint: "اسم المستخدم",
            controller: companyRegisterData.name,
            margin: const EdgeInsets.symmetric(vertical: 10),
            action: TextInputAction.next,
            type: TextInputType.emailAddress,
            validate: (value) => value!.validateEmpty(context),
          ),
          BuildFormText(text: "البريد الالكتروني"),
          LabelTextField(
            hint: "البريد الالكتروني",
            controller: companyRegisterData.email,
            margin: const EdgeInsets.symmetric(vertical: 10),
            action: TextInputAction.next,
            type: TextInputType.emailAddress,
            validate: (value) => value!.validateEmail(context),
          ),
          BuildFormText(text: "رقم الجوال"),
          Row(
            children: [
              Expanded(
                flex: 4,
                child: LabelTextField(
                  hint: "رقم الجوال",
                  controller: companyRegisterData.phone,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  action: TextInputAction.next,
                  type: TextInputType.number,
                  validate: (value) => value!.validateEmpty(context),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  margin: const EdgeInsets.symmetric(horizontal: 5),
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
          BuildFormText(text: "اسم المنشأة"),
          LabelTextField(
            hint: "اسم المنشأة",
            controller: companyRegisterData.companyName,
            margin: const EdgeInsets.symmetric(vertical: 10),
            action: TextInputAction.next,
            type: TextInputType.emailAddress,
            validate: (value) => value!.validateEmpty(context),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                MyText(
                  title: "البريد الالكتروني للمنشأة",
                  size: 12,
                  color: MyColors.white,
                ),
                MyText(
                  title: " (اختياري)",
                  size: 12,
                  color: MyColors.primary,
                ),
              ],
            ),
          ),
          LabelTextField(
            hint: "البريد الالكتروني",
            controller: companyRegisterData.companyEmail,
            margin: const EdgeInsets.symmetric(vertical: 10),
            action: TextInputAction.next,
            type: TextInputType.emailAddress,
            validate: (value) => value!.noValidate(),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                MyText(
                  title: "رقم الهاتف للمنشأة",
                  size: 12,
                  color: MyColors.white,
                ),
                MyText(
                  title: " (اختياري)",
                  size: 12,
                  color: MyColors.primary,
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                flex: 4,
                child: LabelTextField(
                  hint: "رقم الهاتف",
                  controller: companyRegisterData.companyPhone,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  action: TextInputAction.next,
                  type: TextInputType.phone,
                  validate: (value) => value!.noValidate(),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  margin: const EdgeInsets.symmetric(horizontal: 5),
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
          BuildFormText(
            text: "الموقع",
          ),
          BlocConsumer<LocationCubit, LocationState>(
            bloc: companyRegisterData.locCubit,
            listener: (_, state) {
              companyRegisterData.address.text = state.model!.address;
              companyRegisterData.lat = state.model!.lat;
              companyRegisterData.lng = state.model!.lng;
            },
            builder: (_, state) {
              return InkWellTextField(
                controller: companyRegisterData.address,
                margin: EdgeInsets.symmetric(vertical: 10),
                hint: 'موقع الفرع الرئيسي',
                type: TextInputType.text,
                icon: Icon(
                  Icons.gps_fixed,
                  size: 20,
                  color: MyColors.primary,
                ),
                validate: (value) => value!.validateEmpty(context),
                onTab: () => Utils.navigateToLocationAddress(
                    context, companyRegisterData.locCubit),
              );
            },
          ),
          BuildFormText(
            text: "الدولة",
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
          BuildFormText(
            text: "المنطقة",
          ),
          DropdownTextField<CitiesModel>(
            dropKey: companyRegisterData.city,
            label: "المنطقة",
            margin: const EdgeInsets.symmetric(vertical: 10),
            validate: (CitiesModel value) => value.validateDropDown(context),
            onChange: companyRegisterData.onSelectCities,
            useName: true,
            finData: (filter) async =>
                await CompanyRepository(context).getCompCities(3),
          ),
          BuildFormText(
            text: "كلمة المرور",
          ),
          BlocBuilder<GenericCubit<bool>, GenericState<bool>>(
            bloc: companyRegisterData.showPass,
            builder: (context, state) {
              return IconTextFiled(
                hint: "كلمة المرور",
                controller: companyRegisterData.password,
                validate: (value) => value!.validatePassword(context),
                action: TextInputAction.next,
                suffixIcon: IconButton(
                  icon: Icon(Icons.remove_red_eye_rounded),
                  onPressed: () =>
                      companyRegisterData.showPass.onUpdateData(!state.data),
                ),
                isPassword: state.data,
                margin: const EdgeInsets.symmetric(vertical: 10),
              );
            },
          ),
          BuildFormText(
            text: "تأكيد كلمة المرور",
          ),
          BlocBuilder<GenericCubit<bool>, GenericState<bool>>(
            bloc: companyRegisterData.showConfirmPass,
            builder: (context, state) {
              return IconTextFiled(
                hint: "تأكيد كلمة المرور",
                controller: companyRegisterData.confirmPassword,
                action: TextInputAction.done,
                isPassword: state.data,
                suffixIcon: IconButton(
                  icon: Icon(Icons.remove_red_eye_rounded),
                  onPressed: () => companyRegisterData.showConfirmPass
                      .onUpdateData(!state.data),
                ),
                validate: (value) => value!.validatePasswordConfirm(context,
                    pass: companyRegisterData.password.text),
                margin: const EdgeInsets.symmetric(vertical: 10),
              );
            },
          ),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  MyText(
                    title: "ادخل رقم محفظة الوسيط ان وجد",
                    size: 12,
                    color: MyColors.white,
                  ),
                  MyText(
                    title: " (اختياري)",
                    size: 12,
                    color: MyColors.primary,
                  ),
                ],
              )),
          LabelTextField(
            hint: "رقم المحفظة",
            controller: companyRegisterData.walletNumb,
            margin: const EdgeInsets.symmetric(vertical: 10),
            action: TextInputAction.next,
            type: TextInputType.emailAddress,
            validate: (value) => value!.noValidate(),
          ),
        ],
      ),
    );
  }
}
