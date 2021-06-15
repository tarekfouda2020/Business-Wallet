part of 'TermsWidgetsImports.dart';

class BuildTermsView extends StatelessWidget {
  final String text;

  const BuildTermsView({required this.text});

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
