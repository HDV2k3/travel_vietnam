import 'package:flutter/material.dart';

class DotsIndicator extends StatelessWidget {
  final int itemCount;
  final int currentIndex;

  const DotsIndicator({
    super.key,
    required this.itemCount,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(itemCount, (index) {
        return Container(
          width: 8,
          height: 8,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: currentIndex == index ? Colors.red : Colors.grey,
          ),
        );
      }),
    );
  }
} //lesson 9 update Bottom , tabbar,appbar
