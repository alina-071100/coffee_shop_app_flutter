// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:coffee_shop_app/data/coffee_data.dart';
// import 'package:coffee_shop_app/models/coffee_models.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:iconsax/iconsax.dart';

// class TextCArusel extends StatefulWidget {
//   const TextCArusel({super.key});

//   @override
//   State<TextCArusel> createState() => _TextCAruselState();
// }

// class _TextCAruselState extends State<TextCArusel> {
//   int _current = 0;
//   final CarouselController _controller = CarouselController();

//   List<Widget> listt = [
//     Container(
//         color: Color.fromARGB(255, 198, 58, 58),
//         child: GridView.builder(
//             itemCount: coffeeList.length,
//             gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
//                 maxCrossAxisExtent: 200,
//                 crossAxisSpacing: 16,
//                 mainAxisSpacing: 20,
//                 childAspectRatio: 0.60),
//             itemBuilder: (context, index) {
//               CoffeeModel coffee = coffeeList[index];
//               return Container(
//                 padding: const EdgeInsets.all(4),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(16),
//                 ),
//                 child: Column(children: [
//                   Expanded(
//                       child: Container(
//                     alignment: Alignment.topRight,
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(16),
//                       image: DecorationImage(
//                         fit: BoxFit.cover,
//                         image: AssetImage(coffee.image),
//                       ),
//                     ),
//                     child: Row(
//                       children: [
//                         Container(
//                           width: 60,
//                           height: 25,
//                           decoration: BoxDecoration(
//                               color: const Color.fromRGBO(0, 0, 0, 0.16),
//                               borderRadius: const BorderRadius.only(
//                                 topLeft: Radius.circular(16),
//                                 bottomRight: Radius.circular(16),
//                               ),
//                               boxShadow: [
//                                 BoxShadow(
//                                     color: Colors.black.withOpacity(0.3),
//                                     blurRadius: 2.5)
//                               ]),
//                           child: Padding(
//                             padding: const EdgeInsets.only(left: 8),
//                             child: Row(
//                               children: [
//                                 const Icon(
//                                   Icons.star,
//                                   color: Colors.yellow,
//                                   size: 10,
//                                 ),
//                                 const SizedBox(
//                                   width: 3,
//                                 ),
//                                 Text(
//                                   coffee.rate.toString(),
//                                   style: GoogleFonts.sora(color: Colors.white),
//                                 )
//                               ],
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   )),
//                   Padding(
//                     padding: const EdgeInsets.all(12),
//                     child: Column(
//                       // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       crossAxisAlignment: CrossAxisAlignment.stretch,
//                       children: [
//                         Text(
//                           coffee.name,
//                           style: GoogleFonts.sora(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w600,
//                             color: const Color(0xFF2F2D2C),
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 4,
//                         ),
//                         Text(
//                           coffee.coffeeWith,
//                           style: GoogleFonts.sora(
//                             fontSize: 12,
//                             fontWeight: FontWeight.w400,
//                             color: const Color(0xFF9B9B9B),
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 12,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               "\$ ${coffee.price.toString()}",
//                               style: GoogleFonts.sora(
//                                 fontWeight: FontWeight.w600,
//                                 color: const Color(0xFF2F4B4E),
//                                 fontSize: 18,
//                               ),
//                             ),
//                             Transform.scale(
//                               scale: 0.8,
//                               child: CupertinoButton(
//                                 onPressed: () {},
//                                 color: const Color(0xFFC67C4E),
//                                 padding: EdgeInsets.zero,
//                                 borderRadius: BorderRadius.circular(10),
//                                 child: const Icon(
//                                   Iconsax.add,
//                                 ),
//                               ),
//                             )
//                           ],
//                         )
//                       ],
//                     ),
//                   )
//                 ]),
//               );
//             })),
//     Container(
//         //    width: 340,
//         color: const Color(0xFFF9F9F9),
//         height: 315,
//         child: GridView.builder(
//             itemCount: coffeeList.length,
//             gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
//                 maxCrossAxisExtent: 200,
//                 crossAxisSpacing: 16,
//                 mainAxisSpacing: 20,
//                 childAspectRatio: 0.60),
//             itemBuilder: (context, index) {
//               CoffeeModel coffee = coffeeList[index];
//               return Container(
//                 padding: const EdgeInsets.all(4),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(16),
//                 ),
//                 child: Column(children: [
//                   Expanded(
//                       child: Container(
//                     alignment: Alignment.topRight,
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(16),
//                       image: DecorationImage(
//                         fit: BoxFit.cover,
//                         image: AssetImage(coffee.image),
//                       ),
//                     ),
//                     child: Row(
//                       children: [
//                         Container(
//                           width: 60,
//                           height: 25,
//                           decoration: BoxDecoration(
//                               color: const Color.fromRGBO(0, 0, 0, 0.16),
//                               borderRadius: const BorderRadius.only(
//                                 topLeft: Radius.circular(16),
//                                 bottomRight: Radius.circular(16),
//                               ),
//                               boxShadow: [
//                                 BoxShadow(
//                                     color: Colors.black.withOpacity(0.3),
//                                     blurRadius: 2.5)
//                               ]),
//                           child: Padding(
//                             padding: const EdgeInsets.only(left: 8),
//                             child: Row(
//                               children: [
//                                 const Icon(
//                                   Icons.star,
//                                   color: Colors.yellow,
//                                   size: 10,
//                                 ),
//                                 const SizedBox(
//                                   width: 3,
//                                 ),
//                                 Text(
//                                   coffee.rate.toString(),
//                                   style: GoogleFonts.sora(color: Colors.white),
//                                 )
//                               ],
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   )),
//                   Padding(
//                     padding: const EdgeInsets.all(12),
//                     child: Column(
//                       // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       crossAxisAlignment: CrossAxisAlignment.stretch,
//                       children: [
//                         Text(
//                           coffee.name,
//                           style: GoogleFonts.sora(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w600,
//                             color: const Color(0xFF2F2D2C),
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 4,
//                         ),
//                         Text(
//                           coffee.coffeeWith,
//                           style: GoogleFonts.sora(
//                             fontSize: 12,
//                             fontWeight: FontWeight.w400,
//                             color: const Color(0xFF9B9B9B),
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 12,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               "\$ ${coffee.price.toString()}",
//                               style: GoogleFonts.sora(
//                                 fontWeight: FontWeight.w600,
//                                 color: const Color(0xFF2F4B4E),
//                                 fontSize: 18,
//                               ),
//                             ),
//                             Transform.scale(
//                               scale: 0.8,
//                               child: CupertinoButton(
//                                 onPressed: () {},
//                                 color: const Color(0xFFC67C4E),
//                                 padding: EdgeInsets.zero,
//                                 borderRadius: BorderRadius.circular(10),
//                                 child: const Icon(
//                                   Iconsax.add,
//                                 ),
//                               ),
//                             )
//                           ],
//                         )
//                       ],
//                     ),
//                   )
//                 ]),
//               );
//             })
            
