import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ButtonDay extends StatefulWidget {
  final String category;
  final Color color;

  const ButtonDay({super.key, required this.category, required this.color});

  @override
  State<ButtonDay> createState() => _ButtonDayState();
}

class _ButtonDayState extends State<ButtonDay> {
  bool isSelected = false;
  String? currentDateTime;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            isSelected = !isSelected;

            if (widget.category == 'Ngày Mai') {
              if (count.isEven) {
                currentDateTime =
                    DateFormat('dd/MM/yyyy').format(DateTime.now().add(const Duration(days: 1)));
              } else {
                currentDateTime = "Ngày Mai";
              }
            } else if (widget.category == 'Hôm Nay') {
              if (count.isEven) {
                currentDateTime =
                    DateFormat('dd/MM/yyyy').format(DateTime.now());
              } else {
                currentDateTime = "Hôm Nay";
              }
            }

            count++;
          });
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          backgroundColor: isSelected ? Colors.yellow : null,
        ),
        child: Text(
          currentDateTime ?? widget.category,
          style: TextStyle(color: widget.color),
        ),
      ),
    );
  }
}
bool isEven(int count) {
  return count % 2 == 0;
}