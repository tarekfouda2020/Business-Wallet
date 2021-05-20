part of 'ProviderDetailsWidgetsImports.dart';

class BuildTitle extends StatelessWidget {
  final String title;
  const BuildTitle({required this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(10),
      color: MyColors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MyText(title: title),
          Icon(Icons.keyboard_arrow_down_sharp)
        ],
      ),
    );
  }
}
