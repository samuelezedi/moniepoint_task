import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:moniepoint_test/src/shared/theme/google_map_style.dart';

class AppGoogleMapWidget extends StatelessWidget {
  const AppGoogleMapWidget({
    required this.onMapCreated,
    required this.positions,
    required this.markers,
    required this.onCameraMove,
    super.key,});

  final Set<Marker> markers;
  final List<LatLng> positions;
  final Function(GoogleMapController controller) onMapCreated;
  final Function(CameraPosition position) onCameraMove;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: GoogleMap(
            onMapCreated: onMapCreated,
            zoomControlsEnabled: false,
            zoomGesturesEnabled: true,
            onCameraMove: onCameraMove,
            style: mapStyle,
            initialCameraPosition: CameraPosition(
              target: positions.isNotEmpty
                  ? positions.first
                  : const LatLng(0, 0),
              zoom: 11.0,
            ),
            markers: markers,
            myLocationButtonEnabled: false,
          ),
        ),
      ],
    );
  }
}
