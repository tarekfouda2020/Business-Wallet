part of 'CompanyFavDetailsImports.dart';

class CompanyFavDetails extends StatefulWidget {
  @override
  _CompanyFavDetailsState createState() => _CompanyFavDetailsState();
}

class _CompanyFavDetailsState extends State<CompanyFavDetails> {
  final CompanyFavDetailsData companyFavDetailsData =
      new CompanyFavDetailsData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darken,
      body: Column(
        children: [
          Container(
            height: 190,
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                DefaultAppBar(
                  title: "تفاصيل الاعلان",
                ),
                BuildAdsInfo(),
              ],
            ),
          ),
          Flexible(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
              children: [
                BuildContact(),
                BuildDesc(),
                BuildServices(),
                BuildProducts(),
                BuildAdsOwner(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
