part of'NumberWalletWidgetsImports.dart';
class BuildRepeatedText extends StatelessWidget {
  final String title;

  const BuildRepeatedText({required this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 5),
            child: Icon(
              Icons.circle,
              size: 14,
            ),
          ),
          SizedBox(width: 5,),
          Expanded(
            child: MyText(
              title: title,
              size: 11,
              color: MyColors.greyWhite.withOpacity(0.8),
            ),
          ),
        ],
      ),
    );
  }
}
