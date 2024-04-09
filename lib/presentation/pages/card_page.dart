import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

import '../../logic/cubit/card_cubit.dart';

class CardPage extends StatefulWidget {
  static const routeName = '/cardPage';
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  CardType cardType(String cardNumber) {
    if (cardNumber.substring(0, 1) == '3') {
      return CardType.americanExpress;
    } else if (cardNumber.substring(0, 1) == '4') {
      return CardType.visa;
    } else if (cardNumber.substring(0, 1) == '5') {
      return CardType.mastercard;
    } else if (cardNumber.substring(0, 1) == '6') {
      return CardType.discover;
    } else {
      return CardType.otherBrand;
    }
  }

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    setState(() {
      cardNumber = creditCardModel!.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }

  @override
  Widget build(BuildContext context) {
    var appBar2 = AppBar(
      centerTitle: true,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.arrow_back_ios_new_rounded),
      ),
      backgroundColor: Colors.transparent,
      title: const Text(
        'Enter Card Details',
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
    Size size = MediaQuery.of(context).size;
    var height = size.height;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 236, 236, 236),
      extendBodyBehindAppBar: true,
      appBar: appBar2,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            top: height * 0.15,
            bottom: height * 0.02,
          ),
          height: height,
          child: BlocBuilder<CardCubit, CardState>(
            builder: (context, state) {
              if (state.cardNumber != '') {
                cardNumber = state.cardNumber;
                cvvCode = state.cardCVV;
                cardHolderName = state.cardHolderName!;
                expiryDate = state.expiryDate!;
              }
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CreditCardWidget(
                    height: size.height * 0.3,
                    cardNumber: cardNumber,
                    expiryDate: expiryDate,
                    cardHolderName: cardHolderName,
                    cvvCode: cvvCode,
                    showBackView: isCvvFocused,
                    obscureCardNumber: true,
                    obscureCardCvv: true,
                    isHolderNameVisible: true,
                    isSwipeGestureEnabled: true,
                    cardType: cardNumber.isNotEmpty
                        ? cardType(cardNumber)
                        : CardType.otherBrand,
                    onCreditCardWidgetChange: (creditCardBrand) {
                      creditCardBrand.brandName;
                    },
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        CreditCardForm(
                          formKey: formKey,
                          cardNumber: cardNumber,
                          cvvCode: cvvCode,
                          cardHolderName: cardHolderName,
                          expiryDate: expiryDate,
                          onCreditCardModelChange: onCreditCardModelChange,
                          isExpiryDateVisible: true,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            backgroundColor: const Color(0xff1b447b),
                          ),
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            child: const Text(
                              'Validate',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'halter',
                                fontSize: 14,
                                package: 'flutter_credit_card',
                              ),
                            ),
                          ),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              context.read<CardCubit>().onEditComplete(
                                    cardNumber: cardNumber,
                                    cardCVV: cvvCode,
                                    expiryDate: expiryDate,
                                    cardHolderName: cardHolderName,
                                  );
                              Navigator.pop(context);
                            } else {
                              print('invalid!');
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
