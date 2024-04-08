import 'package:flutter/material.dart';

class ButtonDateTime extends StatefulWidget {
  final String category;
  final Color color;
  final Color background;

  const ButtonDateTime({
    super.key,
    required this.category, required this.color, required this.background,
  });

  @override
  State<ButtonDateTime> createState() => _ButtonDateTimeState();
}

class _ButtonDateTimeState extends State<ButtonDateTime> {
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
        child:  Text(widget.category,style: TextStyle(color: widget.color,backgroundColor: widget.background),),
      ),
    );
  }
}
