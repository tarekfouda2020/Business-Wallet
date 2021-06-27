part of 'CompSpecificAdsWidgetsImports.dart';

class BuildAdsDescription extends StatelessWidget {
  final String desc;

  const BuildAdsDescription({required this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      // child: Html(
      //   data: desc,
      child: MyText(
        title: desc,
        size: 12,
      ),
    );
  }
}
