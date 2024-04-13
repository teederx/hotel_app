import 'package:flutter/material.dart';

import 'notes.dart';

class PaymentConditions extends StatelessWidget {
  const PaymentConditions({
    super.key,
    required this.height,
    required this.size,
    required this.innerCard, 
    required this.leadingText,
  });

  final double height;
  final Size size;
  final String leadingText;
  final Widget innerCard;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(
          top: height * 0.15,
          bottom: height * 0.02,
          left: 15,
          right: 15,
        ),
        height: height * 0.9,
        width: size.width,
        // color: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              leadingText,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            innerCard,
            SizedBox(
              height: height * 0.2,
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
    );
  }
}
