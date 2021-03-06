part of 'MapScreenImports.dart';

class MapScreen extends StatefulWidget {
  final CompanySearchData searchData;

  const MapScreen({required this.searchData});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final MapScreenData mapScreenData = new MapScreenData();

  @override
  void initState() {
    super.initState();
    mapScreenData.getCurrentLocation(context, widget.searchData);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericCubit<List<Marker>>, GenericState<List<Marker>>>(
      bloc: mapScreenData.markersCubit,
      builder: (_, state) {
        return GoogleMap(
          compassEnabled: true,
          myLocationEnabled: true,
          mapToolbarEnabled: true,
          zoomControlsEnabled: true,
          zoomGesturesEnabled: true,
          initialCameraPosition: CameraPosition(
              target: LatLng(24.76006327315991, 46.67399099468996), zoom: 10),
          markers: state.data.toSet(),
          onMapCreated: mapScreenData.onMapCreated,
          onCameraMove: (position) {
            mapScreenData.lat = position.target.latitude;
            mapScreenData.lng = position.target.longitude;
            mapScreenData.zoom = position.zoom;
            mapScreenData.fetchPage(context, widget.searchData);
          },
        );
      },
    );
  }
}
