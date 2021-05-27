part of 'CompSearchMenuImports.dart';

class CompSearchMenu extends StatefulWidget {
  @override
  _CompSearchMenuState createState() => _CompSearchMenuState();
}

class _CompSearchMenuState extends State<CompSearchMenu> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      itemCount: 4,
      itemBuilder: (_, index) {
        return BuildMainItem();
      },
    );
  }
}
