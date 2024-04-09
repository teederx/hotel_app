import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_app/presentation/pages/card_page.dart';
import 'package:hotel_app/presentation/pages/home_page.dart';
import 'package:hotel_app/presentation/pages/open_page.dart';
import 'package:hotel_app/presentation/pages/options_page.dart';
import 'package:hotel_app/presentation/pages/payment_page.dart';
import 'package:hotel_app/presentation/pages/reviews_page.dart';

import 'logic/cubit/card_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  final CardCubit _cardCubit = CardCubit();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hotel App',
      theme: ThemeData(
        fontFamily: 'Jost',
        useMaterial3: true,
      ),
      initialRoute: OpenPage.routeName,
      routes: {
        OpenPage.routeName: (context) => const OpenPage(),
        HomePage.routeName: (context) => const HomePage(),
        OptionsPage.routeName: (context) => const OptionsPage(),
        ReviewsPage.routeName: (context) => const ReviewsPage(),
        PaymentPage.routeName: (context) => BlocProvider.value(
              value: _cardCubit,
              child: const PaymentPage(),
            ),
        CardPage.routeName: (context) => BlocProvider.value(
              value: _cardCubit,
              child: const CardPage(),
            ),
      },
    );
  }
  @override
  void dispose() {
    _cardCubit.close();
    super.dispose();
  }
}
