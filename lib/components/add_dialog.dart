import 'package:flutter/material.dart';

import '../screens_data/constants.dart';
import '../screens_data/product_functions.dart';

class AddDialog extends StatelessWidget {
  final VoidCallback onPressedOk;
  final VoidCallback onPressedCancel;
  final int currentIndex;
  final String department;
  const AddDialog(
      {super.key,
      required this.onPressedOk,
      required this.onPressedCancel,
      required this.currentIndex,
      required this.department});
  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController();
    ProductsFunctions pf = ProductsFunctions();
    return Container(
      width: double.infinity,
      height: 1130,
      color: Colors.transparent,
      child: InteractiveViewer(
        boundaryMargin: EdgeInsets.all(double.infinity),
        child: Stack(
          children: [
            Positioned(
              left: 420,
              top: 300,
              child: Dialog(
                shadowColor: Colors.black,
                elevation: 100,
                backgroundColor: Colors.white,
                surfaceTintColor: Colors.black38,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: SizedBox(
                  width: 450,
                  height: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: TextFormField(
                          controller: _controller,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          MaterialButton(
                            onPressed: onPressedCancel,
                            minWidth: 140,
                            height: 60,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            color: Colors.redAccent,
                            child: const Text("إلغاء",
                                style: TextStyle(fontSize: 25)),
                          ),
                          MaterialButton(
                            onPressed: () {
                              print(currentIndex);
                              pf
                                  .insertData(currentIndex, _controller.text,
                                      department)
                                  .then((value) => onPressedCancel);
                            },
                            minWidth: 140,
                            height: 60,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            color: Colors.greenAccent,
                            child: const Text(
                              "حفظ",
                              style: TextStyle(fontSize: 25),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
                left: 590,
                top: 260,
                child: Container(
                  width: 180,
                  height: 90,
                  decoration: BoxDecoration(
                    color: Colors.lightBlueAccent,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Center(
                      child: Text(
                    popUpAddDialogNames[currentIndex],
                    style: const TextStyle(
                        fontSize: 28, fontWeight: FontWeight.bold),
                  )),
                ))
          ],
        ),
      ),
    );
  }
}
