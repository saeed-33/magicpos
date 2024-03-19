/*import 'package:flutter/material.dart';

import '../screens_data/functions_products.dart';

class ExpansionProducts extends StatefulWidget {
  final TextEditingController controller;
  final List<TextEditingController> productsController;
  final bool isGroup;
  const ExpansionProducts(
      {super.key,
      required this.isGroup,
      required this.productsController,
      required this.controller});

  @override
  State<ExpansionProducts> createState() => _ExpansionProductsState();
}

class _ExpansionProductsState extends State<ExpansionProducts> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 270,
          child: ExpansionTile(
            onExpansionChanged: (value) {
              setState(() {});
            },
            collapsedShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: const BorderSide()),
            shape: const RoundedRectangleBorder(side: BorderSide()),
            collapsedBackgroundColor: Colors.lightBlueAccent,
            title: TextField(
              onChanged: (value) {
                setState(() {});
              },
              controller: widget.controller,
            ),
            children: [
              SizedBox(
                height: 120,
                child: FutureBuilder(
                  future: widget.isGroup
                      ? getGroups([
                          widget.productsController[0],
                          widget.productsController[1]
                        ])
                      : getDepartments(
                          productsController: widget.productsController[0]),
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else {
                      List<Map> data = snapshot.data;
                      if (data.isNotEmpty) {
                        return ListView.builder(
                          itemBuilder: (BuildContext context, int index) {
                            return MaterialButton(
                              height: 55,
                              shape: Border.symmetric(
                                  horizontal: index % 2 == 0
                                      ? const BorderSide()
                                      : BorderSide.none),
                              color: index % 2 == 0
                                  ? Colors.white70
                                  : Colors.white,
                              onPressed: () {
                                widget.controller.text = widget.isGroup
                                    ? data[index]['group_name']
                                    : data[index]['section_name'];
                                setState(() {});
                              },
                              child: Center(
                                  child: Text(widget.isGroup
                                      ? data[index]['group_name']
                                      : data[index]['section_name'])),
                            );
                          },
                          itemCount: data.length,
                        );
                      } else {
                        return const Text("No such results");
                      }
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ExpansionProductsName extends StatelessWidget {
  const ExpansionProductsName(
      {super.key, required this.title, required this.onTap});
  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 258,
      height: 60,
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 27),
          ),
          //space
          const Spacer(),
          MaterialButton(
            padding: EdgeInsets.zero,
            height: 45,
            minWidth: 45,
            onPressed: onTap,
            color: Colors.lightBlueAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              side: const BorderSide(),
            ),
            child: const Icon(Icons.add),
          ),
          //space
        ],
      ),
    );
  }
}
*/
