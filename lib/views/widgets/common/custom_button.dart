import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isFullWidth;
  final double height;
  final Color? backgroundColors;
  final Color? textColor;
  final bool isOutLined;
  final IconData? icon;
  final bool isLoading;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isFullWidth = true,
    this.height = 55,
    this.backgroundColors,
    this.textColor,
    this.isOutLined = false,
    this.icon,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: isFullWidth ? double.infinity : null,
      height: height,
      child:
          isOutLined
              ? OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    color: backgroundColors ?? theme.primaryColor,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: isLoading ? null : onPressed,
                child: _buildButtonContent(theme),
              )
              : ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: backgroundColors ?? theme.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: isLoading ? null : onPressed,
                child: _buildButtonContent(theme),
              ),
    );
  }

  Widget _buildButtonContent(ThemeData theme) {
    if (isLoading) {
      return SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(
            isOutLined ? theme.primaryColor : Colors.white,
          ),
        ),
      );
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (icon != null) ...[
          Icon(
            icon,
            color:
                isOutLined
                    ? (backgroundColors ?? theme.primaryColor)
                    : (textColor ?? Colors.white),
          ),
          const SizedBox(width: 8),
        ],
        Text(
          text,
          style: TextStyle(
            fontSize: 18,
            color:
                isOutLined
                    ? (backgroundColors ?? theme.primaryColor)
                    : (textColor ?? Colors.white),
          ),
        ),
      ],
    );
  }
}
