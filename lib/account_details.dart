import 'package:flutter/material.dart';

import 'color.dart';
import 'model.dart';

class AccountDetailsPage extends StatefulWidget {
  const AccountDetailsPage({super.key});

  @override
  State<AccountDetailsPage> createState() => _AccountDetailsPageState();
}

class _AccountDetailsPageState extends State<AccountDetailsPage> {
  List<int> years = List.generate(10, (index) => DateTime.now().year - index);
  List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  int selectedYear = DateTime.now().year;
  String selectedMonth = 'January';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100,
        backgroundColor: orage,
        leading: Row(
          children: [
            const SizedBox(width: 5),
            InkWell(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 10),
            const Icon(
              Icons.menu,
              color: Colors.white,
            ),
          ],
        ),
        title: const Text(
          "Account Details",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.maxFinite,
            color: Colors.white,
            height: 1,
          ),
          SizedBox(
            height: 70,
            child: Row(
              children: [
                Expanded(
                    child: Container(
                  height: 100,
                  color: orage,
                  child: const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Account Number",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          "630605123554",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
                Container(
                  width: 1,
                  color: Colors.white,
                  height: double.maxFinite,
                ),
                Expanded(
                    child: Container(
                  height: 100,
                  color: orage,
                  child: const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Available Balance",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          "₹$balance",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
                Container(
                  width: 1,
                  color: Colors.white,
                  height: double.maxFinite,
                ),
                Expanded(
                    child: Container(
                  height: 100,
                  color: orage,
                  child: const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Ledger Balance",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          "₹$balance",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
              ],
            ),
          ),
          const SizedBox(height: 15),
          const SizedBox(
            height: 70,
            child: Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Monthly average balance",
                            style: TextStyle(fontSize: 12, color: grey),
                          ),
                          SizedBox(width: 5),
                          Icon(
                            Icons.info_outline,
                            color: grey,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "₹2,00,8763.19",
                        style: TextStyle(
                            fontSize: 18,
                            color: blue,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                )),
                Expanded(
                    child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Quaterly average balance",
                            style: TextStyle(fontSize: 12, color: grey),
                          ),
                          SizedBox(width: 5),
                          Icon(
                            Icons.info_outline,
                            color: grey,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "₹1,02,2773.19",
                        style: TextStyle(
                            fontSize: 18,
                            color: blue,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15).copyWith(bottom: 0),
            child: const Text(
              "Previous Monthly Average Balance",
              style: TextStyle(fontSize: 14, color: grey),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(15),
            child: Text(
              "₹--",
              style: TextStyle(
                  fontSize: 18, color: blue, fontWeight: FontWeight.w600),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(15),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "Year",
                    style: TextStyle(fontSize: 14, color: grey),
                  ),
                ),
                Expanded(
                  child: Text(
                    "Month",
                    style: TextStyle(fontSize: 14, color: grey),
                  ),
                ),
                Expanded(child: SizedBox())
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                const SizedBox(width: 20),
                Expanded(
                  child: DropdownButton<int>(
                    underline: const SizedBox(),
                    value: selectedYear,
                    items: years.map((int year) {
                      return DropdownMenuItem<int>(
                        value: year,
                        child: Text('$year'),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        selectedYear = newValue!;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: DropdownButton<String>(
                    underline: const SizedBox(),
                    value: selectedMonth,
                    items: months.map((String month) {
                      return DropdownMenuItem<String>(
                        value: month,
                        child: Text(month),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        selectedMonth = newValue!;
                      });
                    },
                  ),
                ),
                Expanded(
                    child: TextButton(
                  onPressed: () {},
                  child: const Text("Submit"),
                  style: TextButton.styleFrom(
                    backgroundColor: blue.withOpacity(0.5),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    foregroundColor: Colors.white,
                  ),
                ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15).copyWith(bottom: 0),
            child: const Text(
              "Previous Quarterly Average Balance",
              style: TextStyle(fontSize: 14, color: grey),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(15),
            child: Text(
              "₹--",
              style: TextStyle(
                  fontSize: 18, color: blue, fontWeight: FontWeight.w600),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(15),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "Year",
                    style: TextStyle(fontSize: 14, color: grey),
                  ),
                ),
                Expanded(
                  child: Text(
                    "Month",
                    style: TextStyle(fontSize: 14, color: grey),
                  ),
                ),
                Expanded(child: SizedBox())
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                const SizedBox(width: 20),
                Expanded(
                  child: DropdownButton<int>(
                    underline: const SizedBox(),
                    value: selectedYear,
                    items: years.map((int year) {
                      return DropdownMenuItem<int>(
                        value: year,
                        child: Text('$year'),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        selectedYear = newValue!;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: DropdownButton<String>(
                    underline: const SizedBox(),
                    value: selectedMonth,
                    items: months.map((String month) {
                      return DropdownMenuItem<String>(
                        value: month,
                        child: Text(month),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        selectedMonth = newValue!;
                      });
                    },
                  ),
                ),
                Expanded(
                    child: TextButton(
                  onPressed: () {},
                  child: const Text("Submit"),
                  style: TextButton.styleFrom(
                    backgroundColor: blue.withOpacity(0.5),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    foregroundColor: Colors.white,
                  ),
                ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15).copyWith(bottom: 0),
            child: const Text(
              "Current Account Variant ",
              style: TextStyle(fontSize: 14, color: grey),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(15),
            child: Text(
              "Classic 2.0",
              style: TextStyle(
                  fontSize: 18, color: blue, fontWeight: FontWeight.w400),
            ),
          ),
          const Expanded(child: SizedBox()),
          SafeArea(
              child: Center(
            child: TextButton(
              onPressed: () {},
              child: const Text("DETAILED STATEMENT"),
              style: TextButton.styleFrom(
                backgroundColor: blue,
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                foregroundColor: Colors.white,
              ),
            ),
          ))
        ],
      ),
    );
  }
}
