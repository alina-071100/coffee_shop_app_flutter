
import 'package:coffee_shop_app/data/coffee_data.dart';
import 'package:coffee_shop_app/models/coffee_models.dart';
import 'package:coffee_shop_app/screens/bag_page.dart';
import 'package:coffee_shop_app/screens/coffee_detail.dart';
import 'package:coffee_shop_app/theme/app_theme.dart';
import 'package:coffee_shop_app/widgets/search_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class MenuPage extends StatefulWidget {
  static const String routeName = '/menu-page';

  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  var selected = 0;

  @override
  Widget build(BuildContext context) {
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
                                Text(
                                  'Location',
                                  style: GoogleFonts.sora(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFFB7B7B7),
                                    letterSpacing: 0.12,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Bilzen, Tanjungbalai',
                                      style: GoogleFonts.sora(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xFFDDDDDD),
                                      ),
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
                const SearchWidget(),
                const SizedBox(
                  height: 30,
                ),
                Stack(
                  children: [
                    Container(
                      height: 145,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          image: const DecorationImage(
                              filterQuality: FilterQuality.medium,
                              fit: BoxFit.fill,
                              image:
                                  AssetImage('assets/images/coffee_cup.png')),
                          borderRadius: BorderRadius.circular(16)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 23, top: 13),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              width: 60,
                              height: 26,
                              decoration: BoxDecoration(
                                color: const Color(0xFFED5151),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                  child: Text(
                                "Promo",
                                style: GoogleFonts.sora(
                                  color: const Color(0xFFFFFFFF),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ))),
                          const SizedBox(
                            height: 8,
                          ),
                          Container(
                              alignment: Alignment.bottomLeft,
                              width: 213,
                              height: 37,
                              decoration: const BoxDecoration(boxShadow: [
                                BoxShadow(
                                    spreadRadius: -7,
                                    color: Colors.black,
                                    offset: Offset(-6, 10)),
                              ]),
                              child: Text(
                                "Buy one get",
                                style: GoogleFonts.sora(
                                  color: const Color(0xFFFFFFFF),
                                  fontSize: 32,
                                  fontWeight: FontWeight.w600,
                                ),
                              )),
                          const SizedBox(
                            height: 2,
                          ),
                          Container(
                              width: 160,
                              height: 37,
                              decoration: const BoxDecoration(boxShadow: [
                                BoxShadow(
                                    spreadRadius: -7,
                                    color: Colors.black,
                                    offset: Offset(-6, 10)),
                              ]),
                              child: Text(
                                "one FREE",
                                style: GoogleFonts.sora(
                                  color: const Color(0xFFFFFFFF),
                                  fontSize: 32,
                                  fontWeight: FontWeight.w600,
                                ),
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                SizedBox(
                  height: 50,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 0),
                      child: Row(
                        children: [
                          "Cappuccino",
                          "Machiato",
                          "Latte",
                          "Americano"
                        ]
                            .asMap()
                            .map(
                              (key, value) => MapEntry(
                                key,
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 4),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selected = key;
                                      });
                                    },
                                    child: Container(
                                      height: 38,
                                      decoration: BoxDecoration(
                                        color: selected == key
                                            ? const Color(0xFFC67C4E)
                                            : Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: Text(value,
                                              style: GoogleFonts.sora(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  color: selected == key
                                                      ? Colors.white
                                                      : const Color(
                                                          0xFF2F4B4E))),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                            .values
                            .toList(),
                      ),
                    ),
                  ),
                  // width: 315,
                  // color: Colors.amber,
                ),
                const SizedBox(
                  height: 24,
                ),
                Container(
                    //    width: 340,
                    color: const Color(0xFFF9F9F9),
                    height: 315,
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
                              child: singleCoffee(coffee));
                        }))
              ]),
            ),
          ]),
        ));
  }

  Widget singleCoffee(CoffeeModel coffee) {
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
                        color: Colors.yellow,
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
                style: GoogleFonts.sora(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF2F2D2C),
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                coffee.coffeeWith,
                style: GoogleFonts.sora(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF9B9B9B),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$ ${coffee.price.toString()}",
                    style: GoogleFonts.sora(
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF2F4B4E),
                      fontSize: 18,
                    ),
                  ),
                  Transform.scale(
                    scale: 0.8,
                    child: CupertinoButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const BagPage()));
                      },
                      color: const Color(0xFFC67C4E),
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
