part of 'ProviderDetailsWidgetsImports.dart';

class BuildPicture extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              image: AssetImage(Res.pic),
              fit: BoxFit.fill
          )
      ),
    );
  }
}
