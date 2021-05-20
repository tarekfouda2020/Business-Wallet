part of 'SearchViewImports.dart';

class BuildSearchView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 60),
        child: Wrap(
          spacing: 20,
          runSpacing: 20,
          children: List.generate(
              2,
                  (index) => BuildProviderItem()),
        ),
      ),
    );
  }
}
