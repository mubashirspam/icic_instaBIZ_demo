import 'package:bank/color.dart';
import 'package:flutter/material.dart';

import 'model.dart';

class ProfileDetailsScreen extends StatelessWidget {
  const ProfileDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var coloredBox = ColoredBox(
      color: grey.withOpacity(0.4),
      child: const SizedBox(
        height: 1,
        width: double.maxFinite,
      ),
    );
    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            bottom: false,
            child: Container(
              width: double.maxFinite,
              height: 70,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xffF47109),
                    Color(0xffFE9834),
                  ],
                ),
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 26,
                      ),
                    ),
                    const SizedBox(width: 5),
                    const Icon(
                      Icons.menu,
                      color: Colors.white,
                      size: 26,
                    ),
                    const Expanded(
                      child: SizedBox(
                        child: Center(
                          child: Text(
                            "Profile Details",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
              child: SizedBox(
            width: double.maxFinite,
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                heading("Account Number"),
                gap(15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    content("630605123554"),
                    const Icon(
                      Icons.arrow_drop_down,
                      color: grey,
                    )
                  ],
                ),
                gap(10),
                coloredBox,
                gap(15),
                heading("Account Holder's name"),
                gap(20),
                content("JCSHUB ENTERPRISES (OPC) PRIVATELIMITED"),
                gap(20),
                heading("IFSC Code"),
                gap(20),
                content("ICIC0006306"),
                gap(20),
                heading("Communication Address"),
                gap(40),
                heading("Contact Number"),
                gap(20),
                content("9700747401"),
                gap(20),
                heading("Email ID"),
                gap(20),
                content("JAGADEESH.RAVI4@GMAIL.COM"),
                gap(20),
                heading("PAN Number"),
                gap(20),
                content("AAECJ2260N"),
                gap(20),
                heading("Corporate ID"),
                gap(20),
                content("569942378"),
                gap(20),
                heading("User ID"),
                gap(20),
                content("CHALLAJA"),
                gap(20),
                heading("Last Login"),
                gap(20),
                content(formatDateTimeToNow(DateTime.now())),
                gap(20),
                SafeArea(
                  top: false,
                  child: TextButton(
                    child: Text("Share Profile Details"),
                    onPressed: () {},
                    style: TextButton.styleFrom(
                        backgroundColor: blue,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 15)),
                  ),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }

  Widget gap(double h) => SizedBox(height: h);

  Widget content(String content) => Text(
        content,
        style: const TextStyle(color: blue, fontSize: 17),
      );

  Widget heading(String content) => Text(
        content,
        style: const TextStyle(color: grey, fontSize: 14),
      );
}
