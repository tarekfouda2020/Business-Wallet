part of 'FavoriteMapImports.dart';

class FavoriteMap extends StatefulWidget {
  final CompanyFavoriteData companyFavoriteData;

  const FavoriteMap({required this.companyFavoriteData});

  @override
  _FavoriteMapState createState() => _FavoriteMapState();
}

class _FavoriteMapState extends State<FavoriteMap> {
  final FavoriteMapData favoriteMapData = new FavoriteMapData();

  @override
  void initState() {
    super.initState();
    favoriteMapData.getCurrentLocation(context, widget.companyFavoriteData);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericCubit<List<Marker>>, GenericState<List<Marker>>>(
      bloc: favoriteMapData.markersCubit,
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
          onMapCreated: favoriteMapData.onMapCreated,
          onCameraMove: (position) {},
        );
      },
    );
  }
}
