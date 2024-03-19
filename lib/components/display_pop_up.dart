import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens_data/product_functions.dart';
import 'add_dialog.dart';

class DisplayPopUp extends StatefulWidget {
  DisplayPopUp({
    super.key,
    required this.onCancel,
    required this.selected,
    required this.indexOfCurrentBox,
    required this.currentDepartment,
    required this.onOK,
  });
  final VoidCallback onCancel;
  final VoidCallback onOK;
  String selected;
  final int indexOfCurrentBox;
  final String currentDepartment;
  @override
  State<DisplayPopUp> createState() => _DisplayPopUpState();
}

class _DisplayPopUpState extends State<DisplayPopUp> {
  TextEditingController controller = TextEditingController();
  ProductsFunctions pf = ProductsFunctions();

  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Dialog(
        child: Container(
          width: 420,
          height: 450,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.grey[300],
          ),
          child: Padding(
            padding: EdgeInsets.all(18),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      child: TextField(
                        onChanged: (value) {
                          setState(() {});
                        },
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            fillColor: Colors.white,
                            filled: true),
                      ),
                      height: 50,
                      width: 320,
                    ),
                    MaterialButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) => AddDialog(
                                  onPressedCancel: () {
                                    Navigator.pop(context);
                                  },
                                  onPressedOk: () {},
                                  currentIndex: widget.indexOfCurrentBox,
                                  department: widget.currentDepartment,
                                ));
                      },
                      child: Icon(Icons.add),
                      minWidth: 40,
                      height: 40,
                      color: Colors.lightBlueAccent,
                    ),
                  ],
                ),
                Container(
                  height: 300,
                  width: double.infinity,
                  color: Colors.white,
                  child: FutureBuilder(
                    future: pf.displayData(widget.indexOfCurrentBox,
                        widget.currentDepartment, controller.text),
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else {
                        List<Map> data = snapshot.data;
                        String columnName = "";
                        int isdep = 0;
                        switch (widget.indexOfCurrentBox) {
                          case 0:
                            {
                              columnName = "group_name";
                              break;
                            }
                          case 1:
                            {
                              isdep = 1;
                              columnName = "section_name";
                              break;
                            }
                          default:
                            {
                              columnName = "unit_names";
                              break;
                            }
                        }
                        if (data.isNotEmpty) {
                          return ListView.separated(
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {
                                  widget.selected =
                                      data[index + isdep][columnName];
                                },
                                child: Container(
                                  color: widget.selected ==
                                          data[index + isdep][columnName]
                                      ? Colors.lightBlueAccent
                                      : Colors.transparent,
                                  height: 45,
                                  width: double.infinity,
                                  child: Center(
                                      child: Text(
                                          data[index + isdep][columnName])),
                                ),
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 60.0),
                                child: Divider(
                                  thickness: 0,
                                  height: 0,
                                ),
                              );
                            },
                            itemCount: data.length - isdep,
                          );
                        } else
                          return Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              "No results",
                              style: TextStyle(fontSize: 30),
                            ),
                          );
                      }
                    },
                  ),
                ),
                Row(
                  children: [
                    Spacer(),
                    MaterialButton(
                      onPressed: widget.onCancel,
                      child: Text(
                        "إلغاء",
                        style: TextStyle(fontSize: 23),
                      ),
                      height: 40,
                      minWidth: 90,
                      color: Colors.redAccent[400],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    MaterialButton(
                      onPressed: widget.onOK,
                      child: Text(
                        "اختيار",
                        style: TextStyle(fontSize: 23),
                      ),
                      height: 40,
                      minWidth: 90,
                      color: Colors.lightGreen[400],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
