part of 'EditActivityWidgetsImports.dart';

class BuildSecondaryBranch extends StatelessWidget {
  final CompanyEditActivityData companyEditActivityData;

  BuildSecondaryBranch({required this.companyEditActivityData});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BuildFormText(text: "النشاط الفرعي"),
        DropdownTextField<DropDownSelected>(
          dropKey: companyEditActivityData.subField,
          hint: "النشاط الفرعي",
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          validate: (DropDownSelected value) => value.validateDropDown(context),
          onChange: (model) =>
              companyEditActivityData.onSelectSub(model, context),
          useName: true,
          finData: (filter) async => await CompanyRepository(context)
              .getSubField(companyEditActivityData.mainFieldId!.id,
                  refresh: false),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: BlocBuilder<GenericCubit<List<DropDownSelected>>,
              GenericState<List<DropDownSelected>>>(
            bloc: companyEditActivityData.subFieldCubit,
            builder: (_, state) {
              return Wrap(
                alignment: WrapAlignment.start,
                runSpacing: 10,
                spacing: 10,
                runAlignment: WrapAlignment.start,
                children: [
                  ...state.data.map(
                    (e) => Container(
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
                            title: "${e.name}",
                            size: 11,
                            color: MyColors.white,
                          ),
                          IconButton(
                            onPressed: () =>
                                companyEditActivityData.onDeleteSub(context, e),
                            icon: Icon(
                              MdiIcons.closeCircle,
                              size: 23,
                              color: MyColors.primary,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
