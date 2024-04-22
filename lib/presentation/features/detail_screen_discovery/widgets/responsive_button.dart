import 'package:flutter/material.dart';

class ResponsiveButton extends StatelessWidget {
  final bool? isResponsive;
  final double? width;
  const ResponsiveButton({super.key, this.width, this.isResponsive = false});

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Container(
      width: isResponsive == true ? 290 : width,
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.lightBlue),
      child: Row(
        mainAxisAlignment: isResponsive == true
            ? MainAxisAlignment.spaceBetween
            : MainAxisAlignment.center,
        children: [
          isResponsive == true
              ? Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: const Text(
                    'Đặt Ngay',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ))
              : Container(),
          Image.asset('assets/images/booknowbutton.png')
        ],
      ),
    ));
  }
}
