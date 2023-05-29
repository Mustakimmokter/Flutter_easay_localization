import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.title, required this.onPressed, this.color, this.titleColor, this.height, this.width}) : super(key: key);

  final String title;
  final Function() onPressed;
  final Color? color,titleColor;
  final double? height,width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
          alignment: Alignment.center,
          height: height,
          width: width,
          color: color ?? Colors.green,
          child: Text(
            title,
            style: TextStyle(color: titleColor ?? Colors.black54),
          ),
        ),
      );
  }
}
