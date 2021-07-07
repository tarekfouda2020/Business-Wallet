part of 'ContactUsWidgetsImports.dart';

class BuildContactUsForm extends StatelessWidget {
  final ContactUsData contactUsData;

  BuildContactUsForm({required this.contactUsData});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: contactUsData.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: MyText(
              title: "اسم المستخدم",
              size: 11,
              color: MyColors.white,
            ),
          ),
          LabelTextField(
            hint: "الرجاء ادخال اسم المستخدم",
            controller: contactUsData.userName,
            action: TextInputAction.next,
            type: TextInputType.emailAddress,
            margin: const EdgeInsets.symmetric(vertical: 5),
            validate: (value) => value!.validateName(context),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: MyText(
              title: "رقم الجوال",
              size: 11,
              color: MyColors.white,
            ),
          ),
          LabelTextField(
            hint: "الرجاء ادخال رقم الجوال",
            controller: contactUsData.phone,
            action: TextInputAction.next,
            type: TextInputType.number,
            margin: const EdgeInsets.symmetric(vertical: 5),
            validate: (value) => value!.validatePhone(context),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: MyText(
              title: "العنوان",
              size: 11,
              color: MyColors.white,
            ),
          ),
          LabelTextField(
            hint: "الرجاء ادخال العنوان ",
            controller: contactUsData.address,
            action: TextInputAction.next,
            type: TextInputType.emailAddress,
            margin: const EdgeInsets.symmetric(vertical: 5),
            validate: (value) => value!.validateEmpty(context),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: MyText(
              title: "الرسائل",
              size: 11,
              color: MyColors.white,
            ),
          ),
          RichTextFiled(
            hint: "الرجاء كتابة الرسالة",
            controller: contactUsData.msg,
            action: TextInputAction.next,
            type: TextInputType.emailAddress,
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            validate: (value) => value!.validateEmpty(context),
            max: 2,
          ),
        ],
      ),
    );
  }
}
