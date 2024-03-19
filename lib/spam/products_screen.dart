/*import 'package:flutter/material.dart';

import '../screens_data/constants.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});
  //name of products screen route
  static const String route = "/products_screen";

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  //the current sort type for the product list
  String sortType = sortTypes[0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Container(
            width: 400,
            height: 45,
            decoration: const BoxDecoration(color: Colors.white),
            //search bar
            child: const Row(
              children: [
                //text field to search of product's english or arabic name or it's barcode
                Expanded(flex: 5, child: TextField()),
                Expanded(
                    flex: 1,
                    child: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ))
              ],
            )),
        actions: [
          Container(
            width: 365,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.greenAccent),
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: PopupMenuButton(
              padding: EdgeInsets.zero,
              child: Row(children: [
                const Spacer(),
                Text(
                  sortType,
                  style: const TextStyle(fontSize: 30, color: Colors.blueGrey),
                ),
                const Spacer(),
                const Text(
                  " : ترتيب حسب",
                  style: TextStyle(fontSize: 30),
                ),
              ]),
              itemBuilder: (BuildContext context) => [
                PopupMenuItem(
                  onTap: () {
                    setState(() {});
                    sortType = sortTypes[0];
                  },
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      sortTypes[0],
                    ),
                  ),
                ),
                PopupMenuItem(
                  onTap: () {
                    sortType = sortTypes[1];
                    setState(() {});
                  },
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      sortTypes[1],
                    ),
                  ),
                ),
                PopupMenuItem(
                  onTap: () {
                    setState(() {});
                    sortType = sortTypes[2];
                  },
                  child: SizedBox(
                    width: 500,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        sortTypes[2],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0, left: 20),
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              onPressed: () {},
              minWidth: 200,
              height: 45,
              color: Colors.greenAccent,
              child: const Text(
                "إضافة مادة",
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: FutureBuilder(
          future: viewSection(),
          builder: (BuildContext context,
              AsyncSnapshot<List<Map<dynamic, dynamic>>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else {
              List<Map>? data = snapshot.data;
              if (data!.isNotEmpty) {
                return ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(),
                              left: BorderSide(),
                              right: BorderSide(),
                            ),
                            color: Colors.black12,
                          ),
                          width: double.infinity,
                          height: 50,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 30.0),
                            child: Text(
                              data[index]['section_name'],
                              textAlign: TextAlign.end,
                              style: const TextStyle(
                                fontSize: 30,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(
                              border: Border(bottom: BorderSide())),
                          child: FutureBuilder(
                            future: viewGroups(data[index]['id']),
                            builder: (BuildContext context,
                                AsyncSnapshot<List<Map<dynamic, dynamic>>>
                                    snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const CircularProgressIndicator();
                              } else {
                                List<Map>? data0 = snapshot.data;
                                if (data0!.isNotEmpty) {
                                  return ListView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: data0.length,
                                      itemBuilder:
                                          (BuildContext context, int index2) {
                                        return Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Colors.lightBlueAccent,
                                              ),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 20),
                                              child: Text(
                                                data0[index2]['group_name'],
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                    fontSize: 30),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 15.0,
                                                      horizontal: 10),
                                              child: data0[index2]
                                                          ['products_number'] >
                                                      0
                                                  ? FutureBuilder(
                                                      future: viewProducts(
                                                          section: data[index]
                                                              ['id'],
                                                          group: data0[index2]
                                                              ['id'],
                                                          sortType: 3),
                                                      builder: (BuildContext
                                                              context,
                                                          AsyncSnapshot<
                                                                  List<
                                                                      Map<dynamic,
                                                                          dynamic>>>
                                                              snapshot) {
                                                        if (snapshot
                                                                .connectionState ==
                                                            ConnectionState
                                                                .waiting) {
                                                          return const CircularProgressIndicator();
                                                        } else {
                                                          List<Map>? data1 =
                                                              snapshot.data;

                                                          if (data1!
                                                              .isNotEmpty) {
                                                            return GridView
                                                                .builder(
                                                              gridDelegate:
                                                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                                                      mainAxisSpacing:
                                                                          20,
                                                                      crossAxisCount:
                                                                          6),
                                                              itemBuilder:
                                                                  (BuildContext
                                                                          context,
                                                                      int index3) {
                                                                return Column(
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Container(
                                                                        decoration: const BoxDecoration(
                                                                            borderRadius: BorderRadius.only(
                                                                              topLeft: Radius.circular(10),
                                                                              topRight: Radius.circular(10),
                                                                            ),
                                                                            border: Border(left: BorderSide(), right: BorderSide(), top: BorderSide())),
                                                                        height:
                                                                            240,
                                                                        width:
                                                                            200,
                                                                        child:
                                                                            const SizedBox(),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      width:
                                                                          200,
                                                                      padding:
                                                                          const EdgeInsets
                                                                              .all(
                                                                              5),
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Colors
                                                                            .lightBlueAccent,
                                                                        border:
                                                                            Border.all(),
                                                                        borderRadius:
                                                                            const BorderRadius.only(
                                                                          bottomLeft:
                                                                              Radius.circular(10),
                                                                          bottomRight:
                                                                              Radius.circular(10),
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Text(
                                                                        data1[index3]
                                                                            [
                                                                            'en_name'],
                                                                        textAlign:
                                                                            TextAlign.end,
                                                                        style: const TextStyle(
                                                                            fontSize:
                                                                                20),
                                                                      ),
                                                                    )
                                                                  ],
                                                                );
                                                              },
                                                              itemCount:
                                                                  data1.length,
                                                              physics:
                                                                  const NeverScrollableScrollPhysics(),
                                                              shrinkWrap: true,
                                                            );
                                                          } else {
                                                            return const Text(
                                                                "No products in this group yet !!!",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        30));
                                                          }
                                                        }
                                                      },
                                                    )
                                                  : const Text(
                                                      "No products yet in this group!!!",
                                                      style: TextStyle(
                                                          fontSize: 30),
                                                    ),
                                            )
                                          ],
                                        );
                                      });
                                } else {
                                  return const Center(
                                    child: Text(
                                      "No groups yet in this section!!!",
                                      style: TextStyle(fontSize: 30),
                                    ),
                                  );
                                }
                              }
                            },
                          ),
                        )
                      ],
                    );
                  },
                  itemCount: data.length,
                );
              } else {
                return const Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Text(
                    "there is no sections yet!!",
                    style: TextStyle(fontSize: 30),
                  ),
                );
              }
            }
          },
        ),
      ),
    );
  }
}
*/
