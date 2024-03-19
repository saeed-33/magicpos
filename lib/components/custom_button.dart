import "package:flutter/material.dart";

class CustomButton extends StatelessWidget {
  final double ratio = 0.12;
  final VoidCallback onPressed;
  final IconData icon;
  final String engText;
  final String arText;
  const CustomButton(
      {super.key,
      required this.onPressed,
      required this.icon,
      required this.engText,
      required this.arText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (ratio + 0.045) * MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.lightBlueAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.6),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.6),
          child: Column(
            children: [
              Icon(
                icon,
                color: Colors.black,
                size: 70,
              ),
              Text(
                '$engText\n$arText',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 26,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
