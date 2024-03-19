import "package:flutter/material.dart";

class ViewPanel extends StatelessWidget {
  const ViewPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.lightBlue,
        border: Border(
          top: BorderSide(),
          left: BorderSide(),
          right: BorderSide(),
        ),
      ),
      padding: const EdgeInsets.all(
        10.6,
      ),
      child: Column(
        children: [
          Expanded(
            flex: 8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 33,
                      child: Container(
                        color: Colors.white,
                        padding: const EdgeInsets.all(10.6),
                        child: const Text(
                          "0",
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    const Expanded(
                      flex: 8,
                      child: Text(
                        textAlign: TextAlign.start,
                        ": الإجمالي",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 33,
                      child: Container(
                        color: Colors.white,
                        padding: const EdgeInsets.all(10.6),
                        child: const Text(
                          "0",
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    const Expanded(
                      flex: 8,
                      child: Text(
                        textAlign: TextAlign.start,
                        ": الإضافات",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 33,
                      child: Container(
                        color: Colors.white,
                        padding: const EdgeInsets.all(10.6),
                        child: const Text(
                          "0",
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    const Expanded(
                      flex: 8,
                      child: Text(
                        textAlign: TextAlign.start,
                        ": الحسومات",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 33,
                      child: Container(
                        color: Colors.white,
                        padding: const EdgeInsets.all(10.6),
                        child: const Text(
                          "0",
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    const Expanded(
                      flex: 8,
                      child: Text(
                        textAlign: TextAlign.start,
                        ": الصافي",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Spacer(flex: 1),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.white,
              width: double.infinity,
              padding: const EdgeInsets.all(10.6),
              child: const Text(""),
            ),
          ),
        ],
      ),
    );
  }
}
