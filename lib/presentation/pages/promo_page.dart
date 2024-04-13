import 'package:flutter/material.dart';

import '../widgets/inner_card2.dart';
import '../widgets/payment_conditions.dart';

class PromoPage extends StatelessWidget {
  static const routeName = '/promo';
  const PromoPage({super.key});

  @override
  Widget build(BuildContext context) {
    var appBar2 = AppBar(
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.arrow_back_ios_new_rounded),
      ),
      backgroundColor: Colors.transparent,
      title: const Text(
        'Promo Page',
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
    Size size = MediaQuery.of(context).size;
    final height = size.height - appBar2.preferredSize.height;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color.fromARGB(255, 236, 236, 236),
      appBar: appBar2,
      body: PaymentConditions(
        leadingText: 'Promo codes available for you!!',
        height: height,
        size: size,
        innerCard: InnerCard2(height: height, size: size),
      ),
    );
  }
}

