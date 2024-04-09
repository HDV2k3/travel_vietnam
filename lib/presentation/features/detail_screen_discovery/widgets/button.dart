import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ButtonDetail extends ConsumerWidget
{
  final Color color;
  final Color backgroundColor;
  double size;
  String? text='1';
  IconData? icon;
  bool? isIcon;
  final Color borderColor;
   ButtonDetail({super.key,this.isIcon=false,this.text,this.icon,required this.size,required this.color, required this.backgroundColor, required this.borderColor});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
   return Container(
     width: size,
     height: size,
     decoration: BoxDecoration(
       border: Border.all(
         color: borderColor,
             width: 1.0,
       ),
       borderRadius: BorderRadius.circular(15),
       color: backgroundColor
     ),
     child: isIcon==false?Center(child:Text(text!,style: TextStyle(color:color),)):Center(child:Icon(icon,color: color,),)
   );
  }

}