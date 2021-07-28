part of 'InvitationMapWidgetsImports.dart';

class BuildMapMarker extends StatelessWidget {
  final String img;
  final String name;

  const BuildMapMarker({required this.img, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black, width: 1),
        color: MyColors.darken,
        shape: BoxShape.rectangle,
      ),
      child: MyText(
        title: name,
        size: 12,
        color: MyColors.white,
      ),
    );
  }
}
