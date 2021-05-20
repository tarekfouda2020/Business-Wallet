part of 'ProviderDetailsWidgetsImports.dart';

class BuildContactInfo extends StatelessWidget {
  final ProviderDetailsData providerDetailsData;

  const BuildContactInfo({required this.providerDetailsData});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericCubit<bool>, GenericState<bool>>(
      bloc: providerDetailsData.contactCubit,
  builder: (context, state) {
    return Column(
      children: [
        BuildTitle(
          title: "معلومات التواصل",
          onTap: ()=> providerDetailsData.contactCubit.onUpdateData(!state.data),
          open: state.data,
        ),
        Visibility(
          visible: state.data,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                          detail: "01234567890",
                          icon: Icons.phone_in_talk,
                          iconColor: Colors.green,
                        ),
                        SizedBox(height: 20,),
                        BuildContactWidget(
                          title: "البريد الالكتروني",
                          detail: "aaa@gmail.com",
                          icon: Icons.mail_sharp,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BuildContactWidget(
                          title: "رابط المنشأة",
                          detail: "wwww.wwww.com",
                          icon: Icons.language,
                          iconColor: Colors.blue,
                        ),
                        SizedBox(height: 20,),
                        BuildContactWidget(
                          title: "اجراء محادثة",
                          detail: "اجراء محادثة",
                          icon: Icons.message,
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  child: BuildContactWidget(
                    title: "العنوان",
                    detail: "اسم المنطقة، اسم المدينة، السعودية",
                    icon: Icons.location_on,
                    iconColor: Colors.red,
                  ),
                ),
                Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width * 0.8,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Image.asset(Res.pic, fit: BoxFit.fill,),
                )
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
