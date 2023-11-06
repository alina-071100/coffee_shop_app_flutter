import 'package:coffee_shop_app/screens/bag_page.dart';
import 'package:coffee_shop_app/screens/heart_page.dart';
import 'package:coffee_shop_app/screens/menu_page.dart';
import 'package:coffee_shop_app/screens/profile_notifiqation_page.dart';
import 'package:coffee_shop_app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomBar extends StatefulWidget {
  static const String routeName = '/bottom-bar';
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState extends State<BottomBar> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const MenuPage(),
    const LikePage(),
    const BagPage(),
    const ProfileNotificationPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildDot(index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFC67C4E), Color(0xFFEDAB81)],
          stops: [0.2647, 0.7794],
          transform: GradientRotation(
            260.06 * (3.1415 / 180.0),
          ),
        ),
      ),
      width: _selectedIndex == index ? 10 : 0.0,
      height: 5.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: ["Home", "Heart", "Bag", "Notification"]
              .asMap()
              .map(
                (key, value) => MapEntry(
                  key,
                  GestureDetector(
                    onTap: () => _onItemTapped(key),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgPicture.asset(
                          "assets/icons/$value.svg",
                          colorFilter: ColorFilter.mode(
                              _selectedIndex == key
                                  ? AppTheme.buttonColor
                                  : const Color(0xff8D8D8D),
                              BlendMode.srcIn),
                        ),
                        _buildDot(key)
                      ],
                    ),
                  ),
                ),
              )
              .values
              .toList(),
        ),
      ),
    );
  }
}
