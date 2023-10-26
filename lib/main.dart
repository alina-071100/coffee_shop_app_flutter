import 'package:coffee_shop_app/screens/home_page.dart';
import 'package:coffee_shop_app/screens/menu_page.dart';
import 'package:coffee_shop_app/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      
      designSize: const Size(360, 640),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            '/': (context) => const HomePage(),
            MenuPage.routeName: (context) => const MenuPage(),
            BottomBar.routeName: (context) => const BottomBar(),
          },
        );
      },
    );
  }
}
