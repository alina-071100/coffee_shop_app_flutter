import 'package:coffee_shop_app/models/coffee_models.dart';
import 'package:coffee_shop_app/provider/favorit_page_provider.dart';
import 'package:coffee_shop_app/screens/coffee_detail.dart';
import 'package:coffee_shop_app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

class LikePage extends StatefulWidget {
  const LikePage({super.key});

  @override
  State<LikePage> createState() => _LikePageState();
}

class _LikePageState extends State<LikePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<FavouritListProvider>(
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
                        "Favourit",
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
                      child: myType.favouritList.isNotEmpty
                          ? ListView.builder(
                              itemCount: myType.favouritList.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 4.0),
                                  child: InkWell(
                                    onTap: () {
                                      if (myType.favouritList != []) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => DetailPage(
                                                coffee:
                                                    myType.favouritList[index]),
                                          ),
                                        );
                                      }
                                    },
                                    child: singleCoffee(
                                        myType.favouritList[index], context),
                                  ),
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
                                    Iconsax.heart,
                                    size: 40,
                                    color: Colors.grey,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "Your favourit list is empty!",
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
            ],
          ),
        );
      },
    );
  }

  Widget singleCoffee(CoffeeModel coffee, BuildContext cont) {
    return SizedBox(
      height: 100,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          children: [
            if (coffee?.image != null)
              Container(
                width: 100,
                height: 100,
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
                const SizedBox(
                  height: 2,
                ),
                Text(coffee?.name ?? "",
                    style: AppTheme.largeText
                        .copyWith(fontSize: 18)
                        .copyWith(overflow: TextOverflow.ellipsis)),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2.9,
                  child: Text(
                    coffee?.coffeeWith ?? "",
                    style:
                        AppTheme.coffeeWithText.copyWith(fontSize: 16).copyWith(
                              overflow: TextOverflow.ellipsis,
                            ),
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  "\$ ${coffee.priceItems} ",
                  style: AppTheme.coffeeWithText
                      .copyWith(fontSize: 16, color: Colors.black),
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
            // const SizedBox(
            //   width: 10,
            // ),
            GestureDetector(
              onTap: () {
                cont.read<FavouritListProvider>().addorRemove(coffee);
                ScaffoldMessenger.of(cont).showSnackBar(
                  const SnackBar(
                    backgroundColor: Color.fromARGB(255, 134, 124, 124),
                    content: Text(
                      "Item removed!",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                );
              },
              child: CircleAvatar(
                backgroundColor: Colors.redAccent.withOpacity(0.07),
                radius: 25,
                child: const Icon(
                  Icons.favorite,
                  color: Colors.redAccent,
                  size: 20,
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
