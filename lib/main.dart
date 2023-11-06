import 'package:coffee_shop_app/provider/favorit_page_provider.dart';
import 'package:coffee_shop_app/screens/home_page.dart';
import 'package:coffee_shop_app/screens/menu_page.dart';
import 'package:coffee_shop_app/widgets/navigation_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'provider/menu_page_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyDmxZbHsY7NcX5aLA3my_PseDojF0eekaE",
          appId: "1:579365096786:android:b152a8232d3a03cf847e8b",
          messagingSenderId: "579365096786",
          projectId: "coffeeshop-4d095"));
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MenuPageProvider()),
        ChangeNotifierProvider(create: (context) => FavouritListProvider())
      ],
      child: const MyApp(),
    ),
  );
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
