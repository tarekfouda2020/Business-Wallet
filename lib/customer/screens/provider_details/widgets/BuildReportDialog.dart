part of 'ProviderDetailsWidgetsImports.dart';

class BuildReportDialog extends StatelessWidget {
  final ProviderDetailsData providerDetailsData;
  final String kayanId;
  final int commentId;
  final String ownerId;

  const BuildReportDialog(
      {required this.providerDetailsData,
      required this.commentId,
      required this.kayanId,
      required this.ownerId});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
      child: Form(
        key: providerDetailsData.formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MyText(
              title: "ابلاغ عن تعليق",
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
              controller: providerDetailsData.report,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              action: TextInputAction.done,
              validate: (value) => value!.validateEmpty(context),
            ),
            LoadingButton(
              btnKey: providerDetailsData.btnKey,
              title: "ابلاغ",
              color: MyColors.primary,
              onTap: () => providerDetailsData.reportComment(
                  context, commentId, kayanId, ownerId),
            ),
          ],
        ),
      ),
    );
  }
}
