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
            left: 30,
            child:  CustomAppBar(
              functionBackIcon: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
