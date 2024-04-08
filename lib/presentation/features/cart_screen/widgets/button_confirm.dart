import 'package:flutter/material.dart';

class ButtonConfirm extends StatefulWidget {
  final String category;
  final Color color;

  const ButtonConfirm({
    super.key,
    required this.category, required this.color
  });

  @override
  State<ButtonConfirm> createState() => _ButtonConfirmState();
}

class _ButtonConfirmState extends State<ButtonConfirm> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      height: 50,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child:  Text(widget.category,style: TextStyle(color: widget.color),),
      ),
    );
  }
}
