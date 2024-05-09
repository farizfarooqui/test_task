import 'package:flutter/material.dart';

class CustomLinkButton extends StatelessWidget {
  final String text;
  final double textfontSize;
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;
  final double height;
  final double? width;
  final String imagePath;
  final VoidCallback? onPressed;

  const CustomLinkButton({
    super.key,
    required this.text,
    required this.height,
    required this.backgroundColor,
    required this.borderColor,
    required this.textColor,
    required this.onPressed,
    this.width,
    required this.textfontSize,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(backgroundColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(width: 2, color: borderColor),
          ),
        ),
        minimumSize: MaterialStateProperty.all(
            Size(width ?? double.infinity, height)), // Butto  height and width
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            imagePath,
            height: 30,
          ),
          const Spacer(),
          Text(
            text,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontSize: textfontSize, color: textColor),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
