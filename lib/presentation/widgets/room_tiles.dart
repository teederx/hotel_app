import 'package:flutter/material.dart';
import 'package:hotel_app/data/model/room.dart';
import 'package:hotel_app/presentation/pages/reviews_page.dart';

class RoomTiles extends StatelessWidget {
  const RoomTiles({
    super.key,
    required this.size,
    required this.name,
    required this.imageURL,
  });

  final Size size;
  final String name;
  final String imageURL;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          ReviewsPage.routeName,
          arguments: Room(
            name: name,
            imageURL: imageURL,
          ),
        );
      },
      child: Card(
        elevation: 20,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          alignment: Alignment.center,
          height: size.height * 0.09,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey,
            image: DecorationImage(
              colorFilter: const ColorFilter.mode(
                Color.fromRGBO(0, 0, 0, 0.2),
                BlendMode.darken,
              ),
              fit: BoxFit.cover,
              image: AssetImage(imageURL),
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
