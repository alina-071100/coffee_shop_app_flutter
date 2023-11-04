import 'package:coffee_shop_app/models/coffee_models.dart';
import 'package:coffee_shop_app/provider/menu_page_provider.dart';
import 'package:coffee_shop_app/screens/coffee_detail.dart';
import 'package:coffee_shop_app/screens/menu_page.dart';
import 'package:coffee_shop_app/screens/order_page.dart';
import 'package:coffee_shop_app/theme/app_theme.dart';
import 'package:coffee_shop_app/widgets/custom_filledbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

class BagPage extends StatefulWidget {
  BagPage({super.key});

  @override
  State<BagPage> createState() => _BagPageState();
}

class _BagPageState extends State<BagPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Consumer<MenuPageProvider>(
      builder: (context, myType, child) {
        return Scaffold(
          backgroundColor: const Color.fromARGB(255, 251, 249, 249),
          resizeToAvoidBottomInset: false,
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Center(
                      child: Text(
                        "Bag",
                        style: GoogleFonts.sora(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF2F2D2C),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    // SizedBox(
                    //   height: 50,
                    // ),
                    Container(
                      height: 500,
                      child: myType.addCoffee.isNotEmpty
                          ? ListView.builder(
                              itemCount: context
                                  .watch<MenuPageProvider>()
                                  .addCoffee
                                  .length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 4.0),
                                  child: singleCoffee(
                                      myType.addCoffee[index], context),
                                );
                              })
                          : Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Icon(
                                    Iconsax.bag,
                                    size: 40,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "Your cart is empty!",
                                    style: GoogleFonts.poppins(
                                      color: Colors.grey,
                                    ),
                                  )
                                ],
                              ),
                            ),
                    ),
                  ],
                ),
              ),
              if (myType.addCoffee.isNotEmpty)
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const OrderPage(),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: CustomFilledButton(
                              height: 62,
                              borderRadius: 16,
                              color: const Color(0xFFC67C4E),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Payable',
                                        style: GoogleFonts.sora(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: const Color(0xFFFFFFFF))),
                                    Text("\$ ${myType.total()}",
                                        style: GoogleFonts.sora(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: const Color(0xFFFFFFFF))),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  Widget singleCoffee(CoffeeModel coffee, BuildContext cont) {
    return Container(
      height: 80,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          children: [
            if (coffee?.image != null)
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                        image: AssetImage(coffee!.image), fit: BoxFit.cover)),
              ),
            const SizedBox(
              width: 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  coffee?.name ?? "",
                  style: AppTheme.largeText.copyWith(fontSize: 16),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2.7,
                  child: Text(
                    coffee?.coffeeWith ?? "",
                    style: AppTheme.coffeeWithText
                        .copyWith(fontSize: 12)
                        .copyWith(overflow: TextOverflow.ellipsis),
                  ),
                ),
                Text(
                  "\$ ${coffee.priceItems} ",
                  style: AppTheme.coffeeWithText
                      .copyWith(fontSize: 15, color: Colors.black),
                ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            InkWell(
              onTap: () {
                // count--;
                cont.read<MenuPageProvider>().minusItem(coffee);
              },
              child: Icon(
                Iconsax.minus,
                size: 25,
              ),
            ),
            Text("${coffee.count ?? ""}"),
            InkWell(
              onTap: () {
                // count--;
                cont.read<MenuPageProvider>().plusItem(coffee);
              },
              child: Icon(
                Iconsax.add,
                size: 25,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: () {
                cont.read<MenuPageProvider>().deletedItem(coffee);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: Color.fromARGB(255, 122, 14, 14),
                    content: Text(
                      "Item removed!",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                );
              },
              child: CircleAvatar(
                backgroundColor: Colors.redAccent.withOpacity(0.07),
                radius: 18,
                child: const Icon(
                  Iconsax.trash,
                  color: Colors.redAccent,
                  size: 15,
                ),
              ),
            ),
            //   child: Icon(
            //     Iconsax.add,
            //     size: 25,
            //   ),
            // ),
            // SizedBox(
            //   width: 6,
            // ),
            // // InkWell(
            // //   onTap: () {
            // //     // count--;
            // //     cont.read<MenuPageProvider>().deletedItem(coffee);
            // //   },
            // //   child: Container(
            // //     height: 30,
            // //     width: 30,
            // //     decoration: BoxDecoration(
            // //         shape: BoxShape.circle,
            // //         border:
            // //             Border.all(color: Color.fromARGB(255, 183, 181, 181))),
            // //     child: Icon(
            // //       Iconsax.trash,
            // //       size: 20,
            // //     ),
            // //   ),
            // // ),

            // GestureDetector(
            //   onTap: () {
            //     cont.read<MenuPageProvider>().deletedItem(coffee);
            //     ScaffoldMessenger.of(context).showSnackBar(
            //       const SnackBar(
            //         backgroundColor: Color.fromARGB(255, 247, 247, 247),
            //         content: Text(
            //           "Item removed!",
            //           style: TextStyle(color: Colors.black),
            //         ),
            //       ),
            //     );
            //   },
            //   child: CircleAvatar(
            //     backgroundColor: Colors.redAccent.withOpacity(0.07),
            //     radius: 18,
            //     child: const Icon(
            //       Iconsax.trash,
            //       color: Colors.redAccent,
            //       size: 14,
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   width: 1,
            // ),
          ],
        ),
      ]),
    );
  }
}
