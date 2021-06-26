part of 'CompBusinessAdsImports.dart';

class CompBusinessAds extends StatefulWidget {
  final int adsId;

  const CompBusinessAds({required this.adsId});

  @override
  _CompBusinessAdsState createState() => _CompBusinessAdsState();
}

class _CompBusinessAdsState extends State<CompBusinessAds> {
  final CompBusinessAdsData compBusinessAdsData = new CompBusinessAdsData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darken,
      appBar: DefaultAppBar(
        title: "تفاصيل الاعلان",
      ),
    );
  }
}