//             ),
//     Container(
//         //    width: 340,
//         color: const Color(0xFFF9F9F9),
//         height: 315,
//         child: GridView.builder(
//             itemCount: coffeeList.length,
//             gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
//                 maxCrossAxisExtent: 200,
//                 crossAxisSpacing: 16,
//                 mainAxisSpacing: 20,
//                 childAspectRatio: 0.60),
//             itemBuilder: (context, index) {
//               CoffeeModel coffee = coffeeList[index];
//               return Container(
//                 padding: const EdgeInsets.all(4),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(16),
//                 ),
//                 child: Column(children: [
//                   Expanded(
//                       child: Container(
//                     alignment: Alignment.topRight,
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(16),
//                       image: DecorationImage(
//                         fit: BoxFit.cover,
//                         image: AssetImage(coffee.image),
//                       ),
//                     ),
//                     child: Row(
//                       children: [
//                         Container(
//                           width: 60,
//                           height: 25,
//                           decoration: BoxDecoration(
//                               color: const Color.fromRGBO(0, 0, 0, 0.16),
//                               borderRadius: const BorderRadius.only(
//                                 topLeft: Radius.circular(16),
//                                 bottomRight: Radius.circular(16),
//                               ),
//                               boxShadow: [
//                                 BoxShadow(
//                                     color: Colors.black.withOpacity(0.3),
//                                     blurRadius: 2.5)
//                               ]),
//                           child: Padding(
//                             padding: const EdgeInsets.only(left: 8),
//                             child: Row(
//                               children: [
//                                 const Icon(
//                                   Icons.star,
//                                   color: Colors.yellow,
//                                   size: 10,
//                                 ),
//                                 const SizedBox(
//                                   width: 3,
//                                 ),
//                                 Text(
//                                   coffee.rate.toString(),
//                                   style: GoogleFonts.sora(color: Colors.white),
//                                 )
//                               ],
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   )),
//                   Padding(
//                     padding: const EdgeInsets.all(12),
//                     child: Column(
//                       // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       crossAxisAlignment: CrossAxisAlignment.stretch,
//                       children: [
//                         Text(
//                           coffee.name,
//                           style: GoogleFonts.sora(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w600,
//                             color: const Color(0xFF2F2D2C),
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 4,
//                         ),
//                         Text(
//                           coffee.coffeeWith,
//                           style: GoogleFonts.sora(
//                             fontSize: 12,
//                             fontWeight: FontWeight.w400,
//                             color: const Color(0xFF9B9B9B),
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 12,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               "\$ ${coffee.price.toString()}",
//                               style: GoogleFonts.sora(
//                                 fontWeight: FontWeight.w600,
//                                 color: const Color(0xFF2F4B4E),
//                                 fontSize: 18,
//                               ),
//                             ),
//                             Transform.scale(
//                               scale: 0.8,
//                               child: CupertinoButton(
//                                 onPressed: () {},
//                                 color: const Color(0xFFC67C4E),
//                                 padding: EdgeInsets.zero,
//                                 borderRadius: BorderRadius.circular(10),
//                                 child: const Icon(
//                                   Iconsax.add,
//                                 ),
//                               ),
//                             )
//                           ],
//                         )
//                       ],
//                     ),
//                   )
//                 ]),
//               );
//             })),
//     Container(
//         //    width: 340,
//         color: const Color(0xFFF9F9F9),
//         height: 315,
//         child: GridView.builder(
//             itemCount: coffeeList.length,
//             gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
//                 maxCrossAxisExtent: 200,
//                 crossAxisSpacing: 16,
//                 mainAxisSpacing: 20,
//                 childAspectRatio: 0.60),
//             itemBuilder: (context, index) {
//               CoffeeModel coffee = coffeeList[index];
//               return Container(
//                 padding: const EdgeInsets.all(4),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(16),
//                 ),
//                 child: Column(children: [
//                   Expanded(
//                       child: Container(
//                     alignment: Alignment.topRight,
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(16),
//                       image: DecorationImage(
//                         fit: BoxFit.cover,
//                         image: AssetImage(coffee.image),
//                       ),
//                     ),
//                     child: Row(
//                       children: [
//                         Container(
//                           width: 60,
//                           height: 25,
//                           decoration: BoxDecoration(
//                               color: const Color.fromRGBO(0, 0, 0, 0.16),
//                               borderRadius: const BorderRadius.only(
//                                 topLeft: Radius.circular(16),
//                                 bottomRight: Radius.circular(16),
//                               ),
//                               boxShadow: [
//                                 BoxShadow(
//                                     color: Colors.black.withOpacity(0.3),
//                                     blurRadius: 2.5)
//                               ]),
//                           child: Padding(
//                             padding: const EdgeInsets.only(left: 8),
//                             child: Row(
//                               children: [
//                                 const Icon(
//                                   Icons.star,
//                                   color: Colors.yellow,
//                                   size: 10,
//                                 ),
//                                 const SizedBox(
//                                   width: 3,
//                                 ),
//                                 Text(
//                                   coffee.rate.toString(),
//                                   style: GoogleFonts.sora(color: Colors.white),
//                                 )
//                               ],
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   )),
//                   Padding(
//                     padding: const EdgeInsets.all(12),
//                     child: Column(
//                       // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       crossAxisAlignment: CrossAxisAlignment.stretch,
//                       children: [
//                         Text(
//                           coffee.name,
//                           style: GoogleFonts.sora(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w600,
//                             color: const Color(0xFF2F2D2C),
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 4,
//                         ),
//                         Text(
//                           coffee.coffeeWith,
//                           style: GoogleFonts.sora(
//                             fontSize: 12,
//                             fontWeight: FontWeight.w400,
//                             color: const Color(0xFF9B9B9B),
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 12,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               "\$ ${coffee.price.toString()}",
//                               style: GoogleFonts.sora(
//                                 fontWeight: FontWeight.w600,
//                                 color: const Color(0xFF2F4B4E),
//                                 fontSize: 18,
//                               ),
//                             ),
//                             Transform.scale(
//                               scale: 0.8,
//                               child: CupertinoButton(
//                                 onPressed: () {},
//                                 color: const Color(0xFFC67C4E),
//                                 padding: EdgeInsets.zero,
//                                 borderRadius: BorderRadius.circular(10),
//                                 child: const Icon(
//                                   Iconsax.add,
//                                 ),
//                               ),
//                             )
//                           ],
//                         )
//                       ],
//                     ),
//                   )
//                 ]),
//               );
//             })),
//   ];
//   var selected = 1;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Carousel with indicator controller demo')),
//       body: Container(
//         child: Column(children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SizedBox(
//                 height: 100,
//                 width: 300,
//                 child: SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 0),
//                     child: Row(
//                       children: ["Cappuccino", "Machiato", "Latte", "Americano"]
//                           .asMap()
//                           .map(
//                             (key, value) => MapEntry(
//                               key,
//                               Padding(
//                                 padding:
//                                     const EdgeInsets.symmetric(horizontal: 4),
//                                 child: GestureDetector(
//                                   onTap: () {
//                                     _controller.animateToPage(key);
//                                     setState(() {
//                                       selected = key;
//                                     });
//                                   },
//                                   child: Container(
//                                     height: 38,
//                                     decoration: BoxDecoration(
//                                       color: selected == key
//                                           ? const Color(0xFFC67C4E)
//                                           : Colors.white,
//                                       borderRadius: BorderRadius.circular(12),
//                                     ),
//                                     child: Center(
//                                       child: Padding(
//                                         padding: const EdgeInsets.symmetric(
//                                             horizontal: 20),
//                                         child: Text(value,
//                                             style: GoogleFonts.sora(
//                                                 fontSize: 14,
//                                                 fontWeight: FontWeight.w600,
//                                                 color: selected == key
//                                                     ? Colors.white
//                                                     : const Color(0xFF2F4B4E))),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           )
//                           .values
//                           .toList(),
//                     ),
//                   ),
//                 ),
//                 // width: 315,
//                 // color: Colors.amber,
//               ),
//               //  GestureDetector(
//               //   onTap: () => _controller.animateToPage(entry.key),
//               //   child: Container(
//               //     width: 12.0,
//               //     height: 12.0,
//               //     margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
//               //     decoration: BoxDecoration(
//               //         shape: BoxShape.circle,
//               //         color: (Theme.of(context).brightness == Brightness.dark
//               //                 ? Colors.white
//               //                 : Colors.black)
//               //             .withOpacity(_current == entry.key ? 0.9 : 0.4)),
//               //   ),
//               // );
//             ],
//           ),
//           CarouselSlider(
//             items: listt,
//             carouselController: _controller,
//             options: CarouselOptions(
//                 enlargeCenterPage: true,
//                 aspectRatio: 2.0,
//                 onPageChanged: (index, reason) {
//                   setState(() {
//                     _current = index;
//                   });
//                 }),
//           ),
//         ]),
//       ),
//     );
//   }
// }
