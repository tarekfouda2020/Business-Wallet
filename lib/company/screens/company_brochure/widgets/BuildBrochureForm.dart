part of 'CompBrochureWidgetsImports.dart';

class BuildBrochureForm extends StatelessWidget {
  final CompanyBrochureData companyBrochureData;

  BuildBrochureForm({required this.companyBrochureData});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: companyBrochureData.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BuildFormText(text: "رقم الجوال"),
          LabelTextField(
            hint: "رقم الجوال",
            controller: companyBrochureData.phone,
            action: TextInputAction.next,
            type: TextInputType.number,
            margin: const EdgeInsets.symmetric(vertical: 10),
            validate: (value) => value!.validatePhone(context),
          ),
          BuildFormText(text: "البريد الالكتروني"),
          LabelTextField(
            hint: "البريد الالكتروني",
            controller: companyBrochureData.email,
            action: TextInputAction.next,
            type: TextInputType.emailAddress,
            margin: const EdgeInsets.symmetric(vertical: 10),
            validate: (value) => value!.validateEmail(context),
          ),
          BuildFormText(text: "وصف المنشأة"),
          RichTextFiled(
            max: 2,
            hint: "وصف المنشأة",
            controller: companyBrochureData.desc,
            action: TextInputAction.next,
            type: TextInputType.emailAddress,
            margin: const EdgeInsets.symmetric(vertical: 10),
            validate: (value) => value!.validateEmpty(context),
          ),
          BuildAddFile(companyBrochureData: companyBrochureData),
          BuildAddService(companyBrochureData: companyBrochureData),
          BuildAddImage(companyBrochureData: companyBrochureData),
        ],
      ),
    );
  }
}
