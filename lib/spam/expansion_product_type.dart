/*import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ExpansionProductType extends StatefulWidget {
  ExpansionProductType({super.key, required this.productType});
  String productType;

  @override
  State<ExpansionProductType> createState() => _ExpansionProductTypeState();
}

class _ExpansionProductTypeState extends State<ExpansionProductType> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 325,
      left: 100,
      child: SizedBox(
        width: 270,
        child: ExpansionTile(
          backgroundColor: Colors.lightBlueAccent[100],
          collapsedShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: const BorderSide()),
          shape: RoundedRectangleBorder(
            side: const BorderSide(),
            borderRadius: BorderRadius.circular(15),
          ),
          collapsedBackgroundColor: Colors.lightBlueAccent,
          title: Center(
            child: Text(
              widget.productType,
              style: const TextStyle(fontSize: 25),
            ),
          ),
          children: [
            CustomButton(
              title: "مستودعية",
              onPressed: () {
                setState(() {
                  widget.productType = "مستودعية";
                });
              },
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Divider(
                  color: Colors.grey[700],
                  thickness: 0,
                  height: 0,
                )),
            CustomButton(
              title: "وزنية",
              onPressed: () {
                setState(() {
                  widget.productType = "وزنية";
                });
              },
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Divider(
                  color: Colors.grey[700],
                  thickness: 0,
                  height: 0,
                )),
            CustomButton(
              title: "خدمية",
              onPressed: () {
                setState(() {
                  widget.productType = "خدمية";
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.title, required this.onPressed});
  final String title;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      height: 46,
      minWidth: double.infinity,
      shape: RoundedRectangleBorder(
        borderRadius: title == "خدمية"
            ? const BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              )
            : BorderRadius.zero,
      ),
      child: Center(
          child: Text(
        title,
        style: const TextStyle(fontSize: 25),
      )),
    );
  }
}
*/
