import 'package:flutter/material.dart';
import 'package:hotel_app/presentation/pages/options_page.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/HomePage';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController =
      AnimationController(vsync: this, duration: const Duration(seconds: 2));
  late final Animation<Offset> _verticalTitleAnimation =
      Tween<Offset>(begin: const Offset(0, 2), end: const Offset(0, 0))
          .animate(_animationController);
  late final Animation<Offset> _verticalAnimation =
      Tween<Offset>(begin: const Offset(0, 3), end: const Offset(0, 0))
          .animate(_animationController);
  late final Animation<Offset> _horizontalAnimation =
      Tween<Offset>(begin: const Offset(5, 0), end: const Offset(0, 0))
          .animate(_animationController);

  @override
  void initState() {
    super.initState();
    delayedStart();
  }

  void delayedStart() async {
    await Future.delayed(const Duration(seconds: 2), () {
      _animationController.forward();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Hero(
            tag: 'name1',
            child: Container(
              height: size.height,
              width: size.width,
              decoration: const BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                  image: AssetImage('assets/images/open.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: size.height * 0.15,
              left: size.width * 0.2,
              right: size.width * 0.2,
              bottom: size.height * 0.10,
            ),
            height: size.height,
            width: size.width,
            // color: Colors.grey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SlideTransition(
                  position: _verticalTitleAnimation,
                  child: const Column(
                    children: [
                      SizedBox(
                        height: 52,
                        // color: Colors.black,
                        child: Text(
                          'ATG',
                          style: TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '+ HOTELS',
                            style: TextStyle(
                              wordSpacing: 5,
                              fontFamily: 'Roboto',
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            'ROOMS',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SlideTransition(
                  position: _verticalAnimation,
                  child: Container(
                    margin: EdgeInsets.only(
                      top: size.height * 0.05,
                      bottom: size.height * 0.02,
                    ),
                    child: const Text(
                      'Book your rooms @ATG Hotels',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 40,
                      ),
                    ),
                  ),
                ),
                SlideTransition(
                  position: _horizontalAnimation,
                  child: Container(
                    margin: EdgeInsets.only(
                      bottom: size.height * 0.03,
                      left: 30,
                    ),
                    height: size.height * 0.25,
                    // color: Colors.black,
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'No cancellation Fee',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          'No extra charges',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          '24/7 customer support',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          'Safe Bookings and Payments',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SlideTransition(
                  position: _horizontalAnimation,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pushNamed(context, OptionsPage.routeName),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.only(left: 35, right: 10),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Book now',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Icon(
                            Icons.east_rounded,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: size.height * 0.05,
            child: SlideTransition(
              position: _verticalAnimation,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkResponse(
                    onTap: () {},
                    child: const Text(
                      'Terms & conditions',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontFamily: 'Roboto',
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.white,
                      ),
                    ),
                  ),
                  const Text(
                    ' and ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontFamily: 'Roboto',
                      decorationColor: Colors.white,
                    ),
                  ),
                  InkResponse(
                    onTap: () {},
                    child: const Text(
                      'privacy policy',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontFamily: 'Roboto',
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
