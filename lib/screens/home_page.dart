import 'package:coffee_shop_app/screens/login/login_page.dart';
import 'package:coffee_shop_app/theme/app_theme.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/home_image2.png'),
                ),
              ),
            ),
          ),
          Center(
            child: SizedBox(
              width: 315,
              height: 129,
              child: Text(
                "Coffee so good, your taste buds will love it.",
                textAlign: TextAlign.center,
                style: AppTheme.homeTitle,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: SizedBox(
              width: 315,
              height: 44,
              child: Text(
                "The best grain, the finest roast, the powerful flavor.",
                textAlign: TextAlign.center,
                style: AppTheme.homeSubtile,
              ),
            ),
          ),

          // GetMaterialApp(
          //         getPages: AppRoutes.routes(),
          //       ),
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 10),
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: Container(
                  width: 315,
                  height: 62,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: AppTheme.bottomColor,
                  ),
                  child: Center(
                    child: Text(
                      'Get Started',
                      textAlign: TextAlign.center,
                      style: AppTheme.bottomText,
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
