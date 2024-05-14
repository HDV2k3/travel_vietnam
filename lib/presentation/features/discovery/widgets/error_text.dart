import 'package:flutter/material.dart';

//ignore: must_be_immutable
class ErrorText extends StatelessWidget {
  String error;
  ErrorText({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: (Text(error)),
    );
  }
}
