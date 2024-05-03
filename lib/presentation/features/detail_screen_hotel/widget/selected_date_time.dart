import 'package:custom_date_range_picker/custom_date_range_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SelectDateTimeHotel extends StatefulWidget {
  const SelectDateTimeHotel({super.key});

  @override
  State<SelectDateTimeHotel> createState() => _SelectDateTimeState();
}

class _SelectDateTimeState extends State<SelectDateTimeHotel> {
  DateTime? startDate;
  DateTime? endDate;
  String applyClickText = '1 Đêm';
  String selectedStartDateText = DateFormat('dd/MM').format(DateTime.now());
  String selectedEndDateText =
      DateFormat('dd/MM').format(DateTime.now().add(const Duration(days: 1)));
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 50,
      child: TextButton(
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
                selectedStartDateText = DateFormat('dd/MM').format(start);
                selectedEndDateText = DateFormat('dd/MM').format(end);
                // Tính số ngày giữa startDate và endDate
                final numberOfDays = end.difference(start).inDays;

                // Hiển thị số ngày trong text
                applyClickText =
                    numberOfDays == 1 ? '1 Đêm' : '$numberOfDays Đêm';
              });
            },
            onCancelClick: () {
              setState(() {
                isSelected = false;
                endDate = null;
                startDate = null;
                selectedStartDateText =
                    DateFormat('dd/MM').format(DateTime.now());
                selectedEndDateText = DateFormat('dd/MM')
                    .format(DateTime.now().add(const Duration(days: 1)));
                applyClickText = '1 Đêm';
              });
            },
          );
        },
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          backgroundColor: isSelected ? Colors.white : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(selectedStartDateText,
                style: const TextStyle(color: Colors.black)),
            const SizedBox(width: 5),
            const Icon(Icons.calendar_today_outlined, color: Colors.black),
            const SizedBox(width: 5),
            Text(
              selectedEndDateText,
              style: const TextStyle(color: Colors.black),
            ),
            const SizedBox(width: 20),
            Text(
              applyClickText,
              style: const TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
