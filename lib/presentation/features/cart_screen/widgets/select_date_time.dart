// import 'package:custom_date_range_picker/custom_date_range_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:intl/intl.dart';
//
// class SelectDateTime extends StatefulWidget {
//
//   const SelectDateTime({super.key});
//
//   @override
//   State<SelectDateTime> createState() => _SelectDateTimeState();
// }
//
// class _SelectDateTimeState extends State<SelectDateTime> {
//   DateTime? startDate;
//   DateTime? endDate;
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: 350,
//       height: 50,
//       child:   ElevatedButton(
//
//         onPressed: () {
//           showCustomDateRangePicker(
//             context,
//             dismissible: true,
//             minimumDate: DateTime.now().subtract(const Duration(days: 30)),
//             maximumDate: DateTime.now().add(const Duration(days: 30)),
//             endDate: endDate,
//             startDate: startDate,
//             backgroundColor: Colors.white,
//             primaryColor: Colors.blueAccent,
//             onApplyClick: (start, end) {
//               setState(() {
//                 endDate = end;
//                 startDate = start;
//               });
//             },
//             onCancelClick: () {
//               setState(() {
//                 endDate = null;
//                 startDate = null;
//               });
//             },
//           );
//         },
//         child: const Icon(Icons.calendar_today_outlined, color: Colors.black),
//
//       ),
//     );
//
//
//   }
// }
import 'package:custom_date_range_picker/custom_date_range_picker.dart';
import 'package:flutter/material.dart';

class SelectDateTime extends StatefulWidget {
  const SelectDateTime({super.key});

  @override
  State<SelectDateTime> createState() => _SelectDateTimeState();
}

class _SelectDateTimeState extends State<SelectDateTime> {
  DateTime? startDate;
  DateTime? endDate;

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
                endDate = end;
                startDate = start;
              });
            },
            onCancelClick: () {
              setState(() {
                endDate = null;
                startDate = null;
              });
            },
          );
        },
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Chọn Ngày', style: TextStyle(color: Colors.black)),
            SizedBox(width: 20),
            Icon(Icons.calendar_today_outlined, color: Colors.black),
          ],
        ),
      ),
    );
  }
}
