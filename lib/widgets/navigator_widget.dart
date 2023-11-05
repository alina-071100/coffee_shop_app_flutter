import 'package:coffee_shop_app/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';

class NavigatorWidget extends StatefulWidget {
  const NavigatorWidget({super.key});

  @override
  State<NavigatorWidget> createState() => _NavigatorState();
}

class _NavigatorState extends State<NavigatorWidget> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: BottomBar(),
    );
  }
}
