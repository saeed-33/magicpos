import "package:flutter/material.dart";
import "../components/custom_button.dart";
import "../screens_data/home_screen_data.dart";

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final double ratio = 2.24 / 100;
  final List firstRow = data.sublist(0, 5);
  final List secondRow = data.sublist(5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Container(
        margin: EdgeInsets.all(ratio * MediaQuery.of(context).size.width),
        padding: EdgeInsets.symmetric(
          horizontal: (ratio + 0.015) * MediaQuery.of(context).size.width,
          vertical: ratio * MediaQuery.of(context).size.width,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            ratio * MediaQuery.of(context).size.width,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image(
                  width: 150,
                  height: 150,
                  image: AssetImage("assets/images/logo-test.jpg"),
                ),
                Text(
                  "MagicPOS",
                  style: TextStyle(
                    fontSize: 42,
                    color: Colors.lightBlue,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: firstRow
                  .map(
                    (e) => CustomButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                          e["route"],
                        );
                      },
                      icon: e["icon"],
                      engText: e["engText"],
                      arText: e["arText"],
                    ),
                  )
                  .toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: secondRow
                  .map(
                    (e) => CustomButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                          e["route"],
                        );
                      },
                      icon: e["icon"],
                      engText: e["engText"],
                      arText: e["arText"],
                    ),
                  )
                  .toList(),
            ),
            SizedBox(
              height: ratio / 10 * MediaQuery.of(context).size.width,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Tel: 011 322 7272",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                Text(
                  "Mobile: 0949 298 938",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                Text(
                  "Facebook: MagicPOS",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                Text(
                  "Email: magicpos@gmail.com",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
