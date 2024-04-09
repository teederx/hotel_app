import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ShareWith extends StatelessWidget {
  const ShareWith({
    super.key,
    required this.size,
  });
  final Size size;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.15,
      width: size.width,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
            'Share with',
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                tooltip: 'Email',
                onPressed: () {},
                style: IconButton.styleFrom(
                  foregroundColor: Colors.black,
                ),
                icon: SvgPicture.asset('assets/svgs/email.svg'),
              ),
              IconButton(
                tooltip: 'Telegram',
                onPressed: () {},
                style: IconButton.styleFrom(
                  foregroundColor: Colors.black,
                ),
                icon: SvgPicture.asset('assets/svgs/send.svg'),
              ),
              IconButton(
                tooltip: 'WhatsApp',
                onPressed: () {},
                style: IconButton.styleFrom(
                  foregroundColor: Colors.black,
                ),
                icon: SvgPicture.asset('assets/svgs/message.svg'),
              ),
              IconButton(
                tooltip: 'Notification',
                onPressed: () {},
                style: IconButton.styleFrom(
                  foregroundColor: Colors.black,
                ),
                icon: SvgPicture.asset('assets/svgs/notification.svg'),
              ),
              IconButton(
                tooltip: 'Message',
                onPressed: () {},
                style: IconButton.styleFrom(
                  foregroundColor: Colors.black,
                ),
                icon: SvgPicture.asset('assets/svgs/chat.svg'),
              ),
              IconButton(
                tooltip: 'Print',
                onPressed: () {},
                style: IconButton.styleFrom(
                  foregroundColor: Colors.black,
                ),
                icon: SvgPicture.asset('assets/svgs/print.svg'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
