part of 'InvDetailsWidgetsImports.dart';

class BuildAddComment extends StatelessWidget {
  final InvitationDetailsData invitationDetailsData;
  const BuildAddComment({required this.invitationDetailsData});
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
              controller: invitationDetailsData.comment,
              validate: (value) => value!.validateEmpty(context),
              margin: const EdgeInsets.symmetric(horizontal: 15),
              minHeight: 30,
              maxHeight: 40,
              borderColor: MyColors.grey,
            ),
          ),
          Icon(
            Icons.send,
            color: MyColors.primary,
          )
        ],
      ),
    );
  }
}
