import 'package:bank/model.dart';
import 'package:flutter/material.dart';

import 'color.dart';


class FundTransferScreen extends StatelessWidget {
  const FundTransferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [
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
                  const Text(
                    "Fund Transfer",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(width: 2, color: Colors.white)),
                    child: const Icon(
                      Icons.question_mark_outlined,
                      color: Colors.white,
                      size: 26,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const Expanded(child: NestedTabBar()),
      ]),
    );
  }
}

class NestedTabBar extends StatefulWidget {
  const NestedTabBar({super.key});

  @override
  State<NestedTabBar> createState() => _NestedTabBarState();
}

class _NestedTabBarState extends State<NestedTabBar>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // List<Transaction> transactions = List.generate(20, (index) {
  //   return Transaction(
  //     transactionDate: DateTime(2023, 12, 23 - index, 8, 30),
  //     transactionAmount: 50.00 + index * 40.00,
  //     debitCredit: index % 2 == 0 ? "Debit" : "Credit",
  //     referenceId: "NEFT-AXIOC000023763748${index + 1}",
  //   );
  // });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(20).copyWith(top: 0),
          child: Card(
            elevation: 1,
            color: const Color(0xffF1F2F7),
            margin: const EdgeInsets.all(0),
            borderOnForeground: false,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100)),
            child: Padding(
              padding: const EdgeInsets.all(3),
              child: TabBar.secondary(
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    gradient: const LinearGradient(
                        colors: [Color(0xff4477AC), Color(0xff1F466F)])),
                labelColor: Colors.white,
                controller: _tabController,
                labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                tabs: <Widget>[
                  const Tab(
                    text: "Bank Transfer",
                  ),
                  Tab(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/4.png",
                          height: 15,
                        ),
                        const SizedBox(width: 5),
                        const Text("UPI Payments")
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: const <Widget>[BankTransfer(), SizedBox()],
          ),
        ),
      ],
    );
  }
}

class BankTransfer extends StatelessWidget {
  const BankTransfer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              "Transfer Funds To",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                TransferButton(
                  name: "Own Account",
                  isActive: true,
                ),
                SizedBox(width: 10),
                TransferButton(
                  name: "With ICIC",
                  isActive: false,
                ),
                SizedBox(width: 10),
                TransferButton(
                  name: "OutsideICIC",
                  isActive: false,
                )
              ],
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(20).copyWith(bottom: 0),
            child: const Text(
              "Select Payee",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10)
                .copyWith(bottom: 15),
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1, color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(100),
            ),
            color: Colors.white,
            elevation: 0,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                ),
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search Payee",
                      hintStyle: TextStyle(color: Colors.grey),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
                Container(
                  color: Colors.grey,
                  width: 1,
                  height: 35,
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                ),
                const Center(
                  child: Icon(
                    Icons.person_add_alt_1_outlined,
                    color: orage,
                  ),
                ),
                const SizedBox(width: 15),
              ],
            ),
          ),
          Container(
              margin: const EdgeInsets.all(20).copyWith(bottom: 30),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                  border: Border.all(
                    width: 1,
                    color: Colors.grey.shade300,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300.withOpacity(1),
                      blurRadius: 10,
                    )
                  ]),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: orage.withOpacity(0.3),
                    child: const Center(
                      child: Icon(
                        Icons.flash_on_outlined,
                        size: 30,
                        color: orage,
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  const SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Quick Fund Transfer ",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          "Pay upto 220,000 to any non-added payee",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.chevron_right,
                    color: blue,
                    size: 30,
                  )
                ],
              )),
          Expanded(
            child: SafeArea(
              top: false,
              child: Container(
                padding: const EdgeInsets.all(20).copyWith(bottom: 0),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                        bottomLeft: Radius.circular(14),
                        bottomRight: Radius.circular(14)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300.withOpacity(1),
                        blurRadius: 10,
                      )
                    ]),
                child: Column(
                  children: [
                    const SizedBox(
                      child: Row(children: [
                        Icon(
                          Icons.timer,
                          color: blue,
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Recent Transfer ",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_drop_up,
                          size: 30,
                        )
                      ]),
                    ),
                    const SizedBox(height: 5),
                    Expanded(
                        child: SizedBox(
                      child: ListView(
                        padding: const EdgeInsets.all(0),
                        children: List.generate(
                            recentTransactions.length,
                            (index) => RecentTransactioCard(
                                  data: RecentTrasaction(
                                      amoun: recentTransactions[index].amoun,
                                      date: recentTransactions[index].date,
                                      imageLink:
                                          recentTransactions[index].imageLink,
                                      name: recentTransactions[index].name,
                                      referenceId: recentTransactions[index]
                                          .referenceId),
                                )),
                      ),
                    ))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class RecentTransactioCard extends StatelessWidget {
  final RecentTrasaction data;
  const RecentTransactioCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 2),
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: const BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(color: Colors.grey, blurRadius: 0, offset: Offset(0, 1))
      ]),
      child: Row(
        children: [
          Image.asset(
            data.imageLink,
            width: 30,
          ),
          const SizedBox(width: 10),
          SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.name,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  data.referenceId,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "₹${data.amoun}",
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.7),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  formatDateTime(data.date),
                  style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
                backgroundColor: blue.withOpacity(0.7),
                foregroundColor: Colors.white),
            child:const  Text("Pay"),
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}

class TransferButton extends StatelessWidget {
  final bool isActive;
  final String name;
  const TransferButton({
    super.key,
    required this.isActive,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: isActive
                ? const LinearGradient(colors: [
                    Color(0xffF47109),
                    Color(0xffFE9834),
                  ])
                : const LinearGradient(
                    colors: [
                      Colors.white,
                      Colors.white,
                    ],
                  ),
            border: Border.all(
              width: 1,
              color: Colors.grey.shade400,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade200.withOpacity(0.5),
                blurRadius: 10,
              )
            ]),
        child: Center(
          child: Text(
            name,
            style: TextStyle(
              color: isActive ? Colors.white : Colors.black,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
