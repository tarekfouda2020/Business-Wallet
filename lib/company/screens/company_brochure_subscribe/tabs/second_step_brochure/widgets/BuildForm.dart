part of 'SecStepBrochureWidgetsImports.dart';

class BuildForm extends StatelessWidget {
  final CompBrochureSubscribeData compBrochureSubscribeData;

  const BuildForm({required this.compBrochureSubscribeData});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>FocusScope.of(context).requestFocus(FocusNode()),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        child: Form(
          key: compBrochureSubscribeData.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BuildFormText(text: "النشاط الرئيسي في السجل التجاري"),
              DropdownTextField<DropDownModel>(
                dropKey: compBrochureSubscribeData.mainField,
                hint: "النشاط الرئيسي",
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                validate: (DropDownModel value) => value.validateDropDown(context),
                onChange: compBrochureSubscribeData.onSelectMain,
                useName: true,
                finData: (filter) async =>
                await CompanyRepository(context).getMainField(refresh: false),
              ),
              BuildFormText(text: "النشاط الفرعي"),
              DropdownTextField<DropDownSelected>(
                dropKey: compBrochureSubscribeData.subField,
                hint: "النشاط الفرعي",
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                onChange: (model) =>
                    compBrochureSubscribeData.onSelectSub(model, context),
                useName: true,
                finData: (filter) async => await CompanyRepository(context)
                    .getSubField(compBrochureSubscribeData.mainFieldId!,
                    refresh: false),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: BlocBuilder<GenericCubit<List<DropDownSelected>>,
                    GenericState<List<DropDownSelected>>>(
                  bloc: compBrochureSubscribeData.subFieldCubit,
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
                                Flexible(
                                  child: MyText(
                                    title: "${state.data[index].name}",
                                    size: 11,
                                    color: MyColors.white,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () =>
                                      compBrochureSubscribeData.onDeleteSub(
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
              BuildFormText(text: "عدد البروشور"),
              LabelTextField(
                hint: "عدد البروشور",
                controller: compBrochureSubscribeData.brochure,
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                action: TextInputAction.next,
                type: TextInputType.number,
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
          ),
        ),
      ),
    );
  }
}
