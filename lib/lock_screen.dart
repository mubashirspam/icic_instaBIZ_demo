import 'package:bank/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:bank/model.dart';

import 'home.dart';

class LockScreen extends StatefulWidget {
  const LockScreen({super.key});

  @override
  State<LockScreen> createState() => _LockScreenState();
}

class _LockScreenState extends State<LockScreen> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Image.asset(
                "assets/pattern.png",
                height: 200,
              ),
            ),
            const Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.only(top: 40, right: 20),
                child: Text("App Version 11.3"),
              ),
            ),
            SafeArea(
              child: SizedBox(
                width: double.maxFinite,
                height: double.maxFinite,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: Image.asset(
                              "assets/logoo.png",
                              width: MediaQuery.of(context).size.width * 0.4,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: ColoredBox(
                              color: grey.withOpacity(0.5),
                              child: SizedBox(
                                height: 55,
                                width: 1,
                              ),
                            ),
                          ),
                          Image.asset(
                            "assets/biz.png",
                            width: 60,
                          ),
                        ],
                      )),
                      LockWidget(
                        isSelected: isSelected,
                        onpress: () => setState(() => isSelected = !isSelected),
                      ),
                      Container(
                        padding: const EdgeInsets.all(20),
                        margin: const EdgeInsets.all(20)
                            .copyWith(top: 0, bottom: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              width: 1,
                              color: Colors.grey.shade300,
                            ),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade300.withOpacity(0.3),
                                  blurRadius: 10),
                            ]),
                        child: const Text(
                          "Now you can buy Sovereign Gold Bonds on InstaBIZ! Active Tranche: 16 Dec to 22nd Dec. For more details, visit Invest and Insure.",
                          style: TextStyle(fontSize: 14),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const Text(
                        "Product at your fingertips",
                        style: TextStyle(
                          color: blue,
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15).copyWith(right: 0),
                        child: Row(
                          children: List.generate(
                            4,
                            (index) => LockButtons(
                              name: lockuttons[index].name,
                              icon: lockuttons[index].image,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.all(15).copyWith(top: 0, right: 0),
                        child: Row(
                          children: List.generate(
                            4,
                            (index) => LockButtons(
                              name: lockuttons[index + 4].name,
                              icon: lockuttons[index + 4].image,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class LockButtons extends StatelessWidget {
  final String name;
  final String icon;
  const LockButtons({super.key, required this.name, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        margin: const EdgeInsets.only(right: 15),
        height: 110,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              width: 1,
              color: Colors.grey.shade300,
            ),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade300.withOpacity(0.3), blurRadius: 10),
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              icon,
              height: 45,
            ),
            Text(
              name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: grey,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LockWidget extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onpress;
  const LockWidget({
    super.key,
    required this.isSelected,
    required this.onpress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: const EdgeInsets.all(30),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color(0xffF0F3F8)),
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          const Text(
            "Enter 4 digit login PIN",
            style: TextStyle(
              color: blue,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 15),
          OtpFiled(
            isSelected: isSelected,
          ),
          const SizedBox(height: 5),
          const Text(
            "Login with Fingerprint ID/Face ID",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.normal,
            ),
          ),
          const SizedBox(height: 15),
          const Text(
            "Forgot MPIN?",
            style: TextStyle(
              decoration: TextDecoration.underline,
              fontSize: 18,
              color: blue,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: onpress,
                child: Icon(
                  isSelected
                      ? Icons.check_box_outlined
                      : Icons.check_box_outline_blank,
                  color: orage,
                  size: 30,
                ),
              ),
              Expanded(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    text: 'I have read, understood & accepted the ',
                    style: TextStyle(
                      color: blue,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Terms and Conditions',
                        style: TextStyle(color: orage),
                      ),
                      TextSpan(
                        text: ', ',
                      ),
                      TextSpan(
                        text: 'Safety Tips',
                        style: TextStyle(color: orage),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class OtpFiled extends StatefulWidget {
  final bool isSelected;

  const OtpFiled({super.key, required this.isSelected});

  @override
  State<OtpFiled> createState() => _OtpFiledState();
}

class _OtpFiledState extends State<OtpFiled> {
  List<FocusNode> focusNodes = List.generate(4, (index) => FocusNode());
  List<TextEditingController> controllers =
      List.generate(4, (index) => TextEditingController());

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    for (var focusNode in focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  void _onTextChanged(int index, String newText) {
    if (newText.isNotEmpty) {
      if (index < 3) {
        FocusScope.of(context).requestFocus(focusNodes[index + 1]);
      } else {}
    } else {
      if (index > 0) {
        controllers[index].clear();
        FocusScope.of(context).requestFocus(focusNodes[index - 1]);
      }
    }
  }

  bool areAllFieldsFilledWithZero() {
    return controllers.every((controller) => controller.text != "");
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        4,
        (index) => Expanded(
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: TextFormField(
              controller: controllers[index],
              onChanged: (newText) {
                _onTextChanged(index, newText);

                if (areAllFieldsFilledWithZero() && widget.isSelected) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ),
                  );
                }
              },
              focusNode: focusNodes[index],
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp("[0-9 ]")),
                LengthLimitingTextInputFormatter(1),
              ],
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: Colors.grey.shade400,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: Colors.grey.shade400,
                  ),
                ),
              ),
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
