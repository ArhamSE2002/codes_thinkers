import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../theme/theme.dart';

class BodyText extends StatelessWidget {
  const BodyText(this.text, {super.key});
  final String text;
  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      overflow: TextOverflow.ellipsis,
      maxLines: 20,
      text,
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }
}

class HeadlineText extends StatelessWidget {
  const HeadlineText(this.text, {super.key});
  final String text;
  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
      text,
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}

class TitleText extends StatelessWidget {
  const TitleText(this.text, {super.key});
  final String text;
  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
      text.toUpperCase(),
      style: Theme.of(context).textTheme.titleMedium,
    );
  }
}

class BigText extends StatelessWidget {
  const BigText(this.text, {super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
      text.toUpperCase(),
      style: const TextStyle(
        color: Colors.white,
        fontSize: 25,
        fontWeight: FontWeight.bold,
        letterSpacing: 1,
      ),
    );
  }
}

class TitleTextO extends StatelessWidget {
  const TitleTextO(this.text, {super.key});
  final String text;
  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
      text.toUpperCase(),
      style: const TextStyle(
        color: AppColors.secondaryColor,
        fontSize: 18,
        letterSpacing: 1,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
