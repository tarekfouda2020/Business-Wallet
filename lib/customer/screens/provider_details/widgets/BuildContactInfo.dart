part of 'ProviderDetailsWidgetsImports.dart';

class BuildContactInfo extends StatelessWidget {
  final ProviderDetailsData providerDetailsData;
  final DetailsModel? detailsModel;

  const BuildContactInfo(
      {required this.providerDetailsData, required this.detailsModel});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericCubit<bool>, GenericState<bool>>(
      bloc: providerDetailsData.contactCubit,
      builder: (context, state) {
        return Column(
          children: [
            BuildTitle(
              title: "معلومات التواصل",
              onTap: () =>
                  providerDetailsData.contactCubit.onUpdateData(!state.data),
              open: state.data,
            ),
            Visibility(
              visible: state.data,
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BuildContactWidget(
                              title: "رقم الجوال",
                              detail: detailsModel!.phone == ""
                                  ? "لا يوجد"
                                  : detailsModel!.phone,
                              icon: Icons.phone_in_talk,
                              iconColor: Colors.green,
                              onTap: () =>
                                  Utils.callPhone(phone: detailsModel!.phone),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            BuildContactWidget(
                              title: "البريد الالكتروني",
                              detail:detailsModel!.email == ""
                                  ? "لا يوجد"
                                  : detailsModel!.email,
                              icon: Icons.mail_sharp,
                              iconColor: Colors.yellow,
                              onTap: () => Utils.sendMail(detailsModel!.email),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BuildContactWidget(
                              title: "رابط المنشأة",
                              detail: detailsModel!.website == ""
                                  ? "لا يوجد"
                                  : detailsModel!.website,
                              icon: Icons.language,
                              iconColor: Colors.blue,
                              onTap: () =>
                                  Utils.launchURL(url: detailsModel!.website),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            BuildContactWidget(
                              title: "اجراء محادثة",
                              detail: "اجراء محادثة",
                              icon: Icons.message,
                              iconColor: Colors.yellow,

                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      child: BuildContactWidget(
                        title: "العنوان",
                        detail: detailsModel!.address == ""
                            ? "لا يوجد"
                            : detailsModel!.address,
                        icon: Icons.location_on,
                        iconColor: Colors.red,
                        allLocation: false,

                      ),
                    ),
                    BuildImageMap(lat: detailsModel!.lat, lng: detailsModel!.lng)

                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
