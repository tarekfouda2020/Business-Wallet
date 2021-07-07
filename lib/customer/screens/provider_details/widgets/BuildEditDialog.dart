part of 'ProviderDetailsWidgetsImports.dart';

class BuildEditDialog extends StatelessWidget {
  final ProviderDetailsData providerDetailsData;
  final String kayanId;
  final int commentId;

  const BuildEditDialog(
      {required this.providerDetailsData,
      required this.kayanId,
      required this.commentId});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MyText(
            title: "تعديل التعليق",
            color: MyColors.primary,
            size: 14,
          ),
          SizedBox(
            height: 15,
          ),
          RichTextFiled(
            hint: "الرسالة",
            max: 3,
            fillColor: MyColors.greyWhite,
            controller: providerDetailsData.newComment,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            action: TextInputAction.done,
            validate: (value) => value!.validateEmpty(context),
          ),
          LoadingButton(
            btnKey: providerDetailsData.btnKey,
            title: "ابلاغ",
            color: MyColors.primary,
            onTap: () =>
                providerDetailsData.editComment(context, commentId, kayanId),
          ),
        ],
      ),
    );
  }
}
