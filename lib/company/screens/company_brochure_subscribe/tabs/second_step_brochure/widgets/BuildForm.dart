part of 'SecStepBrochureWidgetsImports.dart';

class BuildForm extends StatelessWidget {
  final SecondStepBrochureData secondStepBrochureData;

  const BuildForm({required this.secondStepBrochureData});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BuildFormText(text: "عدد البروشور"),
        LabelTextField(
          hint: "عدد البروشور",
          controller: secondStepBrochureData.brochureNum,
          margin: const EdgeInsets.symmetric(
              vertical: 5, horizontal: 5),
          action: TextInputAction.next,
          type: TextInputType.emailAddress,
          validate: (value) => value!.validateEmpty(context),
        ),
        BuildFormText(text: "المنطقة"),
        DropdownTextField<DropDownModel>(
          dropKey: secondStepBrochureData.region,
          label: "المنطقة",
          margin: const EdgeInsets.symmetric(vertical: 10),
          onChange: secondStepBrochureData.changeRegion,
          validate: (DropDownModel value) => value.validateDropDown(context),
          // finData: (filter) async =>
          // await CustomerRepository(context).getCountries(),
        ),
      ],
    );
  }
}
