part of 'MapScreenImports.dart';

class MapScreen extends StatefulWidget {
  final CompanyMainData mainPageData;

  const MapScreen({required this.mainPageData});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final MapScreenData mapScreenData = new MapScreenData();

  @override
  void initState() {
    super.initState();
    mapScreenData.getCurrentLocation(context, widget.mainPageData);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: Platform.isIOS ? 100 : 60),
      child:
          BlocBuilder<GenericCubit<List<Marker>>, GenericState<List<Marker>>>(
        bloc: mapScreenData.markersCubit,
        builder: (_, state) {
          if (state is GenericUpdateState) {
            return GoogleMap(
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
              rotateGesturesEnabled: true,
              scrollGesturesEnabled: true,
              trafficEnabled: true,
              zoomControlsEnabled: true,
              tiltGesturesEnabled: true,
              compassEnabled: true,
              indoorViewEnabled: true,
              buildingsEnabled: true,
              mapToolbarEnabled: true,
              zoomGesturesEnabled: true,
              initialCameraPosition: CameraPosition(
                  target: LatLng(24.76006327315991, 46.67399099468996),
                  zoom: 10),
              markers: state.data.toSet(),
              onMapCreated: mapScreenData.onMapCreated,
              onCameraMove: (position) {
                mapScreenData.lat = position.target.latitude;
                mapScreenData.lng = position.target.longitude;
                mapScreenData.zoom = position.zoom;
                mapScreenData.fetchPage(context, widget.mainPageData);
              },
            );
          } else {
            return Center(
              child: LoadingDialog.showLoadingView(),
            );
          }
        },
      ),
    );
  }
}
