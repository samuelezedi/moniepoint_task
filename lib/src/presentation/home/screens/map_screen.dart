import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:moniepoint_test/src/presentation/home/ui/map_building_info_icon.dart';
import 'package:moniepoint_test/src/presentation/home/ui/map_screen_building_icon.dart';
import 'package:moniepoint_test/src/shared/common_widgets/app_google_map_widget.dart';
import 'package:moniepoint_test/src/shared/common_widgets/app_map_options_widget.dart';
import 'package:moniepoint_test/src/shared/common_widgets/app_search_widget.dart';
import 'package:widget_to_marker/widget_to_marker.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({
    super.key,
  });

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  GoogleMapController? _mapController;
  final Set<Marker> _markers = {};
  final GlobalKey globalKey = GlobalKey();
  int selectorIndex = 2;
  bool showIcon = false;

  List<Offset> _screenPositions = [];

  List<LatLng> positions = const [
    LatLng(27.273186, -82.497817),
    LatLng(27.306599, -82.463510),
    LatLng(27.366051, -82.496118),
    LatLng(27.415738, -82.574052),
    LatLng(27.365618, -82.546036),
    LatLng(27.409395, -82.505939),
  ];

  @override
  void initState() {
    super.initState();
    _loadMarkers();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800), // Duration of animation
      vsync: this,
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );

    Future.delayed(const Duration(seconds: 4), () {
      _controller.forward();
      setState(() {
        showIcon = true;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    double pixelRatio = MediaQuery.of(context).devicePixelRatio;
    int count = 0;

    return Stack(
      children: [
        AppGoogleMapWidget(
          onMapCreated: _onMapCreated,
          onCameraMove: (positions) {
            setState(() {
              positions = positions;
              _updateMarkerScreenPosition();
            });
          },
          positions: positions,
          markers: _markers,
        ),
        AppMapOptionsWidget(
          onTap: (index) {
            setState(() {
              selectorIndex = index;
            });
            if (index == 4) {
              _controller.reverse();
              setState(() {
                showIcon = true;
              });
            }
            if (index == 2) {
              _controller.forward();
            }
          },
          currentIndex: selectorIndex,
        ),
        const AppSearchWidget(),
        for (var i in _screenPositions)
          Positioned(
            left: (i.dx / pixelRatio),
            top: (i.dy / pixelRatio),
            child: SizedBox(
              height: 50,
              child: Stack(
                children: [
                  MapScreenBuildingIcon(showIcon: showIcon),
                  MapBuildingInfoIcon(animation: _animation, count: count++)
                ],
              ),
            ),
          )
      ],
    );
  }

  Future<void> _updateCameraPosition() async {
    if (_mapController == null || _markers.isEmpty) return;
    LatLngBounds bounds;
    if (_markers.length == 1) {
      Marker marker = _markers.first;
      bounds = LatLngBounds(
        southwest: marker.position,
        northeast: marker.position,
      );
    } else {
      LatLng southwest = LatLng(
        _markers
            .map((m) => m.position.latitude)
            .reduce((a, b) => a < b ? a : b),
        _markers
            .map((m) => m.position.longitude)
            .reduce((a, b) => a < b ? a : b),
      );
      LatLng northeast = LatLng(
        _markers
            .map((m) => m.position.latitude)
            .reduce((a, b) => a > b ? a : b),
        _markers
            .map((m) => m.position.longitude)
            .reduce((a, b) => a > b ? a : b),
      );
      bounds = LatLngBounds(
        southwest: southwest,
        northeast: northeast,
      );
    }
    _mapController!.animateCamera(CameraUpdate.newLatLngBounds(bounds, 100));
  }

  Future<void> _onMapCreated(GoogleMapController controller) async {
    _mapController = controller;
    _updateMarkerScreenPosition();
    setState(() {
      _updateCameraPosition();
    });
  }

  Future<void> _updateMarkerScreenPosition() async {
    if (_mapController == null) return;
    List<Offset> list = [];
    for (int i = 0; i < positions.length; i++) {
      var screenCoordinate =
          await _mapController!.getScreenCoordinate(positions[i]);
      list.add(
          Offset(screenCoordinate.x.toDouble(), screenCoordinate.y.toDouble()));
      _screenPositions = list;
    }
  }

  Future<void> _loadMarkers() async {
    List<BitmapDescriptor> icons = [];
    for (int i = 0; i < positions.length; i++) {
      Widget widget = Container(
        color: Colors.black,
        height: 10,
        width: 10,
      );
      BitmapDescriptor icon = await widget.toBitmapDescriptor();
      icons.add(icon);
    }

    for (int i = 0; i < positions.length; i++) {
      final marker = Marker(
        markerId: MarkerId('location$i'),
        position: positions[i],
        infoWindow: InfoWindow(
          title: 'Location $i',
          snippet: 'This is location $i',
        ),
        icon: icons[i],
      );
      _markers.add(marker);
    }
    setState(() {
      _updateCameraPosition();
    });
  }

  @override
  bool get wantKeepAlive => true;
}
