part of 'CompBrochureWidgetsImports.dart';

class BuildServiceItem extends StatelessWidget {
  final AddBrochureServiceModel model;
  final CompanyBrochureData companyBrochureData;
  final int index;

  BuildServiceItem(
      {required this.model,
      required this.companyBrochureData,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: LabelTextField(
            hint: "اسم الخدمة",
            controller: model.serviceName,
            action: TextInputAction.next,
            type: TextInputType.text,
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
            controller: model.servicePrice,
            action: TextInputAction.next,
            type: TextInputType.phone,
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
            onPressed: () => companyBrochureData.removeService(index),
          ),
        )
      ],
    );
  }
}
