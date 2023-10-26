// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:coffee_shop_app/screens/order_page.dart';
import 'package:coffee_shop_app/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

import 'package:coffee_shop_app/models/coffee_models.dart';
import 'package:coffee_shop_app/test.dart';
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
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 251, 249, 249),
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            color: const Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(24)),
        height: 121,
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
                    style: GoogleFonts.sora(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF9B9B9B),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: '\$ ',
                            style: GoogleFonts.sora(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFFC67C4E))),
                        TextSpan(
                            text: widget.coffee.price.toString(),
                            style: GoogleFonts.sora(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFFC67C4E))),
                      ],
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  print(widget.coffee);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OrderPage(
                                coffee: widget.coffee,
                              )));
                },
                child: CustomFilledButton(
                  width: 217,
                  height: 62,
                  borderRadius: 16,
                  color: const Color(0xFFC67C4E),
                  child: Text('Buy Now',
                      style: GoogleFonts.sora(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFFFFFFF))),
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
                    builder: (context) => const TestTest(),
                  ),
                );
              },
              functionLikeIcon: () {},
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Container(
                // width: 315,
                height: 226,
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
                        style: GoogleFonts.sora(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF2F2D2C),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        widget.coffee.coffeeWith,
                        style: GoogleFonts.sora(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF9B9B9B),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.star_rounded,
                            color: Color(0xFFFBBE21),
                            size: 30,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            widget.coffee.rate.toString(),
                            style: GoogleFonts.sora(
                                color: const Color(0xFF2F2D2C),
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            " (230)",
                            style: GoogleFonts.sora(
                                color: const Color(0xFF9B9B9B),
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
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
                          color: Color(0xFFF9F9F9),
                        ),
                        child: Image.asset(
                          "assets/images/coffee-bean.png",
                          color: Color(0xFFC67C4E),
                          // height: 24,
                          // width: 24,
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        height: 44,
                        width: 44,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Color(0xFFF9F9F9),
                        ),
                        child: Image.asset(
                          "assets/images/packaging.png",
                          color: Color(0xFFC67C4E),
                          // height: 24,
                          // width: 24,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            const Center(
              child: Padding(
                padding: const EdgeInsets.only(right: 0),
                child: Divider(
                  color: Color(0xFFEAEAEA),
                  thickness: 1,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Description",
                  style: GoogleFonts.sora(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF2F2D2C),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  height: 69,
                  child: SingleChildScrollView(
                    child: ReadMoreText(
                      widget.coffee.description.toString(),

                      style: GoogleFonts.sora(
                        fontSize: 14,
                        height: 1.65,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF9B9B9B),
                      ),
                      trimMode: TrimMode.Line,
                      moreStyle: TextStyle(
                          color: Color(0xFFC67C4E),
                          fontWeight: FontWeight.bold),

                      lessStyle: TextStyle(
                          color: Color(0xFFC67C4E),
                          fontWeight: FontWeight.bold),
                      trimLines: 3,
                      trimCollapsedText: "Read More",
                      trimExpandedText: " Show Less",
                      // colorClickableText: Color(0xFFC67C4E),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Size",
                style: GoogleFonts.sora(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF2F2D2C),
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              ...List.generate(
                  sizeItems.length,
                  (index) => Expanded(
                        child: GestureDetector(
                          onTap: () {
                            selectedItem = index;
                            setState(() {});
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
            SizedBox(
              height: 17,
            ),
          ],
        ),
      ),
    );
  }
}

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
        color: selected == false ? Color(0xFFFFFFFF) : Color(0xFFFFF5EE),
        borderColor: selected == false ? Color(0xFFDEDEDE) : Color(0xFFC67C4E),
        child: Text(
          size ?? "",
          style: GoogleFonts.sora(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0xFF2F2D2C),
          ),
          // style: Color(0xFFFFFFFF),
        ),
      ),
    );
  }
}
