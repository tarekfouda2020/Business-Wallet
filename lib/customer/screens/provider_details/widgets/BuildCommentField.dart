part of 'ProviderDetailsWidgetsImports.dart';

class BuildCommentField extends StatelessWidget {
  final ProviderDetailsData providerDetailsData;
  const BuildCommentField({required this.providerDetailsData});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      color: MyColors.black,
      child: Row(
        children: [
          Icon(Icons.camera_alt),
          Expanded(
            child: LabelTextField(
              hint: "تعليق",
              controller: providerDetailsData.comment,
              validate: (value) => value!.validateEmpty(context),
              margin: const EdgeInsets.symmetric(horizontal: 15),
              minHeight: 30,
              maxHeight: 50,
              borderColor: MyColors.grey,
            ),
          ),
          Icon(Icons.send, color: MyColors.primary,)
        ],
      ),
    );
  }
}
