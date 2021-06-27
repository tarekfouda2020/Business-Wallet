part of 'CompFavDetailsWidgetsImports.dart';

class BuildContact extends StatelessWidget {
  final CompFavDetailsModel compFavDetailsModel;

  const BuildContact({required this.compFavDetailsModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BuildAdsItem(
          title: "طرق التواصل",
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
          child: Row(
            children: [
              Expanded(
                flex:1,
                child: BuildContactItem(
                  title: "رقم الجوال",
                  color: Colors.green,
                  iconData: MdiIcons.whatsapp,
                  desc: compFavDetailsModel.phone,
                  onTap: () => Utils.callPhone(phone: compFavDetailsModel.phone),
                ),
              ),
              Expanded(
                flex: 2,
                child: BuildContactItem(
                  title: "البريد الالكتروني",
                  color: Colors.yellow,
                  desc: compFavDetailsModel.email,
                  iconData: MdiIcons.email,
                  onTap: () => Utils.sendMail(compFavDetailsModel.email),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
