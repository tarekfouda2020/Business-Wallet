part of 'RegisterInterestsWidgetsImports.dart';

class BuildInterestForm extends StatelessWidget {
  final CompanyRegisterInterestsData companyRegisterInterestsData;

  BuildInterestForm({required this.companyRegisterInterestsData});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BuildFormText(text: "النشاط الرئيسي في السجل التجاري"),
          DropdownTextField<DropDownModel>(
            dropKey: companyRegisterInterestsData.primaryBranch,
            hint: "النشاط الرئيسي",
            borderRadius: 80,
            validate: (DropDownModel value) => value.validateDropDown(context),
            margin: EdgeInsets.symmetric(vertical: 10),
            onChange: companyRegisterInterestsData.changePrimaryBranch,
            // data: ,
          ),
          BuildFormText(text: "النشاط الفرعي"),
          DropdownTextField<DropDownModel>(
            dropKey: companyRegisterInterestsData.secondaryBranch,
            hint: "النشاط الفرعي",
            validate: (DropDownModel value) => value.validateDropDown(context),
            margin: EdgeInsets.symmetric(vertical: 10),
            onChange: companyRegisterInterestsData.changeSecondaryBranch,
            // data: ,
          ),
        ],
      ),
    );
  }
}
