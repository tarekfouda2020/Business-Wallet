part of 'CompBrochureWidgetsImports.dart';

class BuildServiceItem extends StatelessWidget {
  final CompanyBrochureData companyBrochureData;
  final GenericCubit serviceCubit;

  BuildServiceItem(
      {required this.companyBrochureData, required this.serviceCubit});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: LabelTextField(
            hint: "اسم الخدمة",
            controller: companyBrochureData.serviceName,
            action: TextInputAction.next,
            type: TextInputType.emailAddress,
            margin: const EdgeInsets.symmetric(vertical: 15),
            validate: (value) => value!.validateEmpty(context),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          flex: 3,
          child: LabelTextField(
            hint: "سعر الخدمة",
            controller: companyBrochureData.servicePrice,
            action: TextInputAction.next,
            type: TextInputType.emailAddress,
            margin: const EdgeInsets.symmetric(vertical: 5),
            validate: (value) => value!.validateEmpty(context),
          ),
        ),
        Expanded(
          flex: 1,
          child: IconButton(
            icon: Icon(
              Icons.clear,
              color: MyColors.primary,
            ),
            onPressed: () => companyBrochureData.showService
                .onUpdateData(!serviceCubit.state.data),
          ),
        )
      ],
    );
  }
}
