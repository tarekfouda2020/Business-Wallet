part of 'MainViewImports.dart';

class BuildMainPageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 60),
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                child: Wrap(
          spacing: 20,
          runSpacing: 20,
          children: List.generate(10, (index) => BuildProviderItem()),
        ),
      ),
    );
  }
}
