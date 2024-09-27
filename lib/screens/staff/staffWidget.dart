import 'dart:developer';


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../shared/shared_text.dart';
import '../../theme/theme.dart';

class StaffWidget extends StatelessWidget {
  const StaffWidget({
    required this.imgUrl,
    required this.name,
    required this.skill,
    required this.shortDec,
    required this.admin,
    required this.gmail,
    required this.linkedin,
    required this.whatsappNum,
    required this.facebook,
    required this.delete,
    super.key,
  });

  final bool admin;
  final String imgUrl;
  final String name;
  final String skill;
  final String shortDec;
  final String gmail;
  final String linkedin;
  final String whatsappNum;
  final String facebook;
  final Function() delete;

  Future<void> launchSocial(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      bool launched = await launchUrl(uri);
      if (!launched) {
        log("Could not launch $url");
      }
    } else {
      log("Invalid URL or no app can handle $url");
    }
  }

  Future<void> launchEmail(String gmail) async {
    final String email = Uri.encodeComponent(gmail);
    final Uri mail = Uri.parse("mailto:$email");

    try {
      final bool launched = await launchUrl(mail);
      if (launched) {
        // email app opened
      } else {
        // email app is not opened
        throw Exception('Could not launch email app');
      }
    } on PlatformException catch (e) {
      throw Exception('Error launching email: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.secondaryColor, width: 2),
        borderRadius: BorderRadius.circular(10),
        color: AppColors.secondaryColor.withOpacity(0.2),
      ),
      child: Column(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              image: DecorationImage(
                  image: NetworkImage(imgUrl),
                  alignment: Alignment.topCenter,
                  fit: BoxFit.cover),
            ),
          ),
          TitleText(name),
          BodyText(skill),
          const SizedBox(
            height: 20,
          ),
          BodyText(shortDec),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(),
              GestureDetector(
                onTap: () async {
                  await launchEmail(gmail);
                },
                child: Image.asset(
                  'assets/icons/social/gmail.png',
                  width: 30,
                  height: 30,
                ),
              ),
              GestureDetector(
                onTap: () async {
                  await launchSocial(linkedin);
                },
                child: Image.asset(
                  'assets/icons/social/linkedin.png',
                  width: 30,
                  height: 30,
                ),
              ),
              GestureDetector(
                onTap: () async {
                  await launchSocial("https://wa.me/$whatsappNum");
                },
                child: Image.asset(
                  'assets/icons/social/whatsapp.png',
                  width: 30,
                  height: 30,
                ),
              ),
              GestureDetector(
                onTap: () async {
                  await launchSocial(facebook);
                },
                child: Image.asset(
                  'assets/icons/social/facebook.png',
                  width: 30,
                  height: 30,
                ),
              ),
              admin
                  ? GestureDetector(
                      onTap: delete,
                      child: const Icon(
                        Icons.delete,
                        size: 30,
                        color: AppColors.redColor,
                      ),
                    )
                  : const SizedBox()
            ],
          )
        ],
      ),
    );
  }
}
