part of 'EditActivityWidgetsImports.dart';

class BuildPrimaryBranch extends StatelessWidget {
  final CompanyEditActivityData companyEditActivityData;

  BuildPrimaryBranch({required this.companyEditActivityData});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
          child: MyText(
            title: "النشاط الرئيسي في السجل التجاري",
            size: 11,
            color: MyColors.white,
          ),
        ),
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
