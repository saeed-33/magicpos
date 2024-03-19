import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

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
        child: Container(
          margin: const EdgeInsets.all(30.6),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.6),
              border: Border.all(width: 3),
              color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 40),
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
                                "0000".substring(
                                        0, max(4 - "1".toString().length, 0)) +
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

                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                      height: 30,
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
                  ],
                ),

                //space
                const SizedBox(
                  height: 40,
                ),
                //min amount and max amount text fields
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 280,
                          height: 55,
                          decoration: BoxDecoration(
                              color: Colors.lightBlueAccent,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all()),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: PopupMenuButton(
                                iconSize: 25,
                                icon: Icon(Icons.keyboard_arrow_down_outlined),
                                padding: EdgeInsets.zero,
                                itemBuilder: (BuildContext context) {
                                  return [
                                    PopupMenuItem(
                                        child: SizedBox(
                                      width: 280,
                                      child: Center(
                                        child: Text(
                                          "وزنية",
                                          style: TextStyle(fontSize: 25),
                                        ),
                                      ),
                                    )),
                                    PopupMenuItem(
                                        child: SizedBox(
                                      width: 280,
                                      child: Center(
                                        child: Text(
                                          "وزنية",
                                          style: TextStyle(fontSize: 25),
                                        ),
                                      ),
                                    )),
                                    PopupMenuItem(
                                        child: SizedBox(
                                      width: 280,
                                      child: Center(
                                        child: Text(
                                          "وزنية",
                                          style: TextStyle(fontSize: 25),
                                        ),
                                      ),
                                    ))
                                  ];
                                }),
                          ),
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
                //space
                const SizedBox(
                  height: 30,
                ),
                ExpansionTile(
                  backgroundColor: Colors.lightBlueAccent,
                  collapsedBackgroundColor: Colors.lightBlueAccent,
                  controlAffinity: ListTileControlAffinity.leading,
                  collapsedShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: BorderSide()),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: BorderSide()),
                  title: Padding(
                    padding: const EdgeInsets.only(right: 40, left: 60),
                    child: Row(
                      children: [
                        Container(
                          width: 150,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
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
                    Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //english product name

                          ProductName(
                            title: " : سعر الكلفة",
                            width: 330,
                            controller: widget.productsController[1],
                            viewMode: false,
                            inputType: TextInputType.text,
                            onlyNumber: const [],
                          ),
                          //arabic product name

                          ProductName(
                            title: " : سعر الجملة",
                            width: 300,
                            controller: widget.productsController[0],
                            viewMode: false,
                            inputType: TextInputType.text,
                            onlyNumber: const [],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //english product name

                          ProductName(
                            title: " : سعر المستهلك",
                            width: 330,
                            controller: widget.productsController[1],
                            viewMode: false,
                            inputType: TextInputType.text,
                            onlyNumber: const [],
                          ),
                          //arabic product name

                          ProductName(
                            title: " : الباركود",
                            width: 300,
                            controller: widget.productsController[0],
                            viewMode: false,
                            inputType: TextInputType.text,
                            onlyNumber: const [],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //english product name

                          ProductName(
                            title: " : عدد القطع",
                            width: 330,
                            controller: widget.productsController[1],
                            viewMode: false,
                            inputType: TextInputType.text,
                            onlyNumber: const [],
                          ),
                          //arabic product name

                          ProductName(
                            title: " : سعر الجملة",
                            width: 300,
                            controller: widget.productsController[0],
                            viewMode: false,
                            inputType: TextInputType.text,
                            onlyNumber: const [],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                ExpansionTile(
                  backgroundColor: Colors.lightBlueAccent,
                  collapsedBackgroundColor: Colors.lightBlueAccent,
                  controlAffinity: ListTileControlAffinity.leading,
                  collapsedShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: BorderSide()),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: BorderSide()),
                  title: Padding(
                    padding: const EdgeInsets.only(right: 40, left: 60),
                    child: Row(
                      children: [
                        Container(
                          width: 150,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                        ),
                        Text(
                          " : الكمية الموجودة",
                          style: TextStyle(fontSize: 27),
                        ),
                        Spacer(),
                        Text(
                          "unit2",
                          style: TextStyle(fontSize: 40),
                        ),
                      ],
                    ),
                  ),
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //english product name

                          ProductName(
                            title: " : سعر الكلفة",
                            width: 330,
                            controller: widget.productsController[1],
                            viewMode: false,
                            inputType: TextInputType.text,
                            onlyNumber: const [],
                          ),
                          //arabic product name

                          ProductName(
                            title: " : سعر الجملة",
                            width: 300,
                            controller: widget.productsController[0],
                            viewMode: false,
                            inputType: TextInputType.text,
                            onlyNumber: const [],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //english product name

                          ProductName(
                            title: " : سعر المستهلك",
                            width: 330,
                            controller: widget.productsController[1],
                            viewMode: false,
                            inputType: TextInputType.text,
                            onlyNumber: const [],
                          ),
                          //arabic product name

                          ProductName(
                            title: " : الباركود",
                            width: 300,
                            controller: widget.productsController[0],
                            viewMode: false,
                            inputType: TextInputType.text,
                            onlyNumber: const [],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //english product name

                          ProductName(
                            title: " : عدد القطع",
                            width: 330,
                            controller: widget.productsController[1],
                            viewMode: false,
                            inputType: TextInputType.text,
                            onlyNumber: const [],
                          ),
                          //arabic product name

                          ProductName(
                            title: " : سعر الجملة",
                            width: 300,
                            controller: widget.productsController[0],
                            viewMode: false,
                            inputType: TextInputType.text,
                            onlyNumber: const [],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                ExpansionTile(
                  backgroundColor: Colors.lightBlueAccent,
                  collapsedBackgroundColor: Colors.lightBlueAccent,
                  controlAffinity: ListTileControlAffinity.leading,
                  collapsedShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: BorderSide()),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: BorderSide()),
                  title: Padding(
                    padding: const EdgeInsets.only(right: 40, left: 60),
                    child: Row(
                      children: [
                        Container(
                          width: 150,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                        ),
                        Text(
                          " : الكمية الموجودة",
                          style: TextStyle(fontSize: 27),
                        ),
                        Spacer(),
                        Text(
                          "unit3",
                          style: TextStyle(fontSize: 40),
                        ),
                      ],
                    ),
                  ),
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //english product name

                          ProductName(
                            title: " : سعر الكلفة",
                            width: 330,
                            controller: widget.productsController[1],
                            viewMode: false,
                            inputType: TextInputType.text,
                            onlyNumber: const [],
                          ),
                          //arabic product name

                          ProductName(
                            title: " : سعر الجملة",
                            width: 300,
                            controller: widget.productsController[0],
                            viewMode: false,
                            inputType: TextInputType.text,
                            onlyNumber: const [],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //english product name

                          ProductName(
                            title: " : سعر المستهلك",
                            width: 330,
                            controller: widget.productsController[1],
                            viewMode: false,
                            inputType: TextInputType.text,
                            onlyNumber: const [],
                          ),
                          //arabic product name

                          ProductName(
                            title: " : الباركود",
                            width: 300,
                            controller: widget.productsController[0],
                            viewMode: false,
                            inputType: TextInputType.text,
                            onlyNumber: const [],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //english product name

                          ProductName(
                            title: " : عدد القطع",
                            width: 330,
                            controller: widget.productsController[1],
                            viewMode: false,
                            inputType: TextInputType.text,
                            onlyNumber: const [],
                          ),
                          //arabic product name

                          ProductName(
                            title: " : سعر الجملة",
                            width: 300,
                            controller: widget.productsController[0],
                            viewMode: false,
                            inputType: TextInputType.text,
                            onlyNumber: const [],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),

                SizedBox(
                  height: 40,
                ),
                //operator and add image buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
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
        ),
      ),
    );
  }
}
