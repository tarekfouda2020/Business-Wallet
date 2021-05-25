part of 'CompBrochureWidgetsImports.dart';

class BuildAddService extends StatelessWidget {
  final CompanyBrochureData companyBrochureData;

  BuildAddService({required this.companyBrochureData});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericCubit<bool>, GenericState<bool>>(
      bloc: companyBrochureData.showService,
      builder: (_, state) {
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
                    onPressed: () => companyBrochureData.showService
                        .onUpdateData(!state.data),
                  ),
                )
              ],
            ),
            Visibility(
              visible: state.data,
              child: BuildServiceItem(
                companyBrochureData: companyBrochureData,
                serviceCubit: companyBrochureData.showService,
              ),
              replacement: Container(),
            )
          ],
        );
      },
    );
  }
}
