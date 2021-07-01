part of 'MapScreenImports.dart';

class MapScreenData{

  final GenericCubit<List<Marker>> markersCubit = new GenericCubit([]);
  late GoogleMapController mapController;
  late Timer timer;
  List<MainModel> mainData=[];
  void fetchPage(BuildContext context, {bool refresh = true}) async {
    mainData = await CustomerRepository(context)
        .getMainFiltered(1, 0, 0, 0,refresh);
   setMarkerWidgets(context);
   setTimer(context);
  }

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;

    mapController.setMapStyle(json.encode(MapStyle.server));
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
    timer = Timer.periodic(Duration(seconds: 2), (_){
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

