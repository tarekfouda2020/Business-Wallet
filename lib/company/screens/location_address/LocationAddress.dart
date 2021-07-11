part of 'LocationAddressImports.dart';

class LocationAddress extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _LocationAddress();
}

class _LocationAddress extends State<LocationAddress> {
  final LocationAddressData locationAddressData = new LocationAddressData();

  @override
  void initState() {
    var loc = context.read<LocationCubit>().state.model;
    double lat = double.parse(loc?.lat??"0");
    double lng = double.parse(loc?.lng??"0");
    locationAddressData.getLocationAddress(LatLng(lat, lng), context);
    super.initState();
  }

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
              size: 12,
              color: MyColors.black,
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
