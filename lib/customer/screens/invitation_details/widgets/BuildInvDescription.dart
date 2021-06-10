part of 'InvDetailsWidgetsImports.dart';

class BuildInvDescription extends StatelessWidget {
  final String desc;

  const BuildInvDescription({required this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: MyText(
        title: desc,
        size: 11,
      ),
    );
  }
}
