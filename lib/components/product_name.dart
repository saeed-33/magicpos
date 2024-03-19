import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProductName extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final double width;
  final bool viewMode;
  final TextInputType inputType;
  final List<TextInputFormatter> onlyNumber;
  const ProductName({
    super.key,
    required this.width,
    required this.title,
    required this.controller,
    required this.viewMode,
    required this.inputType,
    required this.onlyNumber,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (565 / 330) * width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            width: width,
            height: 50,
            child: TextField(
              inputFormatters: onlyNumber,
              readOnly: viewMode,
              keyboardType: inputType,
              controller: controller,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.black),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.lightBlue),
                ),
              ),
            ),
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 27),
          ),
          Spacer()
        ],
      ),
    );
  }
}
