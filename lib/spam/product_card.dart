/*import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:magicpos/components/custom_units_table.dart';

import '../components/add_dialog.dart';
import '../components/expansion_products.dart';
import '../components/operator_button.dart';
import '../components/product_name.dart';
import '../screens_data/functions_products.dart';
import '../screens_data/home_screen_data.dart';

class ProductCard extends StatefulWidget {
  static const String route = "/product_card";
  final int productId;
  final List<TextEditingController> productsController;
  final List<List<TextEditingController>> unitsController;
  final List<bool> disableUnits;
  final int currentMethod;
  final File productImage;
  final bool thereIsImage;
  const ProductCard(
      {super.key,
      required this.productsController,
      required this.unitsController,
      required this.disableUnits,
      required this.currentMethod,
      required this.productImage,
      required this.thereIsImage,
      required this.productId});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  List<String> currentError = [];
  bool addDepartment = false;
  bool addingGroup = false;

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
                            future: initializeProductNumber(),
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
                                  "0000".substring(
                                          0,
                                          max(4 - productNum.toString().length,
                                              0)) +
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
                  //space

                  const SizedBox(
                    height: 25,
                  ),
                  //texts for the expansion lists and add group/department button
                  Row(
                    children: [
                      SizedBox(
                        width: 271.4,
                      ),
                      SizedBox(
                        height: 260,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ExpansionProductsName(
                              title: ' : المجموعة',
                              onTap: () {},
                            ),
                            ExpansionProductsName(
                              title: ' : اسم الوحدة الأولى',
                              onTap: () {},
                            ),
                            ExpansionProductsName(
                              title: ' : اسم الوحدة الثالثة',
                              onTap: () {},
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 371.4,
                      ),
                      SizedBox(
                        height: 260,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ExpansionProductsName(
                              title: ' : القسم',
                              onTap: () {},
                            ),
                            ExpansionProductsName(
                              title: ' : نوع المادة',
                              onTap: () {},
                            ),
                            ExpansionProductsName(
                              title: ' : اسم الوحدة الثانية',
                              onTap: () {},
                            ),
                          ],
                        ),
                      )
                    ],
                  ),

                  //space

                  const SizedBox(
                    height: 130,
                  ),
                  //units prices table
                  UnitTable(
                    disableUnits: widget.disableUnits,
                    controller: widget.unitsController,
                    viewMode: false,
                    unitsNames: List.filled(3, ""),
                  ),
                  //space
                  const SizedBox(
                    height: 30,
                  ),
                  //min amount and max amount text fields
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //max amount text field
                      ProductName(
                        title: " : أعلى كمية",
                        width: 200,
                        controller: widget.productsController[8],
                        viewMode: false,
                        inputType: const TextInputType.numberWithOptions(
                            signed: false, decimal: false),
                        onlyNumber: [FilteringTextInputFormatter.digitsOnly],
                      ),
                      //min amount text field
                      ProductName(
                        title: " : أقل كمية",
                        width: 200,
                        controller: widget.productsController[9],
                        viewMode: false,
                        inputType: const TextInputType.numberWithOptions(
                            signed: false, decimal: true),
                        onlyNumber: [FilteringTextInputFormatter.digitsOnly],
                      ),
                    ],
                  ),
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
                        onPressed: () async {
                          await insertProduct(
                                  currentError: currentError,
                                  productsController: widget.productsController,
                                  disableUnits: widget.disableUnits)
                              .then((value) => setState(() {}));
                        },
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
            //expansion list that contain departments
            Positioned(
              top: 230,
              right: 361,
              child: ExpansionProducts(
                controller: widget.productsController[2],
                isGroup: false,
                productsController: [
                  widget.productsController[2],
                  widget.productsController[3]
                ],
              ),
            ),

//expansion list that contain the groups which refer to the selected department
            Positioned(
              top: 230,
              left: 102,
              child: ExpansionProducts(
                controller: widget.productsController[3],
                isGroup: true,
                productsController: [
                  widget.productsController[2],
                  widget.productsController[3]
                ],
              ),
            ),
            Positioned(
              top: 330,
              right: 361,
              child: ExpansionProducts(
                controller: widget.productsController[4],
                isGroup: false,
                productsController: [
                  widget.productsController[2],
                  widget.productsController[3]
                ],
              ),
            ),

            Positioned(
              top: 330,
              left: 102,
              child: ExpansionProducts(
                controller: widget.productsController[5],
                isGroup: true,
                productsController: [
                  widget.productsController[2],
                  widget.productsController[3]
                ],
              ),
            ),
            Positioned(
              top: 430,
              right: 361,
              child: ExpansionProducts(
                controller: widget.productsController[6],
                isGroup: false,
                productsController: [
                  widget.productsController[2],
                  widget.productsController[3]
                ],
              ),
            ),
            Positioned(
              top: 430,
              left: 102,
              child: ExpansionProducts(
                controller: widget.productsController[7],
                isGroup: true,
                productsController: [
                  widget.productsController[2],
                  widget.productsController[3]
                ],
              ),
            ),

            //pop up dialog appear when press add group or department button to add a new group or department
            addingGroup || addDepartment
                ? AddDialog(
                    controller: sectionGroupController,
                    onPressedCancel: () {
                      addDepartment = false;
                      addingGroup = false;
                      setState(() {});
                    },
                    onPressedOk: addingGroup
                        ? addGroup(
                            productsController: widget.productsController[0],
                            sectionGroupController: sectionGroupController,
                            currentError: '')
                        : addSection(
                            currentError: '',
                            sectionGroupController: sectionGroupController),
                    title: addDepartment ? "إضافة قسم" : "إضافة مجموعة",
                  )
                : const SizedBox(
                    width: 0,
                    height: 0,
                  ),
          ],
        ),
      ),
    );
  }
}*/
