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
                  type: TextInputType.emailAddress,
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
            validate: (value) => value!.validateEmail(context),
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
                  type: TextInputType.emailAddress,
                  validate: (String? value) {},
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
            bloc: companyRegisterData.locationCubit,
            listener: (context, state) {
              companyRegisterData.address.text = state.model!.address;
              companyRegisterData.lat = state.model!.lat;
              companyRegisterData.lng = state.model!.lng;
            },
            builder: (context, state) {
              return InkWellTextField(
                hint: 'الموقع',
                controller: companyRegisterData.address,
                icon: Icon(Icons.location_on_outlined),
                margin: const EdgeInsets.symmetric(vertical: 10),
                validate: (value) => value!.validateEmpty(context),
                onTab: () => companyRegisterData.getUserLocation(context),
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
          IconTextFiled(
            hint: "كلمة المرور",
            controller: companyRegisterData.password,
            margin: const EdgeInsets.symmetric(vertical: 10),
            action: TextInputAction.next,
            isPassword: true,
            suffixIcon: Icon(
              Icons.remove_red_eye,
              color: MyColors.grey,
            ),
            type: TextInputType.emailAddress,
            validate: (value) => value!.validatePassword(context),
          ),
          BuildFormText(
            text: "تأكيد كلمة المرور",
          ),
          IconTextFiled(
            hint: "تأكيد كلمة المرور",
            controller: companyRegisterData.confirmPassword,
            margin: const EdgeInsets.symmetric(vertical: 10),
            action: TextInputAction.next,
            isPassword: true,
            suffixIcon: Icon(
              Icons.remove_red_eye,
              color: MyColors.grey,
            ),
            type: TextInputType.emailAddress,
            validate: (value) => value!.validatePasswordConfirm(context,
                pass: companyRegisterData.password.text),
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
            validate: (String? value) {},
          ),
        ],
      ),
    );
  }
}
