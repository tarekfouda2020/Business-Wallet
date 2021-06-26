part of 'CompBrochureWidgetsImports.dart';

class BuildAddService extends StatelessWidget {
  final CompanyBrochureData companyBrochureData;

  BuildAddService({required this.companyBrochureData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 5,
              child: LabelTextField(
                hint: "الخدمات ",
                controller: companyBrochureData.service,
                action: TextInputAction.next,
                type: TextInputType.emailAddress,
                margin: const EdgeInsets.symmetric(vertical: 10),
                validate: (value) => value!.validateEmpty(context),
              ),
            ),
            Expanded(
              flex: 1,
              child: IconButton(
                icon: Icon(
                  MdiIcons.plusCircle,
                  color: MyColors.primary,
                  size: 35,
                ),
                onPressed: companyBrochureData.addService,
              ),
            )
          ],
        ),
        BlocBuilder<GenericCubit<List<AddBrochureServiceModel>>,
            GenericState<List<AddBrochureServiceModel>>>(
          bloc: companyBrochureData.addBrochureServiceModelCubit,
          builder: (_, state) {
            return Column(
              children: List.generate(
                state.data.length,
                (index) {
                  return BuildServiceItem(
                    model: state.data[index],
                    index: index,
                    companyBrochureData: companyBrochureData,
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
