import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingPage extends StatefulWidget {
  static const routeName = '/loadingPage';
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  bool cancelPayment = false;

  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 5),
      () => Navigator.pop(context),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final result = ModalRoute.of(context)!.settings.arguments as bool;
    setState(() {
      cancelPayment = result;
    });
    return Scaffold(
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 50.0),
              child: SpinKitWaveSpinner(
                color: Colors.black,
                duration: Duration(seconds: 6),
                curve: Curves.bounceInOut,
                size: 60,
              ),
            ),
          ),
          Text(
            !cancelPayment
                ? 'We hope you have a wonderful vacation!'
                : 'Sorry for the inconveniences',
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            !cancelPayment
                ? 'payment in progress...'
                : 'canceling in process...',
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
