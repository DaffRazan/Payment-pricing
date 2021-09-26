import 'package:flutter/material.dart';
import 'package:payment_apps/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    Widget planOption(
        int index, String title, String subtitle, String pricing) {
      return GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
          child: Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                    color: selectedIndex == index
                        ? Color(0xff007DFF)
                        : Color(0xff4D5B7C))),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    selectedIndex == index
                        ? Image.asset(
                            'assets/images/checked.png',
                            width: 18,
                            height: 18,
                          )
                        : Image.asset(
                            'assets/images/unchecked.png',
                            width: 18,
                            height: 18,
                          ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: planTextStyle,
                        ),
                        Text(
                          subtitle,
                          style: descTextStyle,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Text(
                      pricing,
                      style: priceTextStyle,
                    )
                  ],
                )
              ],
            ),
          ));
    }

    Widget header() {
      return Padding(
        padding: const EdgeInsets.only(top: 50.0, left: 32.0, right: 32.0),
        child: Column(
          children: [
            Center(
                child: Image.asset(
              'assets/images/arrow.png',
              width: 267,
              height: 200,
            )),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Upgrade to',
                  style: titleTextStyle,
                ),
                SizedBox(
                  width: 6,
                ),
                Text(
                  'Pro',
                  style: titleProTextStyle,
                )
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              'Go unlock all features and \nbuild your own business bigger',
              style: subtitleTextStyle,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    Widget checkoutButton() {
      return Column(
        children: [
          Container(
            width: 311,
            height: 51.23,
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                "Checkout Now",
                style: buttonTextStyle,
              ),
              style: TextButton.styleFrom(
                  backgroundColor: Color(0xff007DFF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(71),
                  )),
            ),
          )
        ],
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Color(0xFF04112F),
          body: SingleChildScrollView(
            child: Column(
              children: [
                header(),
                SizedBox(
                  height: 50,
                ),
                planOption(0, 'Monthly', 'Good for starting up', '\$20'),
                planOption(1, 'Quarterly', 'Focusing on building', '\$55'),
                planOption(2, 'Yearly', 'Steady company', '\$220'),
                SizedBox(
                  height: 50,
                ),
                selectedIndex == -1 ? SizedBox() : checkoutButton(),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          )),
    );
  }
}
