part of 'EditActivityWidgetsImports.dart';

class BuildSecondaryBranch extends StatelessWidget {
  final CompanyEditActivityData companyEditActivityData;

  BuildSecondaryBranch({required this.companyEditActivityData});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
          child: MyText(
            title: "النشاط الفرعي",
            size: 11,
            color: MyColors.white,
          ),
        ),
        DropdownTextField<DropDownModel>(
          dropKey: companyEditActivityData.secondaryBranch,
          hint: "النشاط الفرعي",
          validate: (DropDownModel value) => value.validateDropDown(context),
          margin: EdgeInsets.symmetric(vertical: 10),
          onChange: companyEditActivityData.changeSecondaryBranch,
          // data: ,
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: Wrap(
            spacing: 10,
            runSpacing: 10,
            alignment: WrapAlignment.start,
            children: List.generate(
              3,
              (index) => BuildSecondaryItem(
                title: "متجر نضارات",
              ),
            ),
          ),
        ),
      ],
    );
  }
}
