part of 'FirstStepWidgetsImports.dart';

class BuildForm extends StatelessWidget {
  final FirstStepData firstStepData;

  BuildForm({required this.firstStepData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BuildFormText(text: "اسم الاعلان"),
        LabelTextField(
          hint: "اسم الاعلان",
          controller: firstStepData.name,
          margin: const EdgeInsets.symmetric(vertical: 10),
          action: TextInputAction.next,
          type: TextInputType.emailAddress,
          validate: (value) => value!.validateEmpty(context),
        ),
        BuildFormText(text: "نص اختياري"),
        LabelTextField(
          hint: "اسم الاعلان",
          controller: firstStepData.name,
          margin: const EdgeInsets.symmetric(vertical: 10),
          action: TextInputAction.next,
          type: TextInputType.emailAddress,
          validate: (value) => value!.validateEmpty(context),
        ),
      ],
    );
  }
}
