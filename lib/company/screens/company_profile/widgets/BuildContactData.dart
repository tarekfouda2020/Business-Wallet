part of 'CompProfileWidgetsImports.dart';

class BuildContactData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var company = context.watch<UserCubit>().state.model.companyModel;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BuildContactItem(
                title: "رقم الجوال",
                desc: company!.phone!,
                iconData: Icons.phone_in_talk,
                color: Colors.yellow,
                onTap: () => Utils.callPhone(phone: company.phone),
              ),
              BuildContactItem(
                title: "البريد الالكتروني",
                desc: company.email!,
                iconData: Icons.mail_sharp,
                color: Colors.green,
                onTap: () => Utils.sendMail(company.email),
              ),
              BuildContactItem(
                title: "رابط المنشأة",
                desc: company.website == "" ? "لا يوجد" : company.website!,
                iconData: Icons.language,
                color: Colors.blue,
                onTap: () => Utils.launchURL(url: company.website!),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                InkWell(
                  onTap: () => Utils.navigateToMapWithDirection(
                    lat: company.lat ?? "0",
                    lng: company.lng ?? "0",
                    context: context,
                  ),
                  child: BuildContactItem(
                    title: "العنوان",
                    desc: company.address ?? "لا يوجد",
                    iconData: MdiIcons.mapMarkerRadius,
                    color: Colors.red,
                    allLocation: false,
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () => Utils.navigateToMapWithDirection(
              lat: company.lat ?? "0",
              lng: company.lng ?? "0",
              context: context,
            ),
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              height: 140,
              child: ImgMap.Map(
                controller: ImgMap.MapController(
                  location: LatLng(double.parse(company.lat ?? "0"),
                      double.parse(company.lng ?? "0")),
                ),
                builder: (context, x, y, z) {
                  final url =
                      'https://www.google.com/maps/vt/pb=!1m4!1m3!1i$z!2i$x!3i$y!2m3!1e0!2sm!3i420120488!3m7!2sen!5e1105!12m4!1e68!2m2!1sset!2sRoadmap!4e0!5m1!1e0!23i4111425';
                  return CachedImage(
                    url: url,
                    fit: BoxFit.cover,
                    height: 140,
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
