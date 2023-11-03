import 'package:carousel_slider/carousel_slider.dart';
import 'package:coffee_shop_app/data/coffee_data.dart';
import 'package:coffee_shop_app/models/coffee_models.dart';
import 'package:coffee_shop_app/provider/menu_page_provider.dart';
import 'package:coffee_shop_app/screens/bag_page.dart';
import 'package:coffee_shop_app/screens/coffee_detail.dart';
import 'package:coffee_shop_app/theme/app_theme.dart';
import 'package:coffee_shop_app/widgets/banner_card.dart';
import 'package:coffee_shop_app/widgets/search_widget.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

class MenuPage extends StatefulWidget {
  static const String routeName = '/menu-page';

  MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  var selected = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Consumer<MenuPageProvider>(
      builder: (context, myType, child) {
        return Scaffold(
            backgroundColor: AppTheme.backgroundColor2,
            resizeToAvoidBottomInset: false,
            body: SingleChildScrollView(
              child: Stack(children: [
                Container(
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                        AppTheme.gardientColor,
                        AppTheme.gardient2Color,
                      ])),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(children: [
                    Center(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 73,
                                    ),
                                    Text('Location',
                                        style: AppTheme.menueTetxtTitle),
                                    Row(
                                      children: [
                                        Text(
                                          'Bilzen, Tanjungbalai',
                                          style: AppTheme.locationText,
                                        ),
                                        const Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: Colors.white,
                                        ),
                                      ],
                                    )
                                  ]),
                              Container(
                                width: 44,
                                height: 44,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    image: const DecorationImage(
                                      image: AssetImage(
                                        'assets/images/image_girl.jpg',
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                     SearchWidget(onChanged: myType.searchCoffee),
                    const SizedBox(
                      height: 24,
                    ),
                    SizedBox(
                      child: CarouselSlider(
                        options: CarouselOptions(
                          viewportFraction: 1,
                          enlargeFactor: 0.3,
                          height: size.height * 0.20,
                          enlargeCenterPage: true,
                          autoPlay: true,
                        ),
                        items: List.generate(
                          5,
                          (index) => const BannerCard(),
                        ),
                      ),
                    ),
                    Container(
                      height: size.height*0.4,
                      child: ContainedTabBarView(
                        tabBarViewProperties: TabBarViewProperties(),
                        tabs: [
                          Text('Cappuccino'),
                          Text('Machiato'),
                          Text('Latte'),
                          Text('Americano'),
                        ],
                        tabBarProperties: TabBarProperties(
                          labelStyle: GoogleFonts.sora(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                          isScrollable: true,
                          labelPadding: EdgeInsets.symmetric(horizontal: 20),
                          padding: const EdgeInsets.symmetric(
                            // horizontal: 32.0,
                            vertical: 8.0,
                          ),
                          indicator: ContainerTabIndicator(
                              height: 38,
                              radius: BorderRadius.circular(12.0),
                              color: AppTheme.buttonColor),
                          labelColor: Colors.white,
                          unselectedLabelColor: AppTheme.switchTextColor,
                        ),
                        views: [
                          Container(
                              //    width: 340,
                              color: AppTheme.backgroundColor2,
                              // height: 315,
                              child: GridView.builder(
                                  itemCount: myType.addTestCoffee.length,
                                  // coffeeList.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithMaxCrossAxisExtent(
                                          maxCrossAxisExtent: 200,
                                          crossAxisSpacing: 16,
                                          mainAxisSpacing: 20,
                                          childAspectRatio: 0.60),
                                  itemBuilder: (context, index) {
                                    CoffeeModel coffee = myType.addTestCoffee[index];
                                    return InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailPage(coffee: coffee),
                                            ),
                                          );
                                        },
                                        child: singleCoffee(coffee, context));
                                  })),
                          Container(
                              //    width: 340,
                              color: Color.fromARGB(255, 42, 76, 139),
                              // height: 315,
                              child: GridView.builder(
                                  itemCount: coffeeList.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithMaxCrossAxisExtent(
                                          maxCrossAxisExtent: 200,
                                          crossAxisSpacing: 16,
                                          mainAxisSpacing: 20,
                                          childAspectRatio: 0.60),
                                  itemBuilder: (context, index) {
                                    CoffeeModel coffee = coffeeList[index];
                                    return InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailPage(coffee: coffee),
                                            ),
                                          );
                                        },
                                        child: singleCoffee(coffee, context));
                                  })),
                          Container(
                              //    width: 340,
                              color: Color.fromARGB(255, 86, 64, 151),
                              // height: 315,
                              child: GridView.builder(
                                  itemCount: coffeeList.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithMaxCrossAxisExtent(
                                          maxCrossAxisExtent: 200,
                                          crossAxisSpacing: 16,
                                          mainAxisSpacing: 20,
                                          childAspectRatio: 0.60),
                                  itemBuilder: (context, index) {
                                    CoffeeModel coffee = coffeeList[index];
                                    return InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailPage(coffee: coffee),
                                            ),
                                          );
                                        },
                                        child: singleCoffee(coffee, context));
                                  })),
                          Container(
                              //    width: 340,
                              color: const Color.fromARGB(255, 184, 86, 86),
                              // height: 315,
                              child: GridView.builder(
                                  itemCount: coffeeList.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithMaxCrossAxisExtent(
                                          maxCrossAxisExtent: 200,
                                          crossAxisSpacing: 16,
                                          mainAxisSpacing: 20,
                                          childAspectRatio: 0.60),
                                  itemBuilder: (context, index) {
                                    CoffeeModel coffee = coffeeList[index];
                                    return InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailPage(coffee: coffee),
                                            ),
                                          );
                                        },
                                        child: singleCoffee(coffee, context));
                                  })),
                        
                        ],
                        onChange: (index) => print(index),
                      ),
                    ),
                    // SizedBox(
                    //   height: 50,
                    //   child: SingleChildScrollView(
                    //     scrollDirection: Axis.horizontal,
                    //     child: Row(
                    //       children: [
                    //         "Cappuccino",
                    //         "Machiato",
                    //         "Latte",
                    //         "Americano"
                    //       ]
                    //           .asMap()
                    //           .map(
                    //             (key, value) => MapEntry(
                    //               key,
                    //               Padding(
                    //                 padding: const EdgeInsets.symmetric(
                    //                     horizontal: 4),
                    //                 child: GestureDetector(
                    //                   onTap: () {
                    //                     setState(() {
                    //                       selected = key;
                    //                     });
                    //                   },
                    //                   child: Container(
                    //                     height: 38,
                    //                     decoration: BoxDecoration(
                    //                       color: selected == key
                    //                           ? AppTheme.buttonColor
                    //                           : AppTheme.button2Color,
                    //                       borderRadius:
                    //                           BorderRadius.circular(12),
                    //                     ),
                    //                     child: Center(
                    //                       child: Padding(
                    //                         padding: const EdgeInsets.symmetric(
                    //                             horizontal: 20),
                    //                         child: Text(value,
                    //                             style: GoogleFonts.sora(
                    //                               fontSize: 14,
                    //                               fontWeight: FontWeight.w600,
                    //                               color: selected == key
                    //                                   ? AppTheme.button2Color
                    //                                   : AppTheme
                    //                                       .switchTextColor,
                    //                             )),
                    //                       ),
                    //                     ),
                    //                   ),
                    //                 ),
                    //               ),
                    //             ),
                    //           )
                    //           .values
                    //           .toList(),
                    //     ),
                    //   ),
                    // ),
                    // const SizedBox(
                    //   height: 24,
                    // ),
                    // Container(
                    //     //    width: 340,
                    //     color: AppTheme.backgroundColor2,
                    //     height: 315,
                    //     child: GridView.builder(
                    //         itemCount: coffeeList.length,
                    //         gridDelegate:
                    //             const SliverGridDelegateWithMaxCrossAxisExtent(
                    //                 maxCrossAxisExtent: 200,
                    //                 crossAxisSpacing: 16,
                    //                 mainAxisSpacing: 20,
                    //                 childAspectRatio: 0.60),
                    //         itemBuilder: (context, index) {
                    //           CoffeeModel coffee = coffeeList[index];
                    //           return InkWell(
                    //               onTap: () {
                    //                 Navigator.push(
                    //                   context,
                    //                   MaterialPageRoute(
                    //                     builder: (context) =>
                    //                         DetailPage(coffee: coffee),
                    //                   ),
                    //                 );
                    //               },
                    //               child: singleCoffee(coffee, context));
                    //         }))
                  ]),
                ),
              ]),
            ));
      },
    );
  }

  Widget singleCoffee(CoffeeModel coffee, BuildContext cont) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(children: [
        Expanded(
            child: Container(
          alignment: Alignment.topRight,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(coffee.image),
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 60,
                height: 25,
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(0, 0, 0, 0.16),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.3), blurRadius: 2.5)
                    ]),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: AppTheme.starColor,
                        size: 10,
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Text(
                        coffee.rate.toString(),
                        style: GoogleFonts.sora(color: Colors.white),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        )),
        const SizedBox(
          height: 4,
        ),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                coffee.name,
                style: AppTheme.largeText,
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                coffee.coffeeWith,
                style: AppTheme.coffeeWithText,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$ ${coffee.price.toString()}",
                    style: AppTheme.coffeePriceText,
                  ),
                  Transform.scale(
                    scale: 0.8,
                    child: CupertinoButton(
                      onPressed: () {
                        // if (coffee != null && coffee.isAvailable == true) {
                        cont.read<MenuPageProvider>().addItemBag(coffee);
                        // ScaffoldMessenger.of(context).showSnackBar(
                        //   SnackBar(
                        //     backgroundColor: Colors.grey.withOpacity(0.8),
                        //     content: const Text(
                        //       "Item added!",
                        //       style: TextStyle(
                        //         color: Colors.black,
                        //       ),
                        //     ),
                        //     behavior: SnackBarBehavior.floating,
                        //     margin: EdgeInsets.only(top: 16, right: 16),
                        //   ),
                        // );
                      },
                      color: AppTheme.buttonColor,
                      padding: EdgeInsets.zero,
                      borderRadius: BorderRadius.circular(10),
                      child: const Icon(
                        Iconsax.add,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
