import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({super.key});

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: FlutterMap(
          options: MapOptions(
            initialCenter: LatLng(40.7942, 43.84528),

            // initialCenter: LatLng(51.509364, -0.128928),
            // initialZoom: 9.2,
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.example.app',
            ),
            // RichAttributionWidget(
            //   attributions: [
            //     TextSourceAttribution(
            //       'OpenStreetMap contributors',
            //       onTap: (){},
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
