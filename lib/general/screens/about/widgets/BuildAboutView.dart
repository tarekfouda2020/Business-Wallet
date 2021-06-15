part of 'AboutWidgetsImports.dart';

class BuildAboutView extends StatelessWidget {
  final String text;

  const BuildAboutView({required this.text});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      children: [
        HeaderLogo(),
        MyText(
          title: text,
          size: 11,
          color: MyColors.white,
        )

      ],
    );
  }
}
