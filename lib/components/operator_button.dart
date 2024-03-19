import 'package:flutter/material.dart';

class OperatorButton extends StatelessWidget {
  const OperatorButton(
      {super.key,
      required this.onPressed,
      required this.text,
      required this.color,
      required this.enable});
  final String text;
  final Color color;
  final bool enable;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: color,
      disabledColor: Colors.grey[300],
      onPressed: enable ? onPressed : null,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      minWidth: 90,
      height: 60,
      child: Text(
        text,
        style: const TextStyle(fontSize: 25),
      ),
    );
  }
}
