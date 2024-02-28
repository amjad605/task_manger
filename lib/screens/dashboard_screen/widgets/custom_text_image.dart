import 'package:flutter/material.dart';

import '../../../constants.dart';

class CustomContainerWithTextImage extends StatelessWidget {
  const CustomContainerWithTextImage({
    super.key,
    required this.image,
    required this.text,
    required this.count,
  });
  final String image, text, count;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: tintBlack.withOpacity(0.3),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                image,
                width: 30,
              ),
              const SizedBox(width: 15),
              Text(
                text,
              ),
            ],
          ),
          Text(
            count,
          ),
        ],
      ),
    );
  }
}
