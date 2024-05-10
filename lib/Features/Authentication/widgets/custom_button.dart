import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final double textfontSize;
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;
  final double height;
  final double? width;
  final VoidCallback? onPressed;
  final bool isLoading;

  const CustomButton({
    super.key,
    required this.text,
    required this.height,
    required this.backgroundColor,
    required this.borderColor,
    required this.textColor,
    required this.onPressed,
    this.width,
    required this.textfontSize,
    this.isLoading = false,
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
      child: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontSize: textfontSize, color: textColor),
            ),
    );
  }
}
