import 'package:coffee_shop_app/screens/delivery_page.dart';
import 'package:coffee_shop_app/theme/app_theme.dart';
import 'package:coffee_shop_app/widgets/custom_app_bar.dart';
import 'package:coffee_shop_app/widgets/custom_filledbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:google_fonts/google_fonts.dart';

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
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 50, left: 30, right: 30),
        child: InkWell(
          onTap: () {
            if (_onValidate() == true) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DeliveryPage(),
                ),
              );
            }
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
      resizeToAvoidBottomInset: false,
      body: Builder(builder: (BuildContext context) {
        return Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, bottom: 20, right: 15),
                child: CustomAppBar(
                  title: "Add card",
                  functionBackIcon: () {
                    Navigator.pop(context);
                  },
                  functionLikeIcon: () {
                    setState(() {
                      isLightTheme = !isLightTheme;
                    });
                  },
                  suffixIcon: isLightTheme ? Icons.light_mode : Icons.dark_mode,
                ),
              ),
          
              CreditCardWidget(
                cardNumber: cardNumber,
                expiryDate: expiryDate,
                cardHolderName: cardHolderName,
                cvvCode: cvvCode,
                bankName: 'Axis Bank',
                frontCardBorder:
                    useGlassMorphism ? null : Border.all(color: Colors.grey),
                backCardBorder:
                    useGlassMorphism ? null : Border.all(color: Colors.grey),
                showBackView: isCvvFocused,
                obscureCardNumber: true,
                obscureCardCvv: true,
                isHolderNameVisible: true,
                cardBgColor: isLightTheme
                    ? AppTheme.cardBgLightColor
                    : AppTheme.cardBgColor,
                backgroundImage:
                    useBackgroundImage ? 'assets/card_bg.png' : null,
                isSwipeGestureEnabled: true,
                onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
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
                  const SizedBox(height: 20),
                ]),
              ))
            ],
          ),
        );
      }),
    );
  }

  bool _onValidate() {
    return formKey.currentState?.validate() ?? false;
  }

  final LinearGradient gradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: <Color>[Colors.grey.withAlpha(50), Colors.grey.withAlpha(50)],
    stops: const <double>[0.3, 0],
  );

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
