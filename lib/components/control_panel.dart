import 'package:flutter/material.dart';
import "../screens_data/functions_keys_data.dart";

class ControlPanel extends StatelessWidget {
  const ControlPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: controlPanelKeys.map((e) {
          return Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: e.map((w) {
                return Expanded(
                  flex: w["flex"],
                  child: MaterialButton(
                    onPressed: () {},
                    color: w["color"],
                    shape: Border.all(),
                    child: Text(
                      w["txt"],
                      style: TextStyle(
                        fontSize: w["txt"] == "C"
                            ? 52
                            : w["txt"] == "VISA1" || w["txt"] == "VISA2"
                                ? 19.2
                                : 26,
                        color: w["txt"] == "C" ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          );
        }).toList(),
      ),
    );
  }
}
