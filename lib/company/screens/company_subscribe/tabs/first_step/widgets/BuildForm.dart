part of 'FirstStepWidgetsImports.dart';

class BuildForm extends StatelessWidget {
  final CompanySubscribeData companySubscribeData;
  final bool showVideo;

  BuildForm({required this.companySubscribeData, required this.showVideo});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: companySubscribeData.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BuildFormText(text: "اسم الاعلان"),
          LabelTextField(
            hint: "اسم الاعلان",
            controller: companySubscribeData.name,
            margin: const EdgeInsets.symmetric(vertical: 10),
            action: TextInputAction.next,
            type: TextInputType.emailAddress,
            validate: (value) => value!.validateEmpty(context),
          ),
          BuildFormText(text: "نص اختياري"),
          RichTextFiled(
            hint: "اسم الاعلان",
            max: 2,
            controller: companySubscribeData.msg,
            margin: const EdgeInsets.symmetric(vertical: 10),
            action: TextInputAction.next,
            type: TextInputType.emailAddress,
            validate: (value) => value!.validateEmpty(context),
          ),
          BuildAddFile(companySubscribeData: companySubscribeData),
          BuildAddImage(companySubscribeData: companySubscribeData),
          Visibility(
            visible: showVideo,
            child: BuildAddVideo(companySubscribeData: companySubscribeData),
            replacement: Container(),
          ),
        ],
      ),
    );
  }
}
