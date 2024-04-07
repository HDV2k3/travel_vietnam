import 'package:flutter/material.dart';

class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width;
   ResponsiveButton({super.key,this.width=120,this.isResponsive=false});

  @override
  Widget build(BuildContext context) {
    return Flexible(child: Container(
      width: isResponsive==true?double.maxFinite:width,
      height: 60,
      decoration: BoxDecoration(

          borderRadius: BorderRadius.circular(10),
          color: Colors.lightBlue
      ),
      child: Row(
        mainAxisAlignment:isResponsive==true?MainAxisAlignment.spaceBetween:MainAxisAlignment.center,
        children: [
          isResponsive==true?Container(margin: const EdgeInsets.only(left: 20),  child: Text('Đặt Ngay',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)):Container(),

          Image.asset('assets/images/booknowbutton.png')
        ],
      ),
    ),);
  }
}
