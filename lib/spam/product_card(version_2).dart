/*import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'package:magicpos/spam/custom_units_table.dart';

import '../components/expansion_product_type.dart';
import '../components/operator_button.dart';
import '../components/product_name.dart';
import '../components/text_with_text_box_and_button.dart';
import '../screens_data/home_screen_data.dart';

class ProductCard extends StatefulWidget {
  static const String route = "/product_card";
  final int productId;
  final List<TextEditingController> productsController;
  final List<String> productsStrings;
  final List<List<TextEditingController>> unitsController;
  final List<bool> disableUnits;
  final File productImage;
  final bool thereIsImage;
  final String productsType;
  const ProductCard(
      {super.key,
      required this.productsController,
      required this.unitsController,
      required this.disableUnits,
      required this.productImage,
      required this.thereIsImage,
      required this.productId,
      required this.productsStrings,
      required this.productsType});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  List<String> currentError = [];

  TextEditingController sectionGroupController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 40),
              width: double.infinity,
              height: 1247,
              margin: const EdgeInsets.all(30.6),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.6),
                  border: Border.all(width: 3),
                  color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  //product id
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 200,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.lightBlueAccent),
                        child: Center(
                          child: FutureBuilder(
                            future: null,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const CircularProgressIndicator();
                              } else {
                                int productNum = 1;
                                if (widget.productId == -1) {
                                  List<Map> product = snapshot.data;
                                  if (product.isNotEmpty) {
                                    productNum = snapshot.data[0]['id'] + 1;
                                  }
                                } else {
                                  productNum = widget.productId;
                                }
                                return Text(
                                  "0000".substring(0,
                                          max(4 - "1".toString().length, 0)) +
                                      productNum.toString(),
                                  style: const TextStyle(fontSize: 27),
                                );
                              }
                            },
                          ),
                        ),
                      ),
                      const Text(
                        " : رقم المادة",
                        style: TextStyle(fontSize: 35),
                      ),
                    ],
                  ),
                  //space
                  const SizedBox(
                    height: 30,
                  ),
                  //english/arabic product name

                  SizedBox(
                    height: 320,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //english product name

                            ProductName(
                              title: " : اسم المادة بالإنكليزي",
                              width: 330,
                              controller: widget.productsController[1],
                              viewMode: false,
                              inputType: TextInputType.text,
                              onlyNumber: const [],
                            ),
                            //arabic product name

                            ProductName(
                              title: " : اسم المادة بالعربي",
                              width: 330,
                              controller: widget.productsController[0],
                              viewMode: false,
                              inputType: TextInputType.text,
                              onlyNumber: const [],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //english product name
                            TextWithTextBoxAndButton(
                                title: " : المجموعة",
                                selected: widget.productsStrings[0],
                                indexOfCurrentBox: 0,
                                currentDepartment: widget.productsStrings[1]),

                            //arabic product name
                            const SizedBox(
                              width: 20,
                            ),
                            TextWithTextBoxAndButton(
                              title: " : القسم",
                              selected: widget.productsStrings[1],
                              indexOfCurrentBox: 1,
                              currentDepartment: widget.productsStrings[1],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //english product name

                            TextWithTextBoxAndButton(
                                title: " : اسم الوحدة الثانية",
                                selected: widget.productsStrings[3],
                                indexOfCurrentBox: 2,
                                currentDepartment: widget.productsStrings[1]),
                            //arabic product name
                            TextWithTextBoxAndButton(
                                title: " : اسم الوحدة الأولى",
                                selected: widget.productsStrings[2],
                                indexOfCurrentBox: 3,
                                currentDepartment: widget.productsStrings[1]),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextWithTextBoxAndButton(
                                title: " : اسم الوحدة الثالثة",
                                selected: widget.productsStrings[4],
                                indexOfCurrentBox: 4,
                                currentDepartment: widget.productsStrings[1]),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 50,
                  ),
                  //units prices table
                  UnitTable(
                    disableUnits: widget.disableUnits,
                    controller: widget.unitsController,
                    viewMode: false,
                    unitsNames: widget.productsStrings.sublist(2, 5),
                  ),
                  //space
                  const SizedBox(
                    height: 30,
                  ),
                  //min amount and max amount text fields
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 280,
                            height: 30,
                          ),
                          Text(
                            " : نوع المادة",
                            style: TextStyle(fontSize: 27),
                          ),
                        ],
                      ),

                      //max amount text field
                      ProductName(
                        title: " : أعلى كمية",
                        width: 170,
                        controller: widget.productsController[2],
                        viewMode: false,
                        inputType: const TextInputType.numberWithOptions(
                            signed: false, decimal: false),
                        onlyNumber: [FilteringTextInputFormatter.digitsOnly],
                      ),
                      //min amount text field
                      ProductName(
                        title: " : أقل كمية",
                        width: 160,
                        controller: widget.productsController[3],
                        viewMode: false,
                        inputType: const TextInputType.numberWithOptions(
                            signed: false, decimal: true),
                        onlyNumber: [FilteringTextInputFormatter.digitsOnly],
                      ),
                    ],
                  ),
                  Spacer(),
                  //space
                  const SizedBox(
                    height: 30,
                  ),
                  //operator and add image buttons
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //operator buttons
                      //add product to products table
                      OperatorButton(
                        onPressed: () {},
                        text: "إضافة المادة",
                        color: Colors.lightBlueAccent,
                        enable: true,
                      ),
                      //update product in the products table
                      OperatorButton(
                        onPressed: () {},
                        text: "تعديل المادة",
                        color: Colors.lightBlueAccent,
                        enable: false,
                      ),
                      //delete product from the products table
                      OperatorButton(
                        onPressed: () {},
                        text: "حذف المادة",
                        color: Colors.redAccent,
                        enable: false,
                      ),
                      //ignore all information and exit nothing will be saved
                      OperatorButton(
                        onPressed: () {
                          Navigator.of(context).pop(
                            data[5]["route"],
                          );
                        },
                        text: "إلغاء العملية",
                        color: Colors.greenAccent,
                        enable: true,
                      ),
                      //to make space between operator buttons and add image button bigger
                      const SizedBox(
                        width: 330,
                      ),
                      //add image button
                      //pick an image for the product from gallery
                      MaterialButton(
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: const BorderSide()),
                        minWidth: 152,
                        height: 152,
                        child: const Text(
                          "إضافة صورة",
                          style: TextStyle(fontSize: 40),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            ExpansionProductType(
              productType: widget.productsType,
            ),
          ],
        ),
      ),
    );
  }
}
*/
