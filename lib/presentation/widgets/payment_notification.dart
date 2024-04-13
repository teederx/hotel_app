import 'package:flutter/material.dart';
import 'package:hotel_app/presentation/pages/options_page.dart';

class PaymentNotification extends StatelessWidget {
  const PaymentNotification({
    super.key,
    required this.height,
    required this.width,
    required this.cancelPayment,
  });
  final double height;
  final double width;
  final bool cancelPayment;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: height * 0.05,
      ),
      height: height,
      width: width,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Divider(
            height: height * 0.08,
            thickness: 2,
            indent: width * 0.43,
            endIndent: width * 0.43,
            color: const Color.fromRGBO(143, 143, 143, 1),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: ShapeDecoration(
              shape: CircleBorder(
                side: BorderSide(
                  width: 3,
                  color: cancelPayment ? Colors.red : Colors.green,
                ),
              ),
            ),
            child: Icon(
              cancelPayment ? Icons.close_rounded : Icons.done_outline_rounded,
              color: cancelPayment ? Colors.red : Colors.green,
              size: 50,
            ),
          ),
          Text(
            cancelPayment ? 'Booking Canceled' : 'Payment is successful',
            style: const TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
              fontSize: 24,
              color: Colors.black,
            ),
          ),
          TextButton.icon(
            onPressed: () => Navigator.popUntil(
              context,
              (route) => route.settings.name == OptionsPage.routeName,
            ),
            icon: const Icon(
              Icons.keyboard_backspace_rounded,
              color: Colors.black,
            ),
            label: const Text(
              'Go Back',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          ),
          if (cancelPayment == false)
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    icon: const Icon(
                      Icons.notifications_active_rounded,
                    ),
                    content: const Text(
                        'You are about to cancel payment. Do you want to continue?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pop(
                            context,
                            true,
                          );
                        },
                        child: const Text('Yes'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text(
                          'No',
                        ),
                      ),
                    ],
                  ),
                );
              },
              child: const Text(
                'Cancel Booking',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Color.fromRGBO(113, 108, 108, 1),
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
