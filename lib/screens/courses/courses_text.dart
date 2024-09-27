import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../theme/theme.dart';

class TitleCText extends StatelessWidget {
  const TitleCText(this.text, {super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: AppColors.primaryColor,
      ),
    );
  }
}

class BodyCText extends StatelessWidget {
  const BodyCText(this.text, {super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      style: const TextStyle(
        fontSize: 14,
        color: AppColors.primaryColor,
      ),
    );
  }
}

class MonthCText extends StatelessWidget {
  const MonthCText(this.text, {super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      style: const TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: AppColors.textColor,
      ),
    );
  }
}
