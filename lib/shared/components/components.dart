import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stopwatch_app/shared/style/color.dart';


Widget defaultText({
  required String text,
}) => Text(
  text,
  style: TextStyle(
    color: color4.withOpacity(0.7),
    fontSize: 18.sp,
  ),
);


Widget defaultTime({
  required String text,
}) => Container(
  padding: const EdgeInsetsDirectional.all(8),
  decoration: BoxDecoration(
    border: Border.all(
      color: color4,
    ),
    borderRadius: BorderRadius.circular(10.r),
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        color1,
        color3,
        color2,
      ],
    ),
  ),
  child: Text(
    text,
    style: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 48.sp,
    ),
  ),
);


Widget defaultButton({
  required String text,
  required Function onPressed,
}) =>ElevatedButton(
  onPressed: (){
    onPressed();
  },
  style: ElevatedButton.styleFrom(
    side: BorderSide(
      color: color4,

    ),
  ),
  child: Text(
    text,
    style: TextStyle(
      color: color4.withOpacity(0.7),
      fontSize: 17.sp,
    ),
  ),
);

