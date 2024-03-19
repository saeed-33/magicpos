import 'package:flutter/material.dart';

import 'display_pop_up.dart';

class TextWithTextBoxAndButton extends StatelessWidget {
  TextWithTextBoxAndButton(
      {super.key,
      required this.title,
      required this.selected,
      required this.indexOfCurrentBox,
      required this.currentDepartment});
  final String title;
  String selected;
  final String currentDepartment;

  final int indexOfCurrentBox;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 565,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            width: 330,
            height: 50,
            child: Container(
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                border: Border.all(width: 1),
              ),
              child: Row(
                children: [
                  MaterialButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) => DisplayPopUp(
                                onCancel: () {
                                  Navigator.pop(context);
                                  selected = "";
                                },
                                selected: selected,
                                indexOfCurrentBox: indexOfCurrentBox,
                                currentDepartment: currentDepartment == ""
                                    ? "undefined"
                                    : currentDepartment,
                                onOK: () {
                                  Navigator.pop(context);
                                },
                              ));
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      topLeft: Radius.circular(10),
                    )),
                    child: Icon(
                      Icons.more_horiz,
                      size: 30,
                    ),
                    height: 50,
                    minWidth: 40,
                  ),
                  Text(
                    selected,
                    style: TextStyle(fontSize: 25),
                  )
                ],
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
