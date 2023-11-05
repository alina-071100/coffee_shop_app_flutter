import 'package:coffee_shop_app/models/coffee_models.dart';
import 'package:coffee_shop_app/provider/menu_page_provider.dart';
import 'package:coffee_shop_app/screens/card/credit_card_page.dart';
import 'package:coffee_shop_app/theme/app_theme.dart';
import 'package:coffee_shop_app/widgets/custom_filledbutton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

class OrderPage extends StatefulWidget {
  final CoffeeModel? coffee;

  const OrderPage({
    Key? key,
    this.coffee,
  }) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  int count = 1;
  @override
  Widget build(BuildContext context) {
    return Consumer<MenuPageProvider>(
      builder: (context, myType, child) {
        return Scaffold(
          backgroundColor: const Color.fromARGB(255, 251, 249, 249),
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            elevation: 0, // No shadow

            backgroundColor: const Color.fromARGB(255, 251, 249, 249),
            shadowColor: Colors.white,
            title: Padding(
              padding: const EdgeInsets.only(right: 50, top: 16),
              child: Center(
                child: Text(
                  "Order",
                  style: GoogleFonts.sora(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF2F2D2C),
                  ),
                ),
              ),
            ), // App bar title
            leading: Padding(
              padding: const EdgeInsets.only(left: 30, top: 16),
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
          bottomNavigationBar: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(24)),
            height: 161,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Iconsax.moneys,
                            color: Color(0xFFC67C4E),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: const Color(0xFFF2F2F2)),
                            height: 24,
                            width: 112,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: AppTheme.buttonColor),
                                    height: 24,
                                    width: 51,
                                    child: Center(
                                      child: Text(
                                        "Cashe",
                                        style: GoogleFonts.sora(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFFFFFFFF),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    child: Center(
                                      child: Text(
                                        "\$ ${myType.deliveryCharge}",
                                        style: GoogleFonts.sora(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFF2F2D2C),
                                        ),
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Color(0xFFF2F2F2)),
                                    height: 24,
                                    width: 51,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Icon(
                        Iconsax.more_circle5,
                        color: Color(0xFF808080),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            print(widget.coffee);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CreditCartPage(),
                              ),
                            );
                          },
                          child: CustomFilledButton(
                            height: 62,
                            borderRadius: 16,
                            color: const Color(0xFFC67C4E),
                            child: Text('Order',
                                style: GoogleFonts.sora(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFFFFFFFF))),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    children: [
                      // CustomAppBar(
                      //   title: "Order",
                      //   functionBackIcon: () {
                      //     Navigator.pop(context);
                      //   },
                      // ),
                      Column(
                        children: [
                          const SizedBox(
                            height: 25,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                color: const Color(0xFFF2F2F2)),
                            height: 50,
                            // width: 315,

                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      child: Center(
                                        child: Text(
                                          "Deliver",
                                          style: GoogleFonts.sora(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xFFFFFFFF),
                                          ),
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: AppTheme.buttonColor),
                                      height: 42,
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      child: Center(
                                        child: Text(
                                          "Pick Up",
                                          style: AppTheme.largeText,
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Color(0xFFF2F2F2)),
                                      height: 42,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Delivery Address",
                                        style: AppTheme.largeText,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 16),
                                        child: Text(
                                          "Jl. Kpg Sutoyo",
                                          style: GoogleFonts.sora(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xFF303336),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        child: Text(
                                          "Kpg. Sutoyo No. 620, Bilzen, Tanjungbalai.",
                                          style: AppTheme.subtileLarge,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 16,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 12),
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Icon(
                                                      Iconsax.edit,
                                                      size: 14,
                                                      color: Colors.black,
                                                    ),
                                                    SizedBox(
                                                      width: 4,
                                                    ),
                                                    Text(
                                                      "Edit Address",
                                                      style:
                                                          AppTheme.subtileLarge,
                                                    )
                                                  ]),
                                            ),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                color: Color(0xFFFFFFFF),
                                                border: Border.all(
                                                    color: Color(0xFFDEDEDE))),
                                            height: 27,
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Container(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 12),
                                              child: Row(
                                                  // mainAxisAlignment:
                                                  //     MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Icon(
                                                      Iconsax.note_1,
                                                      size: 14,
                                                    ),
                                                    Text(
                                                      "  Add Note",
                                                      style:
                                                          AppTheme.subtileLarge,
                                                    )
                                                  ]),
                                            ),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                color: Color(0xFFFFFFFF),
                                                border: Border.all(
                                                    color: Color(0xFFDEDEDE))),
                                            height: 27,
                                          )
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20, bottom: 20),
                                        child: Divider(
                                          height: 1,
                                          thickness: 1,
                                          color: Color(0xFFEAEAEA),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          ...List.generate(
                              myType.addCoffee.length,
                              (index) => Padding(
                                    padding: EdgeInsets.only(bottom: 10),
                                    child: singleCoffee(
                                        myType.addCoffee[index], context),
                                  )),

                          // SizedBox(
                          //   height: 54,
                          //   child: Row(
                          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //       children: [
                          //         Row(
                          //           children: [
                          //             if (widget.coffee?.image != null)
                          //               Container(
                          //                 width: 54,
                          //                 height: 54,
                          //                 decoration: BoxDecoration(
                          //                     borderRadius: BorderRadius.circular(12),
                          //                     image: DecorationImage(
                          //                         image: AssetImage(widget.coffee!.image),
                          //                         fit: BoxFit.cover)),
                          //               ),
                          //            const SizedBox(
                          //               width: 12,
                          //             ),
                          //             Column(
                          //               crossAxisAlignment: CrossAxisAlignment.start,
                          //               mainAxisAlignment: MainAxisAlignment.center,
                          //               children: [
                          //                 Text(
                          //                   widget.coffee?.name ?? "",
                          //                                                               style:AppTheme.largeText,

                          //                 ),
                          //                 SizedBox(
                          //                   height: 4,
                          //                 ),
                          //                 Text(
                          //                   widget.coffee?.coffeeWith ?? "",
                          //                                                              style:AppTheme.coffeeWithText,

                          //                 ),
                          //               ],
                          //             ),
                          //           ],
                          //         ),
                          //         Row(
                          //           children: [
                          //             InkWell(
                          //               onTap: count > 1
                          //                   ? () {
                          //                       count--;
                          //                       setState(() {});
                          //                     }
                          //                   : null,
                          //               child: Container(
                          //                 height: 28,
                          //                 width: 28,
                          //                 decoration: BoxDecoration(
                          //                     shape: BoxShape.circle,
                          //                     border:
                          //                         Border.all(color: Color(0xFFEAEAEA))),
                          //                 child: Icon(
                          //                   Iconsax.minus,
                          //                   size: 16,
                          //                 ),
                          //               ),
                          //             ),
                          //             Padding(
                          //               padding: const EdgeInsets.all(8.0),
                          //               child: Text(
                          //                 "$count",
                          //                 style: GoogleFonts.sora(
                          //                   fontSize: 14,
                          //                   fontWeight: FontWeight.w600,
                          //                   color: Color(0xFF2F2D2C),
                          //                 ),
                          //               ),
                          //             ),
                          //             InkWell(
                          //               onTap: () {
                          //                 count++;
                          //                 setState(() {});
                          //               },
                          //               child: Container(
                          //                 height: 28,
                          //                 width: 28,
                          //                 decoration: BoxDecoration(
                          //                     shape: BoxShape.circle,
                          //                     border:
                          //                         Border.all(color: Color(0xFFEAEAEA))),
                          //                 child: Icon(
                          //                   Iconsax.add,
                          //                   size: 16,
                          //                   color: Colors.black,
                          //                 ),
                          //               ),
                          //             )
                          //           ],
                          //         ),
                          //       ]),
                          // ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: Divider(
                    height: 4,
                    thickness: 4,
                    color: Color(0xFFF4F4F4),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Color(0xFFFFFFFF),
                            border: Border.all(color: Color(0xFFEAEAEA))),
                        height: 56,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Icon(
                                      Iconsax.discount_shape5,
                                      color: Color(0xFFC67C4E),
                                    ),
                                  ),
                                  Text(
                                    "1 Discount is applied",
                                    style: GoogleFonts.sora(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF2F2D2C),
                                    ),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 14,
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(
                          "Payment Summary",
                          style: GoogleFonts.sora(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF2F2D2C),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Price",
                            style: GoogleFonts.sora(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF2F2D2C),
                            ),
                          ),
                          Text(
                            "\$ ${myType.total()}",
                            style: GoogleFonts.sora(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF2F2D2C),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Delivery Fee",
                            style: GoogleFonts.sora(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF2F2D2C),
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: Text(
                                  "\$ 2.0",
                                  style: TextStyle(
                                      decoration: TextDecoration.lineThrough),
                                ),
                              ),
                              Text(
                                "\$ ${myType.deliveryCharge}",
                                style: GoogleFonts.sora(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF2F2D2C),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Divider(
                        color: Color(0xFFEAEAEA),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total Payment",
                            style: GoogleFonts.sora(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF2F2D2C),
                            ),
                          ),
                          Text(
                            "\$ ${myType.coffeeTotal}",
                            style: GoogleFonts.sora(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF2F2D2C),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget singleCoffee(CoffeeModel coffee, BuildContext cont) {
    return Container(
      height: 60,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          children: [
            if (coffee?.image != null)
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                        image: AssetImage(coffee!.image), fit: BoxFit.cover)),
              ),
            const SizedBox(
              width: 12,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    coffee?.name ?? "",
                    style: AppTheme.largeText.copyWith(fontSize: 15),
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
                        .copyWith(fontSize: 12, color: Colors.black),
                  ),
                ],
              ),
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
                    backgroundColor: Color.fromARGB(255, 228, 225, 225),
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
                  size: 14,
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
