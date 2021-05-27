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
          dropKey: companyEditActivityData.primaryBranch,
          hint: "النشاط الرئيسي",
          borderRadius: 80,
          validate: (DropDownModel value) => value.validateDropDown(context),
          margin: EdgeInsets.symmetric(vertical: 10),
          onChange: companyEditActivityData.changePrimaryBranch,
          // data: ,
        ),
      ],
    );
  }
}
