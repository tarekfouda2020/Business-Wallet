part of 'CompRegisterWidgetsImport.dart';

class BuildCompRegisterForm extends StatelessWidget {
  final CompanyRegisterData companyRegisterData;

  BuildCompRegisterForm({required this.companyRegisterData});

  @override
  Widget build(BuildContext context) {
    return Column(
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
        BuildFormText(
          text: "اسم المستخدم",
        ),
        LabelTextField(
          hint: "اسم المستخدم",
          controller: companyRegisterData.email,
          margin: const EdgeInsets.symmetric(vertical: 10),
          action: TextInputAction.next,
          type: TextInputType.emailAddress,
          validate: (value) => value!.validateEmpty(context),
        ),
        BuildFormText(
          text: "البريد الالكتروني",
        ),
        LabelTextField(
          hint: "البريد الالكتروني",
          controller: companyRegisterData.email,
          margin: const EdgeInsets.symmetric(vertical: 10),
          action: TextInputAction.next,
          type: TextInputType.emailAddress,
          validate: (value) => value!.validateEmpty(context),
        ),
        BuildFormText(
          text: "رقم الجوال",
        ),
        Row(
          children: [
            Expanded(
              flex: 4,
              child: LabelTextField(
                hint: "رقم الجوال",
                controller: companyRegisterData.email,
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
        BuildFormText(
          text: "اسم المنشأة",
        ),
        LabelTextField(
          hint: "اسم المنشأة",
          controller: companyRegisterData.email,
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
          controller: companyRegisterData.email,
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
                controller: companyRegisterData.email,
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
        BuildFormText(
          text: "الدولة",
        ),
        InkWellTextField(
          controller: companyRegisterData.email,
          hint: "السعودية",
          onTab: () {},
          margin: const EdgeInsets.symmetric(vertical: 10),
          validate: (value) => value!.validateEmpty(context),
        ),
        BuildFormText(
          text: "المنطقة",
        ),
        LabelTextField(
          hint: "المنطقة",
          controller: companyRegisterData.email,
          margin: const EdgeInsets.symmetric(vertical: 10),
          action: TextInputAction.next,
          type: TextInputType.emailAddress,
          validate: (value) => value!.validateEmpty(context),
        ),
        BuildFormText(
          text: "كلمة المرور",
        ),
        IconTextFiled(
          hint: "كلمة المرور",
          controller: companyRegisterData.email,
          margin: const EdgeInsets.symmetric(vertical: 10),
          action: TextInputAction.next,
          isPassword: true,
          suffixIcon: Icon(
            Icons.remove_red_eye,
            color: MyColors.grey,
          ),
          type: TextInputType.emailAddress,
          validate: (value) => value!.validateEmpty(context),
        ),
        BuildFormText(
          text: "تأكيد كلمة المرور",
        ),
        IconTextFiled(
          hint: "تأكيد كلمة المرور",
          controller: companyRegisterData.email,
          margin: const EdgeInsets.symmetric(vertical: 10),
          action: TextInputAction.next,
          isPassword: true,
          suffixIcon: Icon(
            Icons.remove_red_eye,
            color: MyColors.grey,
          ),
          type: TextInputType.emailAddress,
          validate: (value) => value!.validateEmpty(context),
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
          controller: companyRegisterData.email,
          margin: const EdgeInsets.symmetric(vertical: 10),
          action: TextInputAction.next,
          type: TextInputType.emailAddress,
          validate: (value) => value!.validateEmpty(context),
        ),
      ],
    );
  }
}
