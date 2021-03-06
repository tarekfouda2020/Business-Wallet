part of 'MapScreenImports.dart';

class MapScreen extends StatefulWidget {
  final FavoritesData favoritesData;

  const MapScreen({required this.favoritesData});
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  final MapScreenData mapScreenData = new MapScreenData();

  @override
  void initState() {
    super.initState();
    mapScreenData.getCurrentLocation(context,widget.favoritesData);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BuildChangeView2(
          onTap: (tab)=>widget.favoritesData.pagesCubit.onUpdateData(tab),
        ),

        BlocBuilder<GenericCubit<List<Marker>>, GenericState<List<Marker>>>(
          bloc: mapScreenData.markersCubit,
          builder: (_, state) {
            return Flexible(
              child: GoogleMap(
                compassEnabled: true,
                myLocationEnabled: true,
                mapToolbarEnabled: true,
                zoomControlsEnabled: true,
                zoomGesturesEnabled: true,
                initialCameraPosition:
                CameraPosition(target: LatLng(24.76006327315991, 46.67399099468996), zoom: 10),
                markers: state.data.toSet(),
                onMapCreated: mapScreenData.onMapCreated,
                onCameraMove: (position) {},
              ),
            );
          },
        ),
      ],
    );
  }

}


