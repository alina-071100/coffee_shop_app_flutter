// import 'package:flutter/material.dart';
// import 'package:stylish_bottom_bar/model/bar_items.dart';
// import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

// class CustomNavBar extends StatelessWidget {
//   const CustomNavBar({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     const selectedColor = Color(0xFFC67C4E);
//     const unSelectedColor = Color(0xff53585C);
//     const currentIndex = 0;

//     return SizedBox(
//       height: 120,
//       child: StylishBottomBar(
//         backgroundColor: const Color(0xff0D1015),
//         items: [
//           BottomBarItem(
//             icon: const Icon(
//               Icons.home,
//             ),
//             selectedIcon: const Icon(Icons.home),
//             selectedColor: selectedColor,
//             unSelectedColor: unSelectedColor,
//             title: const Text('All'),
//           ),
//           BottomBarItem(
//             icon: const Icon(Icons.shopping_bag_rounded),
//             selectedIcon: const Icon(Icons.shopping_bag_rounded),
//             selectedColor: selectedColor,
//             unSelectedColor: unSelectedColor,
//             title: const Text('Completed'),
//           ),
//           BottomBarItem(
//             icon: const Icon(Icons.favorite),
//             selectedIcon: const Icon(Icons.favorite),
//             selectedColor: selectedColor,
//             unSelectedColor: unSelectedColor,
//             title: const Text('Pending'),
//           ),
//           BottomBarItem(
//             icon: const Icon(Icons.notification_add_rounded),
//             selectedIcon: const Icon(Icons.notification_add_rounded),
//             selectedColor: selectedColor,
//             unSelectedColor: unSelectedColor,
//             title: const Text('Reminders'),
//           ),
//         ],
//         hasNotch: true,
//         fabLocation: StylishBarFabLocation.center,
//         currentIndex: currentIndex,
//         onTap: (index) {},
//         option: AnimatedBarOptions(
//           iconSize: 25,
//           barAnimation: BarAnimation.fade,
//           iconStyle: IconStyle.simple,
//           opacity: 0.4,
//         ),
//       ),
//     );
//   }
// }
