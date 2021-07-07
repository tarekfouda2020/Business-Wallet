part of 'InvDetailsWidgetsImports.dart';

class BuildInvDescription extends StatelessWidget {
  final String desc;

  const BuildInvDescription({required this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Visibility(
        visible: desc == "",
        child: Center(
          child: MyText(
            title: "لا يوجد",
          ),
        ),
        replacement: Container(
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          child: Html(
            data: desc,
          ),
        ),
      ),
    );
  }
}
