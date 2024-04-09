import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_app/logic/cubit/card_cubit.dart';
import 'package:hotel_app/presentation/pages/card_page.dart';

class PaymentPage extends StatefulWidget {
  static const routeName = '/paymentPage';
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final TextEditingController _cardNumController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();
  bool _cardNumVisible = true;
  bool _cardCVVVisible = true;
  @override
  Widget build(BuildContext context) {
    var appBar2 = AppBar(
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.arrow_back_ios_new_rounded),
      ),
      backgroundColor: Colors.transparent,
      title: const Text(
        'Payment Page',
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {},
          child: const Text(
            'promo code',
            style: TextStyle(
              color: Color.fromRGBO(17, 94, 244, 1),
              fontWeight: FontWeight.w200,
              fontSize: 10,
            ),
          ),
        ),
      ],
    );
    Size size = MediaQuery.of(context).size;
    final height = size.height - appBar2.preferredSize.height;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 236, 236, 236),
      appBar: appBar2,
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(
            top: height * 0.15,
            bottom: height * 0.05,
            left: 15,
            right: 15,
          ),
          height: height * 0.88,
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Choose your payment method',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Container(
                height: height * 0.53,
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BlocBuilder<CardCubit, CardState>(
                      builder: (context, state) {
                        if (state.cardNumber != '') {
                          _cardNumController.text = state.cardNumber;
                          _cvvController.text = state.cardCVV;
                        } else {
                          _cardNumController.clear();
                          _cvvController.clear();
                        }
                        return Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.credit_card_rounded),
                                  SizedBox(
                                    width: size.width * 0.05,
                                  ),
                                  const Text(
                                    'Credit Card Payment',
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              TextField(
                                obscureText: _cardNumVisible,
                                controller: _cardNumController,
                                readOnly: true,
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    onPressed: () => setState(() {
                                      _cardNumVisible = !_cardNumVisible;
                                    }),
                                    icon: Icon(
                                      _cardNumVisible
                                          ? Icons.visibility_outlined
                                          : Icons.visibility_off_outlined,
                                    ),
                                  ),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                  labelStyle: const TextStyle(
                                    color: Color.fromRGBO(184, 183, 183, 1),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
                                  ),
                                  isDense: true,
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 1,
                                    horizontal: 6,
                                  ),
                                  labelText: 'xxxx-xxxx-xxxx-xxxx',
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                // crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    width: size.width * 0.3,
                                    child: TextField(
                                      controller: _cvvController,
                                      obscureText: _cardCVVVisible,
                                      readOnly: true,
                                      decoration: InputDecoration(
                                        suffixIcon: IconButton(
                                          onPressed: () => setState(() {
                                            _cardCVVVisible = !_cardCVVVisible;
                                          }),
                                          icon: Icon(
                                            _cardCVVVisible
                                                ? Icons.visibility_outlined
                                                : Icons.visibility_off_outlined,
                                          ),
                                        ),
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.never,
                                        labelStyle: const TextStyle(
                                          color:
                                              Color.fromRGBO(184, 183, 183, 1),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w300,
                                        ),
                                        isDense: true,
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                          vertical: 1,
                                          horizontal: 6,
                                        ),
                                        labelText: 'CVV',
                                        focusedBorder:
                                            const UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                          ),
                                        ),
                                        enabledBorder:
                                            const UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  if (state.cardNumber == '')
                                    ElevatedButton(
                                      onPressed: () => Navigator.pushNamed(
                                          context, CardPage.routeName),
                                      style: ElevatedButton.styleFrom(
                                        elevation: 3,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        backgroundColor: const Color.fromRGBO(
                                            17, 94, 244, 1),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                      ),
                                      //TODO: Work on edit card Details...
                                      child: const Text(
                                        'Enter Card Details',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w200,
                                        ),
                                      ),
                                    ),
                                  if (state.cardNumber != '')
                                    ElevatedButton(
                                      onPressed: () =>
                                          context.read<CardCubit>().clear(),
                                      style: ElevatedButton.styleFrom(
                                        elevation: 3,
                                        backgroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          side: const BorderSide(
                                              color: Colors.black),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                      ),
                                      child: const Text(
                                        'clear fields',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w200,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    const Divider(),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.wallet_rounded),
                              SizedBox(
                                width: size.width * 0.05,
                              ),
                              const Text(
                                'Mobile UPI Payment',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          const TextField(
                            showCursor: false,
                            keyboardType: TextInputType.none,
                            decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              labelStyle: TextStyle(
                                color: Color.fromRGBO(184, 183, 183, 1),
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                              ),
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 1,
                                horizontal: 6,
                              ),
                              labelText: 'upi-id@okicici',
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.laptop_windows_rounded),
                              SizedBox(
                                width: size.width * 0.05,
                              ),
                              const Text(
                                'Net Banking',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          TextField(
                            showCursor: false,
                            keyboardType: TextInputType.none,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.expand_more_rounded,
                                  color: Color.fromRGBO(183, 162, 162, 1),
                                ),
                              ),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              labelStyle: const TextStyle(
                                color: Color.fromRGBO(184, 183, 183, 1),
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                              ),
                              isDense: true,
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 1,
                                horizontal: 6,
                              ),
                              labelText: 'Choose your bank account',
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        elevation: 2,
                        backgroundColor: Colors.black,
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.1,
                        ),
                      ),
                      child: const Text(
                        'Confirm Payment',
                        style: TextStyle(
                          color: Color.fromRGBO(222, 221, 221, 1),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.15,
                width: double.infinity,
                // color: Colors.black,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Notes(
                      note: 'Your payment is secured and encrypted.',
                      number: '1.',
                    ),
                    Notes(
                      note: 'Once your payment is done, there is no refund.',
                      number: '2.',
                    ),
                    Notes(
                      note:
                          'Before payment, please go through the payment policy.',
                      number: '3.',
                    ),
                    Notes(
                      note:
                          'If you have any issues in payment, contact our customer support.',
                      number: '4.',
                    ),
                  ],
                ),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    elevation: 2,
                    backgroundColor: Colors.black,
                    padding: EdgeInsets.only(
                      right: size.width * 0.25,
                      left: 10,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.headset_mic_outlined,
                        size: 18,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: size.width * 0.15,
                      ),
                      const Text(
                        'Help',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child: InkWell(
                  onTap: () {},
                  child: const Text(
                    'payment policy',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Color.fromRGBO(0, 0, 0, 0.7),
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Notes extends StatelessWidget {
  const Notes({
    super.key,
    required this.note,
    required this.number,
  });
  final String number;
  final String note;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          number,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color.fromRGBO(0, 0, 0, 0.8),
          ),
        ),
        SizedBox(
          width: size.width * 0.85,
          // color: Colors.black,
          child: SizedBox(
            child: Text(
              note,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color.fromRGBO(0, 0, 0, 0.8),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
