part of 'ProviderDetailsImports.dart';

class ProviderDetails extends StatefulWidget {
  @override
  _ProviderDetailsState createState() => _ProviderDetailsState();
}

class _ProviderDetailsState extends State<ProviderDetails> {
  ProviderDetailsData providerDetailsData = ProviderDetailsData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darken,
      appBar: DefaultAppBar(
        title: "",
        leading: IconButton(
          icon: Icon(
            Icons.share,
            color: MyColors.white,
          ),
          onPressed: () {},
        ),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        children: [
          BuildPicture(),
          BuildInformations(),
          BuildProviderDescription(providerDetailsData: providerDetailsData,),
          BuildContactInfo(
            providerDetailsData: providerDetailsData,
          ),
          BuildSocialInfo(
            providerDetailsData: providerDetailsData,
          ),
          BuildPhotosInfo(providerDetailsData: providerDetailsData),
          BuildCommentsInfo(providerDetailsData: providerDetailsData),
        ],
      ),
      bottomNavigationBar: BuildCommentField(
        providerDetailsData: providerDetailsData,
      ),
    );
  }
}
