/*import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../screens_data/constants.dart';

//cells of the unit tables
class CustomTableCell extends StatefulWidget {
  final int row;
  final double bottomLeftRadius;
  final bool disableUnits;
  final String title;
  final bool viewMode;
  final int column;
  final void Function(bool?) onChanged;
  final TextEditingController controller;
  const CustomTableCell(
      {super.key,
      required this.disableUnits,
      required this.onChanged,
      required this.title,
      required this.controller,
      required this.viewMode,
      required this.bottomLeftRadius,
      required this.row,
      required this.column});

  @override
  State<CustomTableCell> createState() => _CustomTableCellState();
}

class _CustomTableCellState extends State<CustomTableCell> {
  @override
  Widget build(BuildContext context) {
    return TableCell(
      child: Center(
        //first row contains names of units only not text field
        child: widget.row == 0
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(fontSize: 25),
                  ),
                  const SizedBox(
                    width: 10,
                    height: 50,
                  ),
                  widget.column != 0
                      ? Checkbox(
                          value: !widget.disableUnits,
                          onChanged: widget.onChanged)
                      : SizedBox(
                          width: 0,
                          height: 0,
                        ),
                ],
              )
            //the next cells
            : Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: widget.disableUnits
                      //grey[300] to disable cell ,green accent to unchangeable cells or cells that u can't set it yourself and the different color for the table is light blue accent so transparent refer to enable cell that you can change it
                      ? Colors.grey[300]
                      : widget.row == 6
                          ? Colors.greenAccent
                          : Colors.transparent,
                  //when but the grey or green accent color the bottom left radius change so i but this radius for it
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(
                        widget.row == 6 && widget.column == 2 ? 25 : 0),
                  ),
                ),
                child: TextField(
                  style: const TextStyle(fontSize: 22),
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  //view mode when u want to change the product
                  readOnly: widget.viewMode || widget.disableUnits,
                  keyboardType: const TextInputType.numberWithOptions(),
                  controller: widget.controller,
                  maxLength: 20,
                  decoration: const InputDecoration(
                    counter: SizedBox(
                      width: 0,
                      height: 0,
                    ),
                    //i don't want any border effects so i but this
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.zero,
                        gapPadding: 0),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.zero,
                        gapPadding: 0),
                    disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.zero,
                        gapPadding: 0),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.zero,
                        gapPadding: 0),
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.zero,
                        gapPadding: 0),
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.zero,
                        gapPadding: 0),
                  ),
                ),
              ),
      ),
    );
  }
}

class UnitTable extends StatefulWidget {
  final List<List<TextEditingController>> controller;
  final List<bool> disableUnits;
  final bool viewMode;
  final List<String> unitsNames;
  const UnitTable(
      {super.key,
      required this.disableUnits,
      required this.controller,
      required this.viewMode,
      required this.unitsNames});
  @override
  State<UnitTable> createState() => _UnitTableState();
}

class _UnitTableState extends State<UnitTable> {
  Function(bool?) enableUnit(int i) {
    return (value) {
      widget.disableUnits[i] = !widget.disableUnits[i];
      setState(() {});
    };
  }

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(borderRadius: BorderRadius.circular(25)),
      children: [
        ...List.generate(
            7,
            (index) => TableRow(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(index == 0 ? 25 : 0),
                            topLeft: Radius.circular(index == 0 ? 25 : 0),
                            bottomLeft: Radius.circular(index == 6 ? 25 : 0),
                            bottomRight: Radius.circular(index == 6 ? 25 : 0)),
                        color: Colors.lightBlueAccent),
                    children: [
                      CustomTableCell(
                        title: widget.unitsNames[2] == ""
                            ? "unit3"
                            : widget.unitsNames[2],
                        controller: widget.controller[index][2],
                        viewMode: false,
                        onChanged: enableUnit(1),
                        disableUnits: widget.disableUnits[1],
                        bottomLeftRadius: index == 6 ? 25 : 0,
                        row: index,
                        column: 2,
                      ),
                      CustomTableCell(
                        title: widget.unitsNames[1] == ""
                            ? "unit2"
                            : widget.unitsNames[1],
                        controller: widget.controller[index][1],
                        viewMode: false,
                        onChanged: enableUnit(0),
                        disableUnits: widget.disableUnits[0],
                        bottomLeftRadius: 0,
                        row: index,
                        column: 1,
                      ),
                      if (index != 5)
                        CustomTableCell(
                          title: widget.unitsNames[0] == ""
                              ? "unit1"
                              : widget.unitsNames[0],
                          controller: widget.controller[index][0],
                          viewMode: false,
                          onChanged: (bool? bool) {},
                          disableUnits: false,
                          bottomLeftRadius: 0,
                          row: index,
                          column: 0,
                        )
                      else
                        Container(
                          width: double.infinity,
                          height: 50,
                          color: Colors.grey[300],
                        ),
                      Center(
                        child: Text(
                          tableRowNames[index],
                          style: const TextStyle(fontSize: 25),
                        ),
                      )
                    ]))
      ],
    );
  }
}
*/
