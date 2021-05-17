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
                          maxWidth: double.infinity
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: MyColors.black
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyText(title: "+966"),
                          Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: MyColors.white,
                          )
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
                  maxWidth: double.infinity
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: MyColors.black
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: MyText(title: "السعودية"),
            ),

            Container(
              margin: const EdgeInsets.only(top: 10),
              child: MyText(
                title: "المنطقة",
              ),
            ),

            Container(
              margin: const EdgeInsets.only(top: 10),
              child: MyText(
                title: "الجنس",
              ),
            ),


            Container(
              margin: const EdgeInsets.only(top: 10),
              child: MyText(
                title: "تاريخ الميلاد",
              ),
            ),

            BlocBuilder<GenericCubit<String>, GenericState<String>>(
              bloc: registerData.dateCubit,
              builder: (context, state){
                if (state is GenericInitialState) {
                  return InkWellTextField(
                    controller: registerData.birthDate,
                    hint: "تاريخ الميلاد",
                    onTab: ()=> registerData.getDatePicker(context),
                    // onTab: (){},
                    validate: (value) => value!.validatePhone(context),
                    icon: Icon(
                      Icons.calendar_today_outlined,
                      color: MyColors.white,
                    ),
                  );
                }
                else {
                  return InkWellTextField(
                    controller: registerData.birthDate,
                    hint: state.data,
                    onTab: ()=> registerData.getDatePicker(context),
                    // onTab: (){},
                    validate: (value) => value!.validatePhone(context),
                    icon: Icon(
                      Icons.calendar_today_outlined,
                      color: MyColors.white,
                    ),
                  );
                }
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
              validate: (value) => value!.validateEmail(context),
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
              validate: (value) => value!.validateEmail(context),
              margin: const EdgeInsets.symmetric(vertical: 10),
              action: TextInputAction.next,
              isPassword: true,
              suffixIcon: Icon(
                Icons.remove_red_eye,
                color: MyColors.white,
              ),
            ),


          ],
        )
    );
  }
}
