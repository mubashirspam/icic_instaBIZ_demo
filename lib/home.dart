import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:bank/account_details.dart';
import 'package:bank/color.dart';
import 'package:bank/transaction_page.dart';
import 'package:flutter/material.dart';

import 'fund_transfer.dart';
import 'model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _bottomNavIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const DrawerWidget(),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: deepOrage,
        actions: const [
          Icon(
            Icons.notifications_none_outlined,
            color: Colors.white,
          ),
          SizedBox(width: 10),
          Icon(
            Icons.logout_outlined,
            color: Colors.white,
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Stack(
        children: [
          SizedBox(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 270,
                    width: double.maxFinite,
                    child: Stack(
                      children: [
                        Container(
                          width: double.maxFinite,
                          height: 230,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [deepOrage, orage],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: double.maxFinite,
                          height: 270,
                          child: Column(
                            children: [
                              Card(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 30)
                                        .copyWith(bottom: 15),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                color: Colors.white,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      child: Icon(Icons.search),
                                    ),
                                    const Expanded(
                                      child: TextField(
                                        decoration: InputDecoration(
                                          hintText:
                                              "Type or speak to search InstaBIZ",
                                          enabledBorder: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                    CircleAvatar(
                                      backgroundColor: orage.withOpacity(0.2),
                                      child: const Center(
                                        child: Icon(
                                          Icons.mic_none_outlined,
                                          color: orage,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                  ],
                                ),
                              ),
                              Expanded(
                                  child: SizedBox(
                                width: double.maxFinite,
                                child: PageView.builder(
                                  itemCount: 3,
                                  itemBuilder: (context, i) {
                                    return OfferCard(
                                      image: i == 0
                                          ? null
                                          : i == 1
                                              ? "assets/s1.png"
                                              : "assets/s2.png",
                                    );
                                  },
                                  controller: PageController(
                                    viewportFraction: 0.9,
                                  ),
                                ),
                              ))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: List.generate(
                        4,
                        (index) => HomeButtons(
                              name: buttons[index].name,
                              icon: buttons[index].image,
                            )),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: List.generate(
                        4,
                        (index) => HomeButtons(
                              name: buttons[index + 4].name,
                              icon: buttons[index + 4].image,
                            )),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 130,
                    width: double.maxFinite,
                    child: PageView.builder(
                      itemCount: 3,
                      itemBuilder: (context, i) {
                        return SizedBox(
                          child: Image.asset("assets/bs$i.png"),
                        );
                      },
                      controller: PageController(
                        viewportFraction: 0.8,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: deepOrage,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        child: const Icon(
          Icons.person_outline_outlined,
          color: Colors.white,
          size: 28,
        ),
        onPressed: () {},
        //params
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        height: 80,
        itemCount: iconList.length,
        tabBuilder: (int index, bool isActive) {
          final color = isActive ? orage : grey;
          return SizedBox(
            height: 80,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  iconList[index],
                  height: 30,
                ),
                const SizedBox(height: 4),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 1),
                  child: Text(
                    textList[index],
                    maxLines: 2,
                    style: TextStyle(color: color),
                  ),
                )
              ],
            ),
          );
        },
        backgroundColor: Colors.white,
        activeIndex: _bottomNavIndex,
        splashSpeedInMilliseconds: 300,
        notchSmoothness: NotchSmoothness.smoothEdge,
        gapLocation: GapLocation.center,
        onTap: (index) => setState(() => _bottomNavIndex = index),
        shadow: BoxShadow(
          offset: const Offset(0, 1),
          blurRadius: 12,
          spreadRadius: 0.5,
          color: Colors.grey.shade400,
        ),
      ),
    );
  }
}

class HomeButtons extends StatelessWidget {
  final String name;
  final String icon;
  final VoidCallback? ontap;
  const HomeButtons(
      {super.key, required this.name, required this.icon, this.ontap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SizedBox(
      height: 130,
      child: Column(
        children: [
          InkWell(
            onTap: name == "Fund Transfer"
                ? () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const FundTransferScreen(),
                    ))
                : () {},
            child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 30, color: Colors.black12.withOpacity(0.1))
                  ]),
              child: Center(
                  child: Image.asset(
                icon,
                height: 40,
              )),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            name,
            textAlign: TextAlign.center,
          )
        ],
      ),
    ));
  }
}

class OfferCard extends StatelessWidget {
  final String? image;
  const OfferCard({super.key, this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
              image: AssetImage(
            image ?? "assets/logo.png",
          )),
          color: blue,
        ),
        margin: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: image != null
            ? const SizedBox()
            : Column(
                children: [
                  const SizedBox(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                            child: SizedBox(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Current Account",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "630605123554",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        )),
                        Expanded(
                            child: SizedBox(
                          child: Text(
                            "JCSHub Enterprises (OPC) Private Limited",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        )),
                      ],
                    ),
                  ),
                  const SizedBox(height: 7),
                  const SizedBox(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "₹ 5,00,27000.00",
                          style: TextStyle(color: Colors.white, fontSize: 26),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.refresh,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 7),
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                        width: 2,
                        color: Colors.white,
                      ),
                    ),
                    child: const Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "View UPI ID",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 17,
                          color: Colors.white,
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 17,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                            width: 2,
                            color: Colors.white,
                          ),
                        ),
                        child: GestureDetector(
                          onTap: () =>
                              Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const TransactionPage(),
                          )),
                          child: const Text(
                            "Statement",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                            width: 2,
                            color: Colors.white,
                          ),
                        ),
                        child: GestureDetector(
                          onTap: () =>
                              Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const AccountDetailsPage(),
                          )),
                          child: const Text(
                            "Account Details",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ));
  }
}

final iconList = <String>[
  "assets/b1.png",
  "assets/b2.png",
  "assets/b3.png",
  "assets/b4.png",
];

final textList = <String>[
  "Fastag",
  "pay Gst",
  "Scan any\n UPI QR",
  "Personal \n Banking",
];

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          Container(
            width: double.maxFinite,
            height: 250,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [deepOrage, orage],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              children: [
                const SafeArea(
                  bottom: false,
                  child: SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.home_outlined,
                          color: Colors.white,
                        ),
                        SizedBox(width: 15)
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 100,
                  height: 100,
                  child: Stack(
                    children: [
                      const Center(
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage("assets/img.jpeg"),
                        ),
                      ),
                      Positioned(
                        bottom: 2,
                        right: 2,
                        child: Image.asset(
                          "assets/camera.png",
                          width: 25,
                        ),
                      ),
                    ],
                  ),
                ),
                const Text(
                  "CHALLA",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      child: Column(children: [
                        Text(
                          "Corporate ID",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "569942378",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        )
                      ]),
                    ),
                    SizedBox(
                      child: Column(children: [
                        Text(
                          "User ID",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "CHALLAJA",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        )
                      ]),
                    )
                  ],
                )
              ],
            ),
          ),
          Image.asset("assets/profile.png"),
          SizedBox(
            width: double.maxFinite,
            child: ColoredBox(
              color: Colors.white,
              child: Center(
                child: Text(
                  "Last Login : ${formatDateTimeToNow(DateTime.now())}",
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ColoredBox(
              color: Colors.white,
              child: SizedBox(
                width: double.maxFinite,
                child: ListView(
                  padding: const EdgeInsets.only(top: 10, left: 15),
                  children: List.generate(
                    list.length,
                    (i) => SizedBox(
                      height: 70,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ListTile(
                            leading: Image.asset(
                              "assets/p$i.png",
                              width: 35,
                            ),
                            title: Text(
                              list[i],
                              style: const TextStyle(color: blue, fontSize: 18),
                            ),
                          ),
                          const ColoredBox(
                              color: Colors.grey,
                              child: SizedBox(
                                width: double.maxFinite,
                                height: 1,
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            color: Colors.white,
            height: 60,
            child: Row(
              children: [
                const SizedBox(width: 15),
                Image.asset(
                  "assets/p8.png",
                  width: 40,
                ),
                const SizedBox(width: 15),
                const Text(
                  "Logout",
                  style: TextStyle(color: blue, fontSize: 18),
                ),
                const SizedBox(width: 10),
                ColoredBox(
                  color: Colors.grey.shade300,
                  child: const SizedBox(
                    width: 3,
                    height: 35,
                  ),
                ),
                const Spacer(),
                const Text(
                  "App Version: 11.3",
                  style: TextStyle(color: grey, fontSize: 12),
                ),
                const SizedBox(width: 15),
              ],
            ),
          ),
          const SafeArea(
            top: false,
            child: ColoredBox(
              color: Colors.grey,
              child: SizedBox(
                width: double.maxFinite,
                height: 1,
              ),
            ),
          )
        ],
      ),
    );
  }
}

List list = <String>[
  "My Profile",
  "Change your Login ID",
  "Referral Program",
  "Settings",
  "Rate Us",
  "FAQS",
  "iSafe",
  "Contact"
];
