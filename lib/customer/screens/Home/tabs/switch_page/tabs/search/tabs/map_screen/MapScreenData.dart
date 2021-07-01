part of 'MapScreenImports.dart';

class MapScreenData{

  final GenericCubit<List<Marker>> markersCubit = new GenericCubit([]);
  Completer<GoogleMapController> mapController = Completer();
  late double lat, lng , zoom;
  List<MainModel> mainData=[];
  void fetchPage(BuildContext context,SearchData searchData) async {
    mainData = await searchData.fetchMapData(context, lat, lng, zoom);
   setMarkerWidgets(context);
   setTimer(context);
  }

  getCurrentLocation(BuildContext context,SearchData searchData)async{
    // var loc = await Utils.getCurrentLocation();
    var loc ;
    lat=loc?.latitude??24.76006327315991;
    lng=loc?.longitude??46.67399099468996;
    zoom = 10;
    final GoogleMapController controller = await mapController.future;
    final CameraPosition position = CameraPosition(
        target: LatLng(lat, lng), zoom: zoom);
    controller.animateCamera(CameraUpdate.newCameraPosition(position));
    fetchPage(context,searchData);
  }



  void onMapCreated(GoogleMapController controller) {
    controller.setMapStyle(json.encode(MapStyle.server));
    mapController.complete(controller);
  }

  List<Marker> mapBitmapsToMarkers(List<Uint8List> bitmaps,BuildContext context) {
    List<Marker> markersList = [];
    bitmaps.asMap().forEach((i, bmp) {
      final model = mainData[i];
      markersList.add(Marker(
          onTap: ()=> navigate(context, false,mainModel: model),
          markerId: MarkerId(model.kayanName),
          position: LatLng(double.parse(model.lat), double.parse(model.lng)),
          icon: BitmapDescriptor.fromBytes(bmp)));
    });
    return markersList;
  }

  Widget _getMarkerWidget(MainModel model) {
    return BuildMapMarker(mainModel: model,);
  }

  setTimer(BuildContext context){
    Future.delayed(Duration(seconds: 3), (){
      setMarkerWidgets(context);
    });
  }

  setMarkerWidgets(context){
    MarkerGenerator(markerWidgets(), (bitmaps) {
      var markers = mapBitmapsToMarkers(bitmaps,context);
      markersCubit.onUpdateData(markers);
    }).generate(context);
    markersCubit.onUpdateData(markersCubit.state.data);
  }


  List<Widget> markerWidgets() {
    return mainData.map((c) => _getMarkerWidget(c)).toList();
  }

  void navigate(BuildContext context, bool checkFollow,{MainModel? mainModel, FollowerModel? followerModel}) {
    if (checkFollow == true) {
      AutoRouter.of(context)
          .push(ProviderDetailsRoute(kayanId: followerModel!.id));
    } else {
      AutoRouter.of(context)
          .push(ProviderDetailsRoute(kayanId: mainModel!.kayanId));
    }
  }

}

