part of 'EditActivityWidgetsImports.dart';

class BuildPrimaryBranch extends StatelessWidget {
  final CompanyEditActivityData companyEditActivityData;

  BuildPrimaryBranch({required this.companyEditActivityData});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BuildFormText(text: "النشاط الرئيسي في السجل التجاري"),
        DropdownTextField<DropDownModel>(
          dropKey: companyEditActivityData.mainField,
          hint: "النشاط الرئيسي",
          selectedItem: companyEditActivityData.mainFieldId,
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          validate: (DropDownModel value) => value.validateDropDown(context),
          onChange: companyEditActivityData.onSelectMain,
          useName: true,
          finData: (filter) async =>
          await CompanyRepository(context).getMainField(refresh: false),
        ),

      ],
    );
  }
}
