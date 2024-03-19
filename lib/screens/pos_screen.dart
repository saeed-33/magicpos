import "package:flutter/material.dart";
import "package:magicpos/components/control_panel.dart";
import "package:magicpos/components/view_panel.dart";
import "../components/description_widget.dart";
import "../components/functions_keys_bar.dart";

class PosScreen extends StatelessWidget {
  const PosScreen({super.key});
  static const String route = "/pos-screen";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Row(
          children: [
            Expanded(
              flex: 45,
              child: DescriptionWidget(),
            ),
            Spacer(
              flex: 1,
            ),
            Expanded(
              flex: 15,
              child: FunctionsKeysBar(),
            ),
            Spacer(
              flex: 1,
            ),
            Expanded(
              flex: 30,
              child: Column(
                children: [
                  Expanded(child: ViewPanel()),
                  Expanded(
                    child: ControlPanel(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
