import 'package:flutter/material.dart';
import 'package:hotel_app/presentation/pages/payment_page.dart';
import 'package:share_plus/share_plus.dart';

import '../../data/model/room.dart';
import '../widgets/rating_tile.dart';

class ReviewsPage extends StatelessWidget {
  static const routeName = '/reviewsPage';
  const ReviewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final room = ModalRoute.of(context)!.settings.arguments as Room;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 236, 236, 236),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          SizedBox(
            height: size.height,
            width: size.width,
          ),
          header(size, room, context),
          customerRatings(size),
        ],
      ),
    );
  }

  Widget customerRatings(Size size) {
    return Positioned(
      bottom: 0,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: size.height * 0.01,
          horizontal: 20,
        ),
        height: size.height * 0.56,
        width: size.width,
        // color: Colors.grey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: size.width * 0.4,
                height: size.height * 0.05,
                // color: Colors.black,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      Icons.chat_outlined,
                      color: Color.fromRGBO(27, 27, 27, 1),
                    ),
                    Text(
                      'Customer Ratings',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(0, 0, 0, 0.9),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                width: double.infinity,
                height: size.height * 0.47,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RatingTile(
                      rating: '4.5/5',
                      remark: 'Very Good !',
                      description:
                          'Overall service is fine and nothing to complaint about their service, keep it up!...',
                      size: size,
                    ),
                    const Divider(
                      color: Color.fromRGBO(103, 99, 99, 0.5),
                    ),
                    RatingTile(
                      rating: '3.7/5',
                      remark: 'Best !',
                      description:
                          'One of the best hotel rooms booking applications',
                      size: size,
                    ),
                    const Divider(
                      color: Color.fromRGBO(103, 99, 99, 0.5),
                    ),
                    RatingTile(
                      rating: '4.2/5',
                      remark: 'Awesome !',
                      description:
                          'Must try this application to book rooms of their hotel, totally satisfied !!!!',
                      size: size,
                    ),
                    const Divider(
                      color: Color.fromRGBO(103, 99, 99, 0.5),
                    ),
                    RatingTile(
                      rating: '4.2/5',
                      remark: 'Excellent !',
                      description:
                          'Yes , this is excellent for booking rooms....',
                      size: size,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget header(Size size, Room room, BuildContext context) {
    return Card(
      elevation: 10,
      margin: const EdgeInsets.all(0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
      child: Container(
        height: size.height * 0.4,
        width: size.width,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
          image: DecorationImage(
            image: AssetImage(room.imageURL),
            fit: BoxFit.cover,
            colorFilter: const ColorFilter.mode(
              Color.fromRGBO(0, 0, 0, 0.3),
              BlendMode.overlay,
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.05,
                vertical: size.height * 0.05,
              ),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(0, 92, 92, 92),
                    Colors.black26,
                    Colors.black38,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    style: IconButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    icon: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Color.fromRGBO(50, 50, 50, 1),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      //TODO: Implement link...
                      Share.share(
                        'I just booked a ${room.name} on the Hotel app, you also should try it too! (^_^)',
                        subject: 'Hotel Booking',
                      );
                      // showModalBottomSheet(
                      //   context: context,
                      //   builder: (context) => ShareWith(
                      //     size: size,
                      //   ),
                      // );
                    },
                    icon: const Icon(
                      Icons.share_rounded,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.05,
              ),
              height: size.height * 0.1,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(0, 92, 92, 92),
                    Colors.black26,
                    Colors.black38,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    room.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 24,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, PaymentPage.routeName),
                    style: ElevatedButton.styleFrom(
                      elevation: 2,
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                      ),
                    ),
                    child: const Text(
                      'Book',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
