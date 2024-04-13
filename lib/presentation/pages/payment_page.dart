import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/cubit/promo_code_cubit.dart';
import '../widgets/inner_card.dart';
import '../widgets/payment_conditions.dart';
import 'promo_page.dart';

class PaymentPage extends StatefulWidget {
  static const routeName = '/paymentPage';
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
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
        BlocBuilder<PromoCodeCubit, PromoCodeState>(
          builder: (context, state) {
            // print(state.oldPromocodesLength);
            // print(state.promocodes.length);
            if (state.promocodes.length != state.oldPromocodesLength) {
              return const Text(
                'applied successfully',
                style: TextStyle(
                  color: Color.fromRGBO(45, 221, 63, 1),
                  fontWeight: FontWeight.w200,
                  fontSize: 10,
                ),
              );
            } else {
              return TextButton(
                onPressed: () =>
                    Navigator.pushNamed(context, PromoPage.routeName),
                child: const Text(
                  'promo code',
                  style: TextStyle(
                    color: Color.fromRGBO(17, 94, 244, 1),
                    fontWeight: FontWeight.w200,
                    fontSize: 10,
                  ),
                ),
              );
            }
          },
        ),
      ],
    );
    Size size = MediaQuery.of(context).size;
    final height = size.height - appBar2.preferredSize.height;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 236, 236, 236),
      appBar: appBar2,
      extendBodyBehindAppBar: true,
      body: PaymentConditions(
        leadingText: 'Choose your payment method',
        height: height,
        size: size,
        innerCard: InnerCard(height: height, size: size),
      ),
    );
  }
}
