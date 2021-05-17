part of 'CompRegisterWidgetsImport.dart';

class BuildFormText extends StatelessWidget {
  final String text;

  BuildFormText({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: MyText(
        title: text,
        size: 12,
        color: MyColors.white,
      ),
    );
  }
}
