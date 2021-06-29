part of 'FisrtStepSpecialWidgetImports.dart';

class BuildForm extends StatelessWidget {
  final CompSpecialSubscribeData compSpecialSubscribeData;

  const BuildForm({required this.compSpecialSubscribeData});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: compSpecialSubscribeData.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BuildFormText(text: "تاريخ البداية"),
          BlocConsumer<GenericCubit, GenericState>(
            bloc: compSpecialSubscribeData.dateCubit,
            listener: (_, state) {
              compSpecialSubscribeData.startDate.text = state.data;
            },
            builder: (_, state) {
              return InkWellTextField(
                hint: "تاريخ البداية",
                controller: compSpecialSubscribeData.startDate,
                icon: Icon(
                  Icons.calendar_today_outlined,
                ),
                margin: const EdgeInsets.symmetric(vertical: 10),
                validate: (value) => value!.validateEmpty(context),
                onTab: () => compSpecialSubscribeData.getDatePicker(context),
              );
            },
          ),
          BuildFormText(text: "مدة الترقية"),
          DropdownTextField<DropDownModel>(
            dropKey: compSpecialSubscribeData.days,
            label: "مدة الترقية",
            selectedItem: compSpecialSubscribeData.daysModel,
            margin: const EdgeInsets.symmetric(vertical: 10),
            onChange: compSpecialSubscribeData.changeDays,
            validate: (DropDownModel value) => value.validateDropDown(context),
            data: List.generate(30,
                (index) => DropDownModel(id: (index + 1), name: "${index + 1}")),
          ),
          BuildFormText(text: "المنطقة"),
          DropdownTextField<CitiesModel>(
            dropKey: compSpecialSubscribeData.city,
            label: "المنطقة",
            selectedItem: compSpecialSubscribeData.regionModel,
            margin: const EdgeInsets.symmetric(vertical: 10),
            validate: (CitiesModel value) => value.validateDropDown(context),
            onChange: compSpecialSubscribeData.changeRegion,
            useName: true,
            finData: (filter) async =>
                await CompanyRepository(context).getCompCities(3),
          ),
          BuildFormText(text: "تحديد العملاء المهتمين ب"),
          InkWellTextField(
            icon: Icon(Icons.arrow_drop_down),
            controller: compSpecialSubscribeData.interest,
            validate: (value) {},
            margin: const EdgeInsets.symmetric(vertical: 10),
            onTab: () => compSpecialSubscribeData.showInterestDialog(
                context, compSpecialSubscribeData),
            hint: 'تحديد العملاء المهتمين ب',
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: BlocBuilder<GenericCubit<List<DropDownSelected>>,
                GenericState<List<DropDownSelected>>>(
              bloc: compSpecialSubscribeData.interestCubit,
              builder: (_, state) {
                return Wrap(
                  alignment: WrapAlignment.start,
                  runAlignment: WrapAlignment.start,
                  children: List.generate(
                    state.data.length,
                    (index) {
                      return Visibility(
                        visible: state.data[index].selected,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          margin: EdgeInsets.all(5),
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
                                onPressed: () => compSpecialSubscribeData
                                    .onDeletePeopleInterest(
                                        context, state.data[index], index),
                                icon: Icon(
                                  MdiIcons.closeCircle,
                                  size: 23,
                                  color: MyColors.primary,
                                ),
                              )
                            ],
                          ),
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
    );
  }
}
