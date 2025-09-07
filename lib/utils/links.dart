import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/link.dart';

// ignore: must_be_immutable
class SocialLinks extends StatelessWidget {
  SocialLinks({super.key});

  List<String> links = [
    'https://github.com/MdSohidUllahChowdhury',
    'https://www.linkedin.com/in/md-sohid-ullah-chowdhury',
    'https://www.instagram.com/shakil_chowdhury19',
    'https://www.facebook.com/shakilchowdhury19',
  ];

  linkButtonIcon(String giveUrl, Icon giveIcon) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      child: Link(
          uri: Uri.parse(giveUrl),
          builder: (context, followLink) => IconButton(
                onPressed: followLink,
                icon: giveIcon,
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        linkButtonIcon(
            links[0],
            const Icon(
              FontAwesomeIcons.github,
              color: Colors.black,
              size: 14,
            )),
        const SizedBox(width: 10),
        linkButtonIcon(
            links[1],
            const Icon(
              FontAwesomeIcons.linkedin,
              color: Colors.black,
              size: 14,
            )),
        const SizedBox(width: 10),
        linkButtonIcon(
            links[2],
            const Icon(
              FontAwesomeIcons.instagram,
              color: Colors.black,
              size: 14,
            )),
        const SizedBox(width: 10),
        linkButtonIcon(
            links[3],
            const Icon(
              FontAwesomeIcons.facebook,
              color: Colors.black,
              size: 14,
            )),
      ],
    );
  }
}