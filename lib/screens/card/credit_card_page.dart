import 'package:coffee_shop_app/screens/bag_page.dart';
import 'package:coffee_shop_app/screens/card/app_color.dart';
import 'package:coffee_shop_app/screens/delivery_page.dart';
import 'package:coffee_shop_app/screens/order_page.dart';
import 'package:coffee_shop_app/test.dart';
import 'package:coffee_shop_app/widgets/custom_app_bar.dart';
import 'package:coffee_shop_app/widgets/custom_filledbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class CreditCartPage extends StatefulWidget {
  const CreditCartPage({super.key});

  @override
  State<StatefulWidget> createState() => MySampleState();
}

class MySampleState extends State<CreditCartPage> {
  bool isLightTheme = false;
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = false;
  bool useFloatingAnimation = true;
  final OutlineInputBorder border = OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.grey.withOpacity(0.7),
      width: 2.0,
    ),
  );
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(
    //   isLightTheme ? SystemUiOverlayStyle.dark : SystemUiOverlayStyle.light,
    // );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // themeMode: isLightTheme ? ThemeMode.light : ThemeMode.dark,
      // theme: ThemeData(
      //   textTheme: const TextTheme(
      //     // Text style for text fields' input.
      //     titleMedium: TextStyle(color: Colors.black, fontSize: 18),
      //   ),
      //   colorScheme: ColorScheme.fromSeed(
      //     brightness: Brightness.light,
      //     seedColor: Colors.white,
      //     background: Colors.black,
      //     // Defines colors like cursor color of the text fields.
      //     primary: Colors.black,
      //   ),
      //   // Decoration theme for the text fields.
      //   inputDecorationTheme: InputDecorationTheme(
      //     hintStyle: const TextStyle(color: Colors.black),
      //     labelStyle: const TextStyle(color: Colors.black),
      //     focusedBorder: border,
      //     enabledBorder: border,
      //   ),
      // ),
      // darkTheme: ThemeData(
      //   textTheme: const TextTheme(
      //     // Text style for text fields' input.
      //     titleMedium: TextStyle(color: Colors.white, fontSize: 18),
      //   ),
      //   colorScheme: ColorScheme.fromSeed(
      //     brightness: Brightness.dark,
      //     seedColor: Colors.black,
      //     background: Colors.white,
      //     // Defines colors like cursor color of the text fields.
      //     primary: Colors.white,
      //   ),
      //   // Decoration theme for the text fields.
      //   inputDecorationTheme: InputDecorationTheme(
      //     hintStyle: const TextStyle(color: Colors.white),
      //     labelStyle: const TextStyle(color: Colors.white),
      //     focusedBorder: border,
      //     enabledBorder: border,
      //   ),
      // ),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Builder(builder: (BuildContext context) {
          return Container(
            // decoration: BoxDecoration(
            //   image: DecorationImage(
            //     // image: AssetImage('assets/bg-light.png'),
            //     fit: BoxFit.fill,
            //   ),
            // ),
            child: SafeArea(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 15, bottom: 20),
                    child: CustomAppBar(
                      title: "Add card",
                      functionBackIcon: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OrderPage(),
                          ),
                        );
                      },
                    ),
                  ),
                  IconButton(
                    onPressed: () => setState(() {
                      isLightTheme = !isLightTheme;
                    }),
                    icon: Icon(
                      isLightTheme ? Icons.light_mode : Icons.dark_mode,
                    ),
                  ),
                  CreditCardWidget(
                    enableFloatingCard: useFloatingAnimation,
                    // glassmorphismConfig: _getGlassmorphismConfig(),
                    cardNumber: cardNumber,
                    expiryDate: expiryDate,
                    cardHolderName: cardHolderName,
                    cvvCode: cvvCode,
                    bankName: 'Axis Bank',
                    frontCardBorder: useGlassMorphism
                        ? null
                        : Border.all(color: Colors.grey),
                    backCardBorder: useGlassMorphism
                        ? null
                        : Border.all(color: Colors.grey),
                    showBackView: isCvvFocused,
                    obscureCardNumber: true,
                    obscureCardCvv: true,
                    isHolderNameVisible: true,
                    cardBgColor: isLightTheme
                        ? AppColors.cardBgLightColor
                        : AppColors.cardBgColor,
                    backgroundImage:
                        useBackgroundImage ? 'assets/card_bg.png' : null,
                    isSwipeGestureEnabled: true,
                    onCreditCardWidgetChange:
                        (CreditCardBrand creditCardBrand) {},
                    customCardTypeIcons: <CustomCardTypeIcon>[
                      CustomCardTypeIcon(
                        cardType: CardType.mastercard,
                        cardImage: Image.asset(
                          'assets/mastercard.png',
                          height: 48,
                          width: 48,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                      child: SingleChildScrollView(
                    child: Column(children: <Widget>[
                      CreditCardForm(
                        formKey: formKey,
                        obscureCvv: true,
                        obscureNumber: true,
                        cardNumber: cardNumber,
                        cvvCode: cvvCode,
                        isHolderNameVisible: true,
                        isCardNumberVisible: true,
                        isExpiryDateVisible: true,
                        cardHolderName: cardHolderName,
                        expiryDate: expiryDate,
                        inputConfiguration: const InputConfiguration(
                          cardNumberDecoration: InputDecoration(
                            labelText: 'Number',
                            hintText: 'XXXX XXXX XXXX XXXX',
                          ),
                          expiryDateDecoration: InputDecoration(
                            labelText: 'Expired Date',
                            hintText: 'XX/XX',
                          ),
                          cvvCodeDecoration: InputDecoration(
                            labelText: 'CVV',
                            hintText: 'XXX',
                          ),
                          cardHolderDecoration: InputDecoration(
                            labelText: 'Card Holder',
                          ),
                        ),
                        onCreditCardModelChange: onCreditCardModelChange,
                      ),
                      const SizedBox(height: 20),
                      // Padding(
                      //   padding:
                      //       const EdgeInsets.symmetric(horizontal: 16),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     children: <Widget>[
                      //       const Text('Glassmorphism'),
                      //       const Spacer(),
                      //       Switch(
                      //         value: useGlassMorphism,
                      //         inactiveTrackColor: Colors.grey,
                      //         activeColor: Colors.white,
                      //         activeTrackColor: AppColors.colorE5D1B2,
                      //         onChanged: (bool value) => setState(() {
                      //           useGlassMorphism = value;
                      //         }),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // Padding(
                      //   padding:
                      //       const EdgeInsets.symmetric(horizontal: 16),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     children: <Widget>[
                      //       const Text('Card Image'),
                      //       const Spacer(),
                      //       Switch(
                      //         value: useBackgroundImage,
                      //         inactiveTrackColor: Colors.grey,
                      //         activeColor: Colors.white,
                      //         activeTrackColor: AppColors.colorE5D1B2,
                      //         onChanged: (bool value) => setState(() {
                      //           useBackgroundImage = value;
                      //         }),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // Padding(
                      //   padding:
                      //       const EdgeInsets.symmetric(horizontal: 16),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     children: <Widget>[
                      //       const Text('Floating Card'),
                      //       const Spacer(),
                      //       Switch(
                      //         value: useFloatingAnimation,
                      //         inactiveTrackColor: Colors.grey,
                      //         activeColor: Colors.white,
                      //         activeTrackColor: AppColors.colorE5D1B2,
                      //         onChanged: (bool value) => setState(() {
                      //           useFloatingAnimation = value;
                      //         }),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      const SizedBox(height: 20),
                      // GestureDetector(
                      //   onTap: _onValidate,
                      //   child: Container(
                      //     margin: const EdgeInsets.symmetric(
                      //       horizontal: 16,
                      //       vertical: 8,
                      //     ),
                      //     decoration: const BoxDecoration(
                      //       gradient: LinearGradient(
                      //         colors: <Color>[
                      //           AppColors.colorB58D67,
                      //           AppColors.colorB58D67,
                      //           AppColors.colorE5D1B2,
                      //           Color.fromARGB(255, 248, 229, 182),
                      //           Color.fromARGB(255, 232, 179, 127),
                      //           Color.fromARGB(255, 223, 191, 149),
                      //           Color.fromARGB(255, 187, 124, 64),
                      //         ],
                      //         begin: Alignment(-1, -4),
                      //         end: Alignment(1, 4),
                      //       ),
                      //       borderRadius: BorderRadius.all(
                      //         Radius.circular(8),
                      //       ),
                      //     ),
                      //     padding: const EdgeInsets.symmetric(vertical: 15),
                      //     alignment: Alignment.center,
                      //     child: const Text(
                      //       'Validate',
                      //       style: TextStyle(
                      //         color: Colors.black,
                      //         fontFamily: 'halter',
                      //         fontSize: 14,
                      //         package: 'flutter_credit_card',
                      //       ),
                      //     ),
                      //   ),
                      // ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 90),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const DeliveryPage(),
                              ),
                            );
                          },
                          child: CustomFilledButton(
                            height: 50,
                            borderRadius: 16,
                            color: const Color(0xFFC67C4E),
                            child: Text('Save',
                                style: GoogleFonts.sora(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFFFFFFFF))),
                          ),
                        ),
                      ),
                    ]),
                  ))
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  void _onValidate() {
    if (formKey.currentState?.validate() ?? false) {
      print('valid!');
    } else {
      print('invalid!');
    }
  }

  // Glassmorphism? _getGlassmorphismConfig() {
  //   if (!useGlassMorphism) {
  //     return null;
  //   }

  final LinearGradient gradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: <Color>[Colors.grey.withAlpha(50), Colors.grey.withAlpha(50)],
    stops: const <double>[0.3, 0],
  );

  //   return isLightTheme
  //       ? Glassmorphism(blurX: 8.0, blurY: 16.0, gradient: gradient)
  //       : Glassmorphism.defaultConfig();
  // }

  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}
