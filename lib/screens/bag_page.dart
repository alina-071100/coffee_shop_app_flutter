import 'package:coffee_shop_app/models/coffee_models.dart';
import 'package:coffee_shop_app/provider/menu_page_provider.dart';
import 'package:coffee_shop_app/screens/order_page.dart';
import 'package:coffee_shop_app/theme/app_theme.dart';
import 'package:coffee_shop_app/widgets/custom_filledbutton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

class BagPage extends StatefulWidget {
  const BagPage({super.key});

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
                    const SizedBox(
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
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      height: 600,
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
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  const Icon(
                                    Iconsax.bag,
                                    size: 40,
                                    color: Colors.grey,
                                  ),
                                  const SizedBox(
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
                              color: AppTheme.buttonColor,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Checkout',
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
    return SizedBox(
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
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
             const   SizedBox(
                  height: 2,
                ),
                Text(coffee?.name ?? "",
                    style: AppTheme.largeText
                        .copyWith(fontSize: 16)
                        .copyWith(overflow: TextOverflow.ellipsis)),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2.9,
                  child: Text(
                    coffee?.coffeeWith ?? "",
                    style:
                        AppTheme.coffeeWithText.copyWith(fontSize: 12).copyWith(
                              overflow: TextOverflow.ellipsis,
                            ),
                  ),
                ),
              const  SizedBox(
                  height: 2,
                ),
                Text(
                  "\$ ${coffee.priceItems} ",
                  style: AppTheme.coffeeWithText
                      .copyWith(fontSize: 15, color: Colors.black),
                ),
               const SizedBox(
                  height: 1,
                ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            InkWell(
              onTap: () {
                cont.read<MenuPageProvider>().minusItem(coffee);
              },
              child: const Icon(
                Iconsax.minus,
                size: 25,
              ),
            ),
            Text("${coffee.count ?? ""}"),
            InkWell(
              onTap: () {
                cont.read<MenuPageProvider>().plusItem(coffee);
              },
              child: const Icon(
                Iconsax.add,
                size: 25,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: () {
                cont.read<MenuPageProvider>().deletedItem(coffee);
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
          ],
        ),
      ]),
    );
  }
}
