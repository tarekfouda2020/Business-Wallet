part of 'FirstStepBrochureWidgetsImports.dart';

class BuildContact extends StatelessWidget {
 final BrochureDetailsModel brochureDetailsModel;

  const BuildContact({required this.brochureDetailsModel});
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

                  desc: brochureDetailsModel.phone,
                  onTap: () => Utils.callPhone(phone: brochureDetailsModel.phone),
                ),
              ),
              Expanded(
                flex: 2,
                child: BuildContactItem(
                  title: "البريد الالكتروني",
                  color: Colors.yellow,
                  iconData: MdiIcons.email,
                  desc: brochureDetailsModel.email,
                  onTap: () => Utils.sendMail(brochureDetailsModel.email),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
