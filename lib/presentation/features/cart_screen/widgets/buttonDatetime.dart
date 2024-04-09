import 'package:flutter/material.dart';

class ButtonDay extends StatefulWidget {
  final String category;
  final Color color;

  const ButtonDay(
      {super.key, required this.category, required this.color});

  @override
  State<ButtonDay> createState() => _ButtonDayState();
}

class _ButtonDayState extends State<ButtonDay> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      height: 50,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Text(
          widget.category,
          style: TextStyle(color: widget.color),
        ),
      ),
    );
  }
}
