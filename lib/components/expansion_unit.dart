import 'package:flutter/material.dart';
import 'package:magicpos/components/product_name.dart';

class ExpansionUnit extends StatelessWidget {
  const ExpansionUnit({super.key});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      backgroundColor: Colors.lightBlueAccent,
      collapsedBackgroundColor: Colors.lightBlueAccent,
      controlAffinity: ListTileControlAffinity.leading,
      collapsedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(),
      ),
      title: Padding(
        padding: const EdgeInsets.only(right: 40, left: 60),
        child: Row(
          children: [
            Container(
              width: 150,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
            ),
            Text(
              " : الكمية الموجودة",
              style: TextStyle(fontSize: 27),
            ),
            Spacer(),
            Text(
              "unit1",
              style: TextStyle(fontSize: 40),
            ),
          ],
        ),
      ),
      children: [
        SizedBox(
          height: 30,
        ),
        CustomWidgetForUnit(
          titleR: " : سعر الكلفة",
          titleL: " : اسم الوحدة",
          controllerR: TextEditingController(),
          controllerL: TextEditingController(),
        ),
        SizedBox(
          height: 30,
        ),
        CustomWidgetForUnit(
          titleR: " : سعر الجملة",
          titleL: " : سعر المستهلك",
          controllerR: TextEditingController(),
          controllerL: TextEditingController(),
        ),
        SizedBox(
          height: 30,
        ),
        CustomWidgetForUnit(
          titleR: ' : الباركود',
          titleL: ' : عدد القطع',
          controllerR: TextEditingController(),
          controllerL: TextEditingController(),
        ),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }
}

class CustomWidgetForUnit extends StatelessWidget {
  const CustomWidgetForUnit(
      {super.key,
      required this.titleR,
      required this.titleL,
      required this.controllerR,
      required this.controllerL});
  final String titleR;
  final String titleL;
  final TextEditingController controllerR;
  final TextEditingController controllerL;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //english product name

          ProductName(
            title: titleL,
            width: 330,
            controller: controllerL,
            viewMode: false,
            inputType: TextInputType.text,
            onlyNumber: const [],
          ),
          //arabic product name

          ProductName(
            title: titleR,
            width: 300,
            controller: controllerR,
            viewMode: false,
            inputType: TextInputType.text,
            onlyNumber: const [],
          ),
        ],
      ),
    );
  }
}
