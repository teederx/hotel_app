import 'package:flutter/material.dart';

class Notes extends StatelessWidget {
  const Notes({
    super.key,
    required this.note,
    required this.number,
  });
  final String number;
  final String note;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          number,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color.fromRGBO(0, 0, 0, 0.8),
          ),
        ),
        SizedBox(
          width: size.width * 0.85,
          // color: Colors.black,
          child: SizedBox(
            child: Text(
              note,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color.fromRGBO(0, 0, 0, 0.8),
              ),
            ),
          ),
        ),
      ],
    );
  }
}