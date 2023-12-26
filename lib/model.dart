import 'package:intl/intl.dart';

class ButtonModel {
  String name;
  String image;

  ButtonModel({required this.name, required this.image});
}

List<ButtonModel> buttons = [
  ButtonModel(name: "Fund Transfer", image: "assets/1.png"),
  ButtonModel(name: "Account & Deposits", image: "assets/2.png"),
  ButtonModel(name: "Offers", image: "assets/3.png"),
  ButtonModel(name: "UPI", image: "assets/4.png"),
  ButtonModel(name: "Bill Payments", image: "assets/5.png"),
  ButtonModel(name: "Pre-approved Loans", image: "assets/6.png"),
  ButtonModel(name: "Account Services", image: "assets/7.png"),
  ButtonModel(name: "All Services", image: "assets/8.png"),
];

List<ButtonModel> lockuttons = [
  ButtonModel(name: "What's New", image: "assets/l1.png"),
  ButtonModel(name: "iSafe OTP", image: "assets/l2.png"),
  ButtonModel(name: "Transactions@Branch", image: "assets/l3.png"),
  ButtonModel(name: "PFMS Enquiries", image: "assets/l4.png"),
  ButtonModel(name: "DSB Service", image: "assets/l5.png"),
  ButtonModel(name: "Find Us Here", image: "assets/l6.png"),
  ButtonModel(name: "Account Opening QR", image: "assets/l7.png"),
  ButtonModel(name: "FAQs", image: "assets/l8.png"),
];

class RecentTrasaction {
  final String name;
  final double amoun;
  final String imageLink;
  final DateTime date;
  final String referenceId;

  const RecentTrasaction({
    required this.amoun,
    required this.date,
    required this.imageLink,
    required this.name,
    required this.referenceId,
  });
}

List recentTransactions = <RecentTrasaction>[
  RecentTrasaction(
      amoun: 2067,
      date: DateTime(2023, 12, 26, 14, 41, 20),
      imageLink: "assets/idib.png",
      name: "Swathi",
      referenceId: "108724562874"),
  RecentTrasaction(
      amoun: 10657,
      date: DateTime(2023, 12, 23, 14, 41, 20),
      imageLink: "assets/idib.png",
      name: "Swathi",
      referenceId: "183560364509"),
  RecentTrasaction(
      amoun: 157900,
      date: DateTime(2023, 12, 20, 14, 41, 20),
      imageLink: "assets/idib.png",
      name: "Swathi",
      referenceId: "193752097356"),
];

String formatDateTime(DateTime dt) {
  // Formatting using intl package
  String formattedDate = DateFormat('dd-MM-yyyy').format(dt);
  return formattedDate;
}

String formatDateTimeToNow(DateTime dt) {
  // Formatting using intl package
  String formattedDate = DateFormat('dd-MMM-yyyy, hh:mma').format(dt);
  return formattedDate;
}
