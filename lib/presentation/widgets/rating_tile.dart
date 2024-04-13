import 'package:flutter/material.dart';

class RatingTile extends StatelessWidget {
  const RatingTile({
    super.key,
    required this.rating,
    required this.remark,
    required this.description,
    required this.size,
  });
  final String rating;
  final String remark;
  final String description;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 3,
              ),
              decoration: const BoxDecoration(
                color: Color.fromRGBO(63, 56, 56, 1),
                borderRadius: BorderRadiusDirectional.horizontal(
                  start: Radius.circular(20),
                  end: Radius.circular(20),
                ),
              ),
              child: Text(
                rating,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              remark,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: Color.fromRGBO(0, 0, 0, 1),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          description,
          style: const TextStyle(
            fontWeight: FontWeight.w200,
            fontSize: 14,
            color: Color.fromRGBO(0, 0, 0, 0.85),
          ),
        ),
      ],
    );
  }
}
