part of 'LocationAddressImports.dart';

class LocationAddress extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _LocationAddress();
}

class _LocationAddress extends State<LocationAddress> {
  final LocationAddressData locationAddressData = new LocationAddressData();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: locationAddressData._scaffold,
      backgroundColor: MyColors.darken,
      appBar: AppBar(
        title: BlocBuilder<LocationCubit,LocationState>(
          builder: (context,state){
            return MyText(
              title: "${state.model!.address}",
              size: 10,
              color: MyColors.white,
            );
          },
        ),
        backgroundColor: MyColors.primary,
        automaticallyImplyLeading: false,
        centerTitle: true,
        flexibleSpace: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
        ),
      ),
      body: BuildGoogleMapView(
        locationAddressData: locationAddressData,
      ),
      floatingActionButton: BuildSaveButton(
        locationAddressData: locationAddressData,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
