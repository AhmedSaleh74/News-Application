import 'package:flutter/material.dart';

class NewsIndicatorLoading extends StatelessWidget {
  const NewsIndicatorLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
        hasScrollBody: false,
        child: Center(
            child: CircularProgressIndicator()));
  }
}
