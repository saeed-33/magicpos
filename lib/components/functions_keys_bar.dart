import "package:flutter/material.dart";
import "../screens_data/functions_keys_data.dart";

class FunctionsKeysBar extends StatelessWidget {
  const FunctionsKeysBar({super.key});
  static const double borderWidth = 4;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: functionKeysData
          .map(
            (e) => Expanded(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: MaterialButton(
                        color: e[0]["color"],
                        onPressed: () {},
                        // minWidth: (MediaQuery.of(context).size.width - 60) / 12,
                        shape: Border(
                          left: const BorderSide(
                            width: borderWidth,
                          ),
                          right: const BorderSide(),
                          top: e == functionKeysData[0]
                              ? const BorderSide(
                                  width: borderWidth,
                                )
                              : BorderSide.none,
                          bottom:
                              e == functionKeysData[functionKeysData.length - 1]
                                  ? const BorderSide(
                                      width: borderWidth,
                                    )
                                  : const BorderSide(),
                        ),
                        height: (MediaQuery.of(context).size.height - 20) / 9,
                        child: e[0].containsKey("icon")
                            ? Icon(
                                e[0]["icon"],
                                size: 50,
                              )
                            : Text(
                                e[0]["txt"],
                                style: const TextStyle(
                                  fontSize: 22,
                                ),
                              ),
                      ),
                    ),
                    Expanded(
                      child: MaterialButton(
                        color: e[1]["color"],
                        onPressed: () {},
                        shape: Border(
                          right: const BorderSide(
                            width: borderWidth,
                          ),
                          top: e == functionKeysData[0]
                              ? const BorderSide(
                                  width: borderWidth,
                                )
                              : BorderSide.none,
                          bottom:
                              e == functionKeysData[functionKeysData.length - 1]
                                  ? const BorderSide(
                                      width: borderWidth,
                                    )
                                  : const BorderSide(),
                        ),
                        height: (MediaQuery.of(context).size.height - 20) / 9,
                        child: e[1].containsKey("icon")
                            ? Icon(
                                e[1]["icon"],
                                size: 50,
                              )
                            : Text(
                                e[1]["txt"],
                                style: const TextStyle(
                                  fontSize: 22,
                                ),
                              ),
                      ),
                    ),
                  ]),
            ),
          )
          .toList(),
    );
  }
}
