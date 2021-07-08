part of 'RegisterInterestsWidgetsImports.dart';

class BuildInterestForm extends StatelessWidget {
  final CompanyRegisterInterestsData companyRegisterInterestsData;

  BuildInterestForm({required this.companyRegisterInterestsData});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Form(
        key: companyRegisterInterestsData.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BuildFormText(text: "النشاط الرئيسي في السجل التجاري"),
            DropdownTextField<DropDownModel>(
              dropKey: companyRegisterInterestsData.mainField,
              hint: "النشاط الرئيسي",
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              validate: (DropDownModel value) => value.validateDropDown(context),
              onChange: companyRegisterInterestsData.onSelectMain,
              useName: true,
              finData: (filter) async =>
                  await CompanyRepository(context).getMainField(refresh: false),
            ),
            BuildFormText(text: "النشاط الفرعي"),
            DropdownTextField<DropDownSelected>(
              dropKey: companyRegisterInterestsData.subField,
              hint: "النشاط الفرعي",
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              validate: (DropDownSelected value) =>
                  value.validateDropDown(context),
              onChange: (model) =>
                  companyRegisterInterestsData.onSelectSub(model, context),
              useName: true,
              finData: (filter) async => await CompanyRepository(context)
                  .getSubField(companyRegisterInterestsData.mainFieldId!,
                      refresh: false),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: BlocBuilder<GenericCubit<List<DropDownSelected>>,
                  GenericState<List<DropDownSelected>>>(
                bloc: companyRegisterInterestsData.subFieldCubit,
                builder: (_, state) {
                  return Wrap(
                    alignment: WrapAlignment.start,
                    runSpacing: 10,
                    spacing: 10,
                    runAlignment: WrapAlignment.start,
                    children: List.generate(
                      state.data.length,
                      (index) {
                        return Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: MyColors.secondary,
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              MyText(
                                title: "${state.data[index].name}",
                                size: 11,
                                color: MyColors.white,
                              ),
                              IconButton(
                                onPressed: () =>
                                    companyRegisterInterestsData.onDeleteSub(
                                        context, state.data[index], index),
                                icon: Icon(
                                  MdiIcons.closeCircle,
                                  size: 23,
                                  color: MyColors.primary,
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
