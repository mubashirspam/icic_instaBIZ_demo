import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import 'color.dart';
import 'fund_transfer.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
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
          "Account",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
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
                            fontSize: 16,
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
                          "Account Balance",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "₹5,00,27000.00",
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
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Text(
              "transactions conducted on a non-banking day will have the transaction date as the next working day ",
              style: TextStyle(
                fontStyle: FontStyle.italic,
                color: grey,
                fontSize: 16,
              ),
            ),
          ),
          const Expanded(child: NestedTabBar()),
          Container(
            color: const Color(0xffFFF1E8),
            height: 70,
            child: const Center(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text.rich(
                    textAlign: TextAlign.center,
                    TextSpan(
                        style: TextStyle(),
                        text:
                            "To raise Dispute/Fraud for transaction done digitally in last 30 Days.",
                        children: [
                          TextSpan(
                              text: " Click Here",
                              style: TextStyle(
                                color: orage,
                                decoration: TextDecoration.underline,
                                decorationColor: orage,
                              ))
                        ])),
              ),
            ),
          ),
          SafeArea(
            child: SizedBox(
              height: 70,
              child: Row(
                children: [
                  Expanded(
                      child: InkWell(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const FundTransferScreen(),
                    )),
                    child: Container(
                      height: 100,
                      color: blue,
                      child: const Center(
                        child: Text(
                          "FUND TRANSFER",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
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
                    color: blue,
                    child: const Center(
                      child: Text(
                        "PAYBILLS",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )),
                ],
              ),
            ),
          ),
        ],
      ),
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
        Card(
          elevation: 1,
          color: Colors.white,
          margin: const EdgeInsets.all(0),
          borderOnForeground: false,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
          child: TabBar.secondary(
            indicatorColor: orage,
            labelColor: orage,
            controller: _tabController,
            labelStyle: const TextStyle(color: blue),
            tabs: const <Widget>[
              Tab(
                text: "Last 10 Transaction",
              ),
              Tab(
                text: "Detailed Statement",
              ),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: const <Widget>[TransactionList(), DetailedStatement()],
          ),
        ),
      ],
    );
  }
}

class DetailedStatement extends StatefulWidget {
  const DetailedStatement({
    super.key,
  });

  @override
  State<DetailedStatement> createState() => _DetailedStatementState();
}

class _DetailedStatementState extends State<DetailedStatement> {
  TextEditingController _startDateController = TextEditingController();
  TextEditingController _endDateController = TextEditingController();
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();

  Future<void> _selectDate(BuildContext context, bool isStartDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isStartDate ? startDate : endDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        if (isStartDate) {
          startDate = picked;
          _startDateController.text = "${picked.toLocal()}".split(' ')[0];
        } else {
          endDate = picked;
          _endDateController.text = "${picked.toLocal()}".split(' ')[0];
        }
      });
    }
  }

  String? groupValue;
  void handleRadioValueChanged(String? value) {
    setState(() {
      groupValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: double.maxFinite,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10).copyWith(top: 30),
            child: SizedBox(
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _startDateController,
                      onTap: () => _selectDate(context, true),
                      decoration: const InputDecoration(
                        hintText: 'Start Date',
                        hintStyle: TextStyle(color: blue),
                        suffixIcon: Icon(Icons.calendar_month_outlined),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: TextField(
                      controller: _endDateController,
                      onTap: () => _selectDate(context, false),
                      decoration: const InputDecoration(
                        hintText: 'End Date',
                        hintStyle: TextStyle(color: blue),
                        suffixIcon: Icon(Icons.calendar_month_outlined),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Radio(
                  value: 'yesterday',
                  groupValue: groupValue,
                  onChanged: handleRadioValueChanged,
                ),
                const Text('Yesterday'),
                Radio(
                  value: 'today',
                  groupValue: groupValue,
                  onChanged: handleRadioValueChanged,
                ),
                const Text('Today'),
                Radio(
                  focusColor: grey,
                  value: 'monthToDate',
                  groupValue: groupValue,
                  onChanged: handleRadioValueChanged,
                ),
                const Text('Month to Date'),
                const SizedBox(
                  width: 15,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Advance Filter",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontSize: 18,
                  color: blue,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(
                width: 15,
              ),
            ],
          ),
          const Expanded(child: SizedBox()),
          const Padding(
            padding: EdgeInsets.all(15),
            child: Text.rich(
                textAlign: TextAlign.start,
                TextSpan(
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                    ),
                    text: "Note: ",
                    children: [
                      TextSpan(
                          text:
                              "Note: For the statement period before 1st January 2012, please contact our customer care 1800 1080 or write an E-mail to customer.care@icicibank.com",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                          ))
                    ])),
          ),
        ],
      ),
    );
  }
}

