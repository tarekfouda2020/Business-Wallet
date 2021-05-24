part of'NumberWalletWidgetsImports.dart';
class BuildNumberWalletView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BuildNumberWalletText(),
            BuildCode(),
          ],
        ),
      ),
    );
  }
}
