part of 'ProviderDetailsImports.dart';

class ProviderDetails extends StatefulWidget {
  @override
  _ProviderDetailsState createState() => _ProviderDetailsState();
}

class _ProviderDetailsState extends State<ProviderDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darken,
      appBar: DefaultAppBar(
          title: "",
        leading: IconButton(
          icon: Icon(Icons.share, color: MyColors.white,),
          onPressed: (){},
        ),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        children: [
          BuildPicture(),
          BuildInformations(),
          BuildTitle(title: "معلومات التواصل",),
          BuildTitle(title: "روابط التواصل الإجتماعي",),
          BuildTitle(title: "الصور",),
          BuildTitle(title: "التعليقات",),
        ],
      ),
    );
  }
}
