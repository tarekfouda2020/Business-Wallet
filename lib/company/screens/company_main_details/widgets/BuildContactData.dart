part of 'DetailsWidgetsImports.dart';

class BuildContactData extends StatelessWidget {
  final CompanyMainDetailsData companyMainDetailsData;
  final DetailsModel? detailsModel;

  const BuildContactData(
      {required this.companyMainDetailsData, required this.detailsModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BuildContactItem(
                    title: "رقم الجوال",
                    desc: detailsModel!.phone,
                    iconData: Icons.phone_in_talk,
                    color: Colors.yellow,
                    onTap: () => Utils.callPhone(phone: detailsModel!.phone),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  BuildContactItem(
                    title: "البريد الالكتروني",
                    desc: detailsModel!.email,
                    iconData: Icons.mail_sharp,
                    color: Colors.green,
                    onTap: () => Utils.sendMail(detailsModel!.email),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BuildContactItem(
                    title: "رابط المنشأة",
                    desc: detailsModel!.website,
                    iconData: Icons.language,
                    color: Colors.blue,
                    onTap: () => Utils.launchURL(url: detailsModel!.website),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  BuildContactItem(
                    title: "اجراء محادثة",
                    desc: "اجراء محادثة",
                    iconData: Icons.message,
                    color: Colors.green,
                  ),
                ],
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                BuildContactItem(
                  title: "العنوان",
                  desc: detailsModel!.address,
                  iconData: MdiIcons.mapMarkerRadius,
                  color: Colors.red,
                  allLocation: false,
                ),
              ],
            ),
          ),
          BuildImageMap(lat: detailsModel!.lat, lng: detailsModel!.lng)
        ],
      ),
    );
  }
}
