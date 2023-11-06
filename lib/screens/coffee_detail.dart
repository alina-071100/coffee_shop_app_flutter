// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:coffee_shop_app/provider/favorit_page_provider.dart';
import 'package:coffee_shop_app/screens/card/credit_card_page.dart';
import 'package:coffee_shop_app/widgets/navigator_widget.dart';
import 'package:coffee_shop_app/theme/app_theme.dart';
import 'package:coffee_shop_app/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

import 'package:coffee_shop_app/models/coffee_models.dart';
import 'package:coffee_shop_app/widgets/custom_filledbutton.dart';

class DetailPage extends StatefulWidget {
  final CoffeeModel coffee;

  const DetailPage({
    Key? key,
    required this.coffee,
  }) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  List<String> sizeItems = ["S", "M", "L"];
  int selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<FavouritListProvider>(
      builder: (context, myType, child) {
        return Scaffold(
          backgroundColor: const Color.fromARGB(255, 251, 249, 249),
          resizeToAvoidBottomInset: false,
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
                color: AppTheme.button2Color,
                borderRadius: BorderRadius.circular(24)),
            height: size.height * 0.13,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Price',
                        style: AppTheme.priceText,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(text: '\$ ', style: AppTheme.priceValue),
                            TextSpan(
                                text: widget.coffee.price.toString(),
                                style: AppTheme.priceValue),
                          ],
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      // ignore: avoid_print
                      print(widget.coffee);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CreditCartPage()));
                    },
                    child: CustomFilledButton(
                      width: MediaQuery.of(context).size.width / 1.8,
                      height: 62,
                      borderRadius: 16,
                      color: AppTheme.buttonColor,
                      child: Text('Buy Now', style: AppTheme.bottomText),
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomAppBar(
                  title: "Detail",
                  suffixIcon: Iconsax.heart,
                  functionBackIcon: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NavigatorWidget(),
                      ),
                    );
                  },
                  icon: widget.coffee.isFavorite ?? false
                      ? const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )
                      : const Icon(
                          Icons.favorite_border,
                        ),
                  functionLikeIcon: () {
                    myType.addorRemove(widget.coffee);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Container(
                    // width: 315,
                    height: size.height * 0.25,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            widget.coffee.image,
                          ),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.coffee.name,
                            style: AppTheme.coffeeNameText,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            widget.coffee.coffeeWith,
                            style: AppTheme.coffeeWithText,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.star_rounded,
                                color: AppTheme.starColor,
                                size: 30,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                widget.coffee.rate.toString(),
                                style: AppTheme.largeText,
                              ),
                              Text(
                                " (230)",
                                style: AppTheme.coffeeWithText,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            height: 44,
                            width: 44,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: const Color.fromARGB(255, 239, 238, 238),
                            ),
                            child: Image.asset(
                              "assets/images/coffee-bean.png",
                              color: AppTheme.buttonColor,
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            height: 44,
                            width: 44,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: const Color.fromARGB(255, 239, 238, 238),
                            ),
                            child: Image.asset(
                              "assets/images/packaging.png",
                              color: AppTheme.buttonColor,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                const Center(
                  child: Padding(
                    padding: EdgeInsets.only(right: 0),
                    child: Divider(
                      color: Color(0xFFEAEAEA),
                      thickness: 1,
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Description",
                      style: AppTheme.largeText,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    SizedBox(
                      height: 69,
                      child: SingleChildScrollView(
                        child: ReadMoreText(
                          widget.coffee.description.toString(),
                          style: AppTheme.readeMoreText,
                          trimMode: TrimMode.Line,
                          moreStyle: const TextStyle(
                              color: AppTheme.buttonColor,
                              fontWeight: FontWeight.bold),
                          lessStyle: const TextStyle(
                              color: AppTheme.buttonColor,
                              fontWeight: FontWeight.bold),
                          trimLines: 3,
                          trimCollapsedText: "Read More",
                          trimExpandedText: " Show Less",
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Size",
                    style: AppTheme.largeText,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ...List.generate(
                          sizeItems.length,
                          (index) => Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    selectedItem = index;
                                    setState(() {});
                                    // ignore: avoid_print
                                    print(selectedItem);
                                  },
                                  child: SizeChoiseView(
                                    size: sizeItems[index],
                                    index: index,
                                    selected: selectedItem == index,
                                  ),
                                ),
                              )),
                    ]),
                const SizedBox(
                  height: 17,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// ignore: must_be_immutable
class SizeChoiseView extends StatelessWidget {
  int? index;
  bool? selected;
  String? size;
  SizeChoiseView({
    Key? key,
    this.size,
    this.index,
    this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: index != 0 ? 12 : 0),
      child: CustomFilledButton(
        height: 43,
        color: selected == false ? AppTheme.textColor : const Color(0xFFFFF5EE),
        borderColor:
            selected == false ? const Color(0xFFDEDEDE) : AppTheme.buttonColor,
        child: Text(
          size ?? "",
          style: GoogleFonts.sora(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF2F2D2C),
          ),
        ),
      ),
    );
  }
}
