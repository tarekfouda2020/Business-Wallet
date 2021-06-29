part of 'SecStepBrochureWidgetsImports.dart';

class BuildForm extends StatelessWidget {
  final CompBrochureSubscribeData compBrochureSubscribeData;

  const BuildForm({required this.compBrochureSubscribeData});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BuildFormText(text: "عدد البروشور"),
        LabelTextField(
          hint: "عدد البروشور",
          controller: compBrochureSubscribeData.brochure,
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          action: TextInputAction.next,
          type: TextInputType.emailAddress,
          onChange: (value) =>
              compBrochureSubscribeData.getCostSubscribe(context),
          validate: (value) => value!.validateEmpty(context),
        ),
        BuildFormText(text: "المنطقة"),
        DropdownTextField<CitiesModel>(
          dropKey: compBrochureSubscribeData.city,
          label: "المنطقة",
          selectedItem: compBrochureSubscribeData.regionModel,
          margin: const EdgeInsets.symmetric(vertical: 10),
          validate: (CitiesModel value) => value.validateDropDown(context),
          onChange: compBrochureSubscribeData.changeRegion,
          useName: true,
          finData: (filter) async =>
              await CompanyRepository(context).getCompCities(3),
        ),
      ],
    );
  }
}
