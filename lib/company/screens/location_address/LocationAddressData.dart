part of 'LocationAddressImports.dart';

class LocationAddressData {
  final GlobalKey<ScaffoldState> _scaffold = new GlobalKey<ScaffoldState>();
  final Completer<GoogleMapController> controller = Completer();
  late CameraPosition initialLoc;
  final String apiKey = "AIzaSyDIBH6mfPQ13UnF9aZtmaUQtuu-mQcxxb0";

  final GenericCubit<LocationModel?> locationCubit =
      new GenericCubit(LocationModel("", "", ""));

  Set<Marker> markers = {};
  LocationModel? locationModel;

  void getLocationAddress(LatLng position, BuildContext context) async {
    setAddMarker("current", position);
    LatLng loc = position;
    String address = await getAddress(loc, context);
    locationModel = LocationModel(
        loc.latitude.toString(), loc.longitude.toString(), address);
    context.read<LocationCubit?>()!.onLocationUpdated(locationModel!);
  }

  Future<String> getAddress(LatLng latLng, BuildContext context) async {
    final coordinates = new Coordinates(latLng.latitude, latLng.longitude);
    List<Address> addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;
    print("${first.featureName} : ${first.addressLine}");
    return first.addressLine;
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(
      data.buffer.asUint8List(),
    );
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  void setAddMarker(id, position) async {
    markers.clear();
    //Uint8List markerIcon = await getBytesFromAsset('images/maps.png', 10);
    markers.add(Marker(
      // This marker id can be anything that uniquely identifies each marker.
      markerId: MarkerId(id),
      position: position,
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    ));
    // setState(() {});
  }

  void changeLocation(BuildContext context) async {
    context
        .read<LocationCubit>()
        .onLocationUpdated(locationModel!, change: true);
    AutoRouter.of(context).pop();
  }
}
