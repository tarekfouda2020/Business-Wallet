part of 'LocationWidgetsImports.dart';

class BuildGoogleMapView extends StatelessWidget {
  final LocationAddressData locationAddressData;

  const BuildGoogleMapView({required this.locationAddressData});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationCubit, LocationState>(
      builder: (context, state) {
        CameraPosition _initialLoc = CameraPosition(
          target: LatLng(
              double.parse(state.model!.lat), double.parse(state.model!.lng)),
          zoom: 16.4746,
        );
        return Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: GoogleMap(
                mapType: MapType.normal,
                // markers: _markers,
                initialCameraPosition: _initialLoc,
                onMapCreated: (GoogleMapController controller) {
                  locationAddressData.controller.complete(controller);
                },
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
                onTap: (location) {
                  locationAddressData.getLocationAddress(location, context);
                },
                onCameraMove: (loc) =>
                    locationAddressData.getLocationAddress(loc.target, context),
              ),
            ),
            ImageIcon(
              AssetImage(Res.marker),
              size: 80,
              color: MyColors.secondary,
            ),
          ],
        );
      },
    );
  }
}
