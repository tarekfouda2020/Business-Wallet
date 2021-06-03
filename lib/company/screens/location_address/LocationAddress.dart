part of 'LocationAddressImports.dart';

class LocationAddress extends StatefulWidget {
  final double lat;
  final double lng;

  const LocationAddress({required this.lat, required this.lng});

  @override
  State<StatefulWidget> createState() => _LocationAddress();
}

class _LocationAddress extends State<LocationAddress> {
  final LocationAddressData locationAddressData = new LocationAddressData();

  @override
  void initState() {
    locationAddressData.locationCubit
        .onUpdateData(LocationModel("${widget.lat}", "${widget.lng}", ""));
    locationAddressData.getLocationAddress(
        LatLng(widget.lat, widget.lng), context);
    locationAddressData.initialLoc = CameraPosition(
      target: LatLng(widget.lat, widget.lng),
      zoom: 16.4746,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: locationAddressData._scaffold,
      appBar: AppBar(
        title: BlocBuilder<LocationCubit, LocationState>(
          builder: (context, state) {
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
          padding: const EdgeInsets.symmetric(horizontal: 5),
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
