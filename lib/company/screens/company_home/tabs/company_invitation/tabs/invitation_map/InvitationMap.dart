part of 'InvitationMapImports.dart';

class InvitationMap extends StatefulWidget {
  final CompanyInvitationData companyInvitationData;

  const InvitationMap({required this.companyInvitationData});

  @override
  _InvitationMapState createState() => _InvitationMapState();
}

class _InvitationMapState extends State<InvitationMap> {
  final InvitationMapData invitationMapData = new InvitationMapData();

  @override
  void initState() {
    super.initState();
    invitationMapData.getCurrentLocation(context, widget.companyInvitationData);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericCubit<List<Marker>>, GenericState<List<Marker>>>(
      bloc: invitationMapData.markersCubit,
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
          onMapCreated: invitationMapData.onMapCreated,
          onCameraMove: (position) {},
        );
      },
    );
  }
}
