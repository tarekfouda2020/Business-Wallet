import 'package:base_flutter/general/utilities/utils_functions/UtilsImports.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:map/map.dart';
import 'package:latlng/latlng.dart';

class BuildImageMap extends StatefulWidget {
  final String lat;
  final String lng;

  const BuildImageMap({required this.lat, required this.lng});

  @override
  _BuildImageMapState createState() => _BuildImageMapState();
}

class _BuildImageMapState extends State<BuildImageMap> {
  @override
  Widget build(BuildContext context) {
    final controller = MapController(
      location: LatLng(double.parse(widget.lat), double.parse(widget.lng)),
    );

    return InkWell(
      onTap: () => Utils.navigateToMapWithDirection(
          lat: widget.lat, lng: widget.lng, context: context),
      child: Container(
        height: 200,
        child: MapLayoutBuilder(
          controller: controller,
          builder: (context, transformer) {
            return GestureDetector(
              behavior: HitTestBehavior.opaque,
              child: Listener(
                behavior: HitTestBehavior.opaque,
                onPointerSignal: (event) {
                  if (event is PointerScrollEvent) {
                    final delta = event.scrollDelta;

                    controller.zoom -= delta.dy / 1000;
                    setState(() {});
                  }
                },
                child: Map(
                  controller: controller,
                  builder: (context, x, y, z) {
                    final url =
                        'https://www.google.com/maps/vt/pb=!1m4!1m3!1i$z!2i$x!3i$y!2m3!1e0!2sm!3i420120488!3m7!2sen!5e1105!12m4!1e68!2m2!1sset!2sRoadmap!4e0!5m1!1e0!23i4111425';

                    return CachedNetworkImage(
                      imageUrl: url,
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
