part of 'InvDetailsWidgetsImports.dart';

class BuildInvTitle extends StatelessWidget {
  final String title;
  const BuildInvTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding:
      const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      color: MyColors.black,
      child: MyText(
        title: title,
        size: 13,
      ),
    );
  }
}
