part of 'CompProfileWidgetsImports.dart';

class BuildContactData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var company = context.read<UserCubit>().state.model.companyModel;

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
                BuildContactItem(
                  title: "العنوان",
                  desc: company.address == "" ? "لا يوجد" : company.address!,
                  iconData: MdiIcons.mapMarkerRadius,
                  color: Colors.red,
                  allLocation: false,
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: CachedImage(
              url:
                  "https://www.ibelieveinsci.com/wp-content/uploads/GettyImages-498928946-59cd1dd3af5d3a0011d3a87e.jpg",
              width: MediaQuery.of(context).size.width,
              height: 130,
            ),
          )
        ],
      ),
    );
  }
}
