part of 'CompFavDetailsWidgetsImports.dart';

class BuildContact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BuildAdsItem(
          title: "طرق التواصل",
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              BuildContactItem(
                title: "رقم الجوال",
                color: Colors.green,
                iconData: MdiIcons.whatsapp,
                desc: "fdfdfdf",
              ),
              BuildContactItem(
                title: "البريد الالكتروني",
                color: Colors.yellow,
                iconData: MdiIcons.email,
                desc: "Fdfdf",
              ),
            ],
          ),
        )
      ],
    );
  }
}
