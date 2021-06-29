part of 'FirstStepOpinionWidgetsImport.dart';

class BuildOpinionForm extends StatelessWidget {
  final CompOpinionSubscribeData compOpinionSubscribeData;

  const BuildOpinionForm({required this.compOpinionSubscribeData});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: compOpinionSubscribeData.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BuildFormText(text: "نص اختياري"),
          RichTextFiled(
            hint: "اسم الاعلان",
            max: 2,
            controller: compOpinionSubscribeData.msg,
            margin: const EdgeInsets.symmetric(vertical: 10),
            action: TextInputAction.next,
            type: TextInputType.emailAddress,
            validate: (value) => value!.validateEmpty(context),
          ),
          BuildOpinionImages(compOpinionSubscribeData: compOpinionSubscribeData),
          BuildOpinionVideos(compOpinionSubscribeData: compOpinionSubscribeData),
        ],
      ),
    );
  }
}
