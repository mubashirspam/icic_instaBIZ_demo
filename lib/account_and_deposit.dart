import 'package:bank/color.dart';
import 'package:flutter/material.dart';

class AccountAndDeposit extends StatelessWidget {
  const AccountAndDeposit({super.key});

  @override
  Widget build(BuildContext context) {
    var devider = ColoredBox(
      color: Colors.grey.shade300,
      child: SizedBox(
        width: double.maxFinite,
        height: 1,
      ),
    );
    return Scaffold(
      body: Column(
        children: [
          SafeArea(
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
                    SizedBox(width: 5),
                    Icon(
                      Icons.menu,
                      color: Colors.white,
                      size: 26,
                    ),
                    Expanded(
                      child: SizedBox(
                        child: Center(
                          child: const Text(
                            "Account And Deposits",
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
              child: Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey.shade300)),
            child: Column(
              children: [
                devider,
                listItem("Current Accounts"),
                devider,
                listItem("Deposit"),
                devider,
                listItem("Packing Credit Accounts"),
              ],
            ),
          )),
          Expanded(child: SizedBox())
        ],
      ),
    );
  }

  SizedBox listItem(String name) => SizedBox(
        height: 70,
        child: Row(
          children: [
            Text(
              name,
              style: TextStyle(color: grey),
            ),
            Spacer(),
            Icon(
              Icons.chevron_right_rounded,
              color: orage,
              size: 30,
            )
          ],
        ),
      );
}