class TransactionList extends StatelessWidget {
  const TransactionList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.maxFinite,
      width: double.maxFinite,
      child: SingleChildScrollView(
        child: Column(
          children: List.generate(
              transactions.length,
              (index) => Card(
                    color: Colors.white,
                    margin: const EdgeInsets.all(0).copyWith(bottom: 1),
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0)),
                    child: ListTile(
                      title: Text(
                        formatDate(transactions[index].transactionDate),
                        style: const TextStyle(color: blue, fontSize: 18),
                      ),
                      subtitle: Text(
                        transactions[index].referenceId,
                        style: const TextStyle(color: grey),
                      ),
                      trailing: Text(
                        transactions[index].debitCredit == "Debit"
                            ? "₹${transactions[index].transactionAmount} Cr"
                            : "₹${transactions[index].transactionAmount} Dr",
                        style: TextStyle(
                            fontSize: 20,
                            color: transactions[index].debitCredit == "Debit"
                                ? Colors.green
                                : Colors.red),
                      ),
                    ),
                  )),
        ),
      ),
    );
  }
}

final tr = Transaction(
    debitCredit: "Credit",
    referenceId: "INF/NEFT/034249729871/UTIB0004400/BJInfraVJA",
    transactionAmount: 17006,
    transactionDate: DateTime.now());

class Transaction {
  final DateTime transactionDate;
  final double transactionAmount;
  final String debitCredit;
  final String referenceId;

  Transaction({
    required this.transactionDate,
    required this.transactionAmount,
    required this.debitCredit,
    required this.referenceId,
  });
}

String formatDate(DateTime date) {
  final formatter = DateFormat('dd-MMM-yyyy');
  return formatter.format(date);
}

List<Transaction> transactions = [
  Transaction(
    debitCredit: "Credit",
    referenceId: "MMT/IMPS/315222468376/JCSHUB/SWATHI/IDIB000G113",
    transactionAmount: 2067,
    transactionDate: DateTime(2023, 12, 26, 14, 41, 20),
  ),
  Transaction(
    debitCredit: "Credit",
    referenceId: "MMT/IMPS/315222468376/JCSHUB/SWATHI/IDIB000G113",
    transactionAmount: 10657,
    transactionDate: DateTime(2023, 12, 23, 14, 41, 20),
  ),
  Transaction(
    debitCredit: "Credit",
    referenceId: "MMT/IMPS/315222468376/JCSHUB/SWATHI/IDIB000G113",
    transactionAmount: 157900,
    transactionDate: DateTime(2023, 12, 20, 14, 41, 20),
  ),
  Transaction(
    debitCredit: "Debit",
    referenceId:
        "BIL/INFT/ICI20686586/DIGITALPROJECTINVOICE/ JAGADEESH CHALLA-1673316893789",
    transactionAmount: 32905000.00,
    transactionDate: DateTime(2023, 12, 16, 14, 41, 20),
  ),
  Transaction(
    debitCredit: "Credit",
    referenceId: "INF/INFT/034617703011/Jagadeesh",
    transactionAmount: 150000,
    transactionDate: DateTime(2023, 12, 7, 14, 41, 20),
  ),
  Transaction(
    debitCredit: "Credit",
    referenceId: "IMPS Chg Mar-23+GST",
    transactionAmount: 62.69,
    transactionDate: DateTime(2023, 12, 4, 14, 41, 20),
  ),
  Transaction(
    debitCredit: "Debit",
    referenceId:
        "NEFT-SBIN123334774145-ITDTAX REFUND 2023-24 AAECJ2260N-/ATTN//INB-00000033273316893-SBIN0000TBU",
    transactionAmount: 158570,
    transactionDate: DateTime(2023, 11, 30, 14, 41, 20),
  ),
  Transaction(
    debitCredit: "Credit",
    referenceId: "NMQAB Chg Sep-23+GST",
    transactionAmount: 0.01,
    transactionDate: DateTime(2023, 11, 16, 14, 41, 20),
  ),
  Transaction(
    debitCredit: "Credit",
    referenceId: "NMQAB Chg Sep-23+GST",
    transactionAmount: 519.11,
    transactionDate: DateTime(2023, 11, 15, 14, 41, 20),
  ),
  Transaction(
    debitCredit: "Credit",
    referenceId: "Dbt card Chg Sep-23+GST",
    transactionAmount: 295,
    transactionDate: DateTime(2023, 11, 9, 14, 41, 20),
  ),
  Transaction(
    debitCredit: "Credit",
    referenceId: "Mob alrt Chg Sep-23+GST",
    transactionAmount: 29.5,
    transactionDate: DateTime(2023, 11, 9, 14, 41, 20),
  ),
  Transaction(
    debitCredit: "Credit",
    referenceId: "RTGS-500646448638/SUNOTAL-INVESTMENT",
    transactionAmount: 32580000,
    transactionDate: DateTime(2023, 11, 9, 14, 41, 20),
  ),
  Transaction(
    debitCredit: "Debit",
    referenceId: "NEFT-UTIB0002763-AFFLUENT-JCSHUBINVOICE",
    transactionAmount: 186000,
    transactionDate: DateTime(2023, 11, 4, 14, 41, 20),
  ),
  Transaction(
    debitCredit: "Debit",
    referenceId: "NEFTAXOIC33085825158-JINFRA-91602007306296",
    transactionAmount: 20000,
    transactionDate: DateTime(2023, 11, 4, 14, 41, 20),
  ),
  Transaction(
    debitCredit: "Credit",
    referenceId: "INF/NEFT/034249729871/UTIB0004400/BJInfraVJA",
    transactionAmount: 17006,
    transactionDate: DateTime(2023, 11, 4, 14, 41, 20),
  ),
];
