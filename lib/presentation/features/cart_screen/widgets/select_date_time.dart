
import 'package:custom_date_range_picker/custom_date_range_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SelectDateTime extends StatefulWidget {
  const SelectDateTime({super.key});

  @override
  State<SelectDateTime> createState() => _SelectDateTimeState();
}

class _SelectDateTimeState extends State<SelectDateTime> {
  DateTime? startDate;
  DateTime? endDate;
  String selectedStartDateText = 'Chọn Ngày Bắt Đầu';
  String selectedEndDateText = 'Chọn Ngày Kết Thúc';
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          showCustomDateRangePicker(
            context,
            dismissible: true,
            minimumDate: DateTime.now().subtract(const Duration(days: 30)),
            maximumDate: DateTime.now().add(const Duration(days: 30)),
            endDate: endDate,
            startDate: startDate,
            backgroundColor: Colors.white,
            primaryColor: Colors.blueAccent,
            onApplyClick: (start, end) {
              setState(() {
                isSelected = !isSelected;
                endDate = end;
                startDate = start;
                selectedStartDateText = DateFormat('dd/MM/yyyy').format(start!);
                selectedEndDateText = DateFormat('dd/MM/yyyy').format(end!);
              });
            },
            onCancelClick: () {
              setState(() {
                isSelected = false;
                endDate = null;
                startDate = null;
                selectedStartDateText = 'Chọn Ngày Bắt Đầu';
                selectedEndDateText = 'Chọn Ngày Kết Thúc';
                ///gitworkflow
              });
            },
          );
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          backgroundColor: isSelected ? Colors.yellow : null,
        ),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(selectedStartDateText, style: const TextStyle(color: Colors.black)),
                const SizedBox(width: 10),
                const Icon(Icons.calendar_today_outlined, color: Colors.black),
                const SizedBox(width: 10),
                Text(selectedEndDateText, style: const TextStyle(color: Colors.black)),
              ],
            )
          ],

        ),

      ),

    );
  }
}
