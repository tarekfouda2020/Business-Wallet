part of'EditProfileWidgetsImports.dart';
class BuildEditProfileHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: MyColors.black,
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          BuildEditProfilePhoto(),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: MyText(
                title: "احمد زقزوق",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
