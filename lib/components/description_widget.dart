import "package:flutter/material.dart";

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.all(10.6),
                decoration: BoxDecoration(
                  border: Border.all(),
                  color: Colors.grey,
                ),
                child: const Center(
                  child: Text(
                    "n",
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                padding: const EdgeInsets.all(10.6),
                decoration: BoxDecoration(
                  border: Border.all(),
                  color: Colors.grey,
                ),
                child: const Center(
                  child: Text(
                    "description",
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.all(10.6),
                decoration: BoxDecoration(
                  border: Border.all(),
                  color: Colors.grey,
                ),
                child: const Center(
                  child: Text(
                    "qty",
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(10.6),
                decoration: BoxDecoration(
                  border: Border.all(),
                  color: Colors.grey,
                ),
                child: const Center(
                  child: Text(
                    "unit price",
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(10.6),
                decoration: BoxDecoration(
                  border: Border.all(),
                  color: Colors.grey,
                ),
                child: const Center(
                  child: Text(
                    "total price",
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(
                left: BorderSide(
                  width: 2,
                ),
                right: BorderSide(
                  width: 2.5,
                ),
              ),
            ),
            child: SingleChildScrollView(
              child: Table(
                border: TableBorder.all(
                  width: .5,
                ),
                columnWidths: const {
                  0: FlexColumnWidth(1),
                  1: FlexColumnWidth(4),
                  2: FlexColumnWidth(1),
                  3: FlexColumnWidth(2),
                  4: FlexColumnWidth(2),
                },
                children: [
                  ...List.generate(
                    50,
                    (index) => TableRow(
                      children: [
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Padding(
                            padding: const EdgeInsets.all(
                              8.0,
                            ),
                            child: Center(
                              child: Text(
                                (index + 1).toString(),
                                style: const TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Cell 1"),
                          ),
                        ),
                        const TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Cell1"),
                          ),
                        ),
                        const TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Cell1"),
                          ),
                        ),
                        const TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Cell1"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10.6),
                decoration: BoxDecoration(
                  border: Border.all(),
                  color: Colors.grey,
                ),
                child: const Text(
                  "T.QTY",
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10.6),
                decoration: BoxDecoration(
                  border: Border.all(),
                  color: Colors.grey,
                ),
                child: const Text(
                  "T.price",
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
