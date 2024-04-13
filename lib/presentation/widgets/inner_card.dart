
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/cubit/card_cubit.dart';
import '../pages/card_page.dart';

class InnerCard extends StatefulWidget {
  const InnerCard({
    super.key,
    required this.height,
    required this.size,
  });

  final double height;
  final Size size;

  @override
  State<InnerCard> createState() => _InnerCardState();
}

class _InnerCardState extends State<InnerCard> {
  final TextEditingController _cardNumController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();
  bool _cardNumVisible = true;
  bool _cardCVVVisible = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height * 0.53,
      width: double.infinity,
      margin: EdgeInsets.symmetric(
        vertical: widget.height * 0.01,
      ),
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
                          width: widget.size.width * 0.05,
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
                        floatingLabelBehavior: FloatingLabelBehavior.never,
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: widget.size.width * 0.3,
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
                                color: Color.fromRGBO(184, 183, 183, 1),
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                              ),
                              isDense: true,
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 1,
                                horizontal: 6,
                              ),
                              labelText: 'CVV',
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
                        ),
                        if (state.cardNumber == '')
                          ElevatedButton(
                            onPressed: () => Navigator.pushNamed(
                                context, CardPage.routeName),
                            style: ElevatedButton.styleFrom(
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              backgroundColor:
                                  const Color.fromRGBO(17, 94, 244, 1),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
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
                            onPressed: () => context.read<CardCubit>().clear(),
                            style: ElevatedButton.styleFrom(
                              elevation: 3,
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
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
                      width: widget.size.width * 0.05,
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
                  // keyboardType: TextInputType.none,
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
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
                      width: widget.size.width * 0.05,
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
                    floatingLabelBehavior: FloatingLabelBehavior.never,
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
                horizontal: widget.size.width * 0.1,
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
    );
  }
}
