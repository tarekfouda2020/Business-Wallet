part of 'InvitationMapImports.dart';

class InvitationMapData {
  final GenericCubit<List<Marker>> markersCubit = new GenericCubit([]);
  Completer<GoogleMapController> mapController = Completer();
  late double lat, lng, zoom;
  List<CompInvitationModel> mainData = [];

  void fetchPage(
      BuildContext context, CompanyInvitationData invitationsData) async {
    mainData = await invitationsData.fetchMapPage(context, refresh: false);
    setMarkerWidgets(context);
    setTimer(context);
  }

  getCurrentLocation(
      BuildContext context, CompanyInvitationData invitationsData) async {
    // var loc = await Utils.getCurrentLocation();
    var loc;
    lat = loc?.latitude ?? 24.76006327315991;
    lng = loc?.longitude ?? 46.67399099468996;
    zoom = 10;
    final GoogleMapController controller = await mapController.future;
    final CameraPosition position =
        CameraPosition(target: LatLng(lat, lng), zoom: zoom);
    controller.animateCamera(CameraUpdate.newCameraPosition(position));
    fetchPage(context, invitationsData);
  }

  void onMapCreated(GoogleMapController controller) {
    controller.setMapStyle(json.encode(MapStyle.server));
    mapController.complete(controller);
  }

  List<Marker> mapBitmapsToMarkers(
      List<Uint8List> bitmaps, BuildContext context) {
    List<Marker> markersList = [];
    bitmaps.asMap().forEach((i, bmp) {
      final model = mainData[i];
      markersList.add(Marker(
          onTap: () => navigate(context, model),
          markerId: MarkerId(model.name),
          position: LatLng(double.parse(model.lat), double.parse(model.lng)),
          icon: BitmapDescriptor.fromBytes(bmp)));
    });
    return markersList;
  }

  Widget _getMarkerWidget(CompInvitationModel model) {
    return BuildMapMarker(
      name: model.name,
      img: model.img,
    );
  }

  setTimer(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      setMarkerWidgets(context);
    });
  }

  setMarkerWidgets(context) {
    MarkerGenerator(markerWidgets(), (bitmaps) {
      var markers = mapBitmapsToMarkers(bitmaps, context);
      markersCubit.onUpdateData(markers);
    }).generate(context);
    markersCubit.onUpdateData(markersCubit.state.data);
  }

  List<Widget> markerWidgets() {
    return mainData.map((c) => _getMarkerWidget(c)).toList();
  }

  void navigate(BuildContext context, CompInvitationModel model) {
    AutoRouter.of(context).push(
      CompanyFavDetailsRoute(
        adsId: model.id,
        showSendCard: model.isShowWhenSend,
        sendCard: model.idSendCard,
      ),
    );
  }
}
