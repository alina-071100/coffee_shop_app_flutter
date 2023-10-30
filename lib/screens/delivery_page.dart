import 'package:coffee_shop_app/widgets/custom_app_bar.dart';
import 'package:coffee_shop_app/widgets/map_widget.dart';
import 'package:coffee_shop_app/widgets/panel_widget.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class DeliveryPage extends StatefulWidget {
  const DeliveryPage({super.key});

  @override
  State<DeliveryPage> createState() => _DeliveryPageState();
}

class _DeliveryPageState extends State<DeliveryPage> {
  @override
  Widget build(BuildContext context) {
    // final panelHeightClosed = MediaQuery.of(context).size.height * 0.3;
    final panelHeightOpen = MediaQuery.of(context).size.height * 0.5;

    // var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          SlidingUpPanel(
            body: const MapWidget(),
            maxHeight: panelHeightOpen,
            minHeight: 310,
            parallaxEnabled: true,
            parallaxOffset: .5,
            panelBuilder: (controller) => PanelWidget(
              controller: controller,
            ),
            borderRadius: BorderRadius.circular(24),
          ),
          Positioned(
            child: CustomAppBar(
              functionBackIcon: () {
                Navigator.pop(context);
              },
            ),
            left: 30,
          ),
        ],
      ),

      // bottomSheet: DraggableScrollableSheet(
      //   expand: false,
      //   builder: (BuildContext context, ScrollController scrollController) {
      //     return SingleChildScrollView(
      //       controller: scrollController,
      //       child: Container(
      //         color: const Color.fromARGB(255, 97, 23, 23),
      //         height: 322,

      //         child: Column(children: [
      //           Container(
      //               // height: 100,
      //               )
      //         ]),
      //       ),
      //     );
      //   },
      // ),
      // body: SizedBox(
      //   width: size.width,
      //   height: size.height,
      //   child: FlutterMap(
      //     options: const MapOptions(
      //       initialCenter: LatLng(40.7942, 43.84528),

      //       // initialCenter: LatLng(51.509364, -0.128928),
      //       // initialZoom: 9.2,
      //     ),
      //     children: [
      //       TileLayer(
      //         urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
      //         userAgentPackageName: 'com.example.app',
      //       ),
      //       // RichAttributionWidget(
      //       //   attributions: [
      //       //     TextSourceAttribution(
      //       //       'OpenStreetMap contributors',
      //       //       onTap: (){},
      //       //     ),
      //       //   ],
      //       // ),
      //     ],
      //   ),
      // ),
    );
  }
}
