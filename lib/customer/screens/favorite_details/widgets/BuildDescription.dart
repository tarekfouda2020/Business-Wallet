part of 'FavoriteDetailsWidgetsImports.dart';

class BuildDescription extends StatelessWidget {
  final String desc;

  const BuildDescription({required this.desc});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BuildInvTitle(title: " نص اختياري"),
        Visibility(
          visible: desc == "",
          replacement: Container(
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: Html(
              data: desc,
            ),
          ),
          child: Center(
            child: MyText(
              title: "لا يوجد",
            ),
          ),
        ),
      ],
    );
  }
}
