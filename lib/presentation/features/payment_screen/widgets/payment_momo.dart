import 'package:flutter/material.dart';

class PaymentMomo extends StatefulWidget {
  const PaymentMomo({super.key});

  @override
  State<PaymentMomo> createState() => _PaymentMomoState();
}

class _PaymentMomoState extends State<PaymentMomo> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 20,
      left: 30,
      child: Container(
        width: 350,
        height: 100,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/MoMo_Logo.png',
              width: 50,
              height: 50,
            ),
            const SizedBox(width: 10),
            const Text(
              'Thanh Toán Qua Momo',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 40),
            InkWell(
              onTap: () {
                setState(() {
                  isChecked = !isChecked;
                });
              },
              splashColor: Colors.blueGrey,
              customBorder: const CircleBorder(),
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 2),
                  borderRadius: BorderRadius.circular(15),
                  color: isChecked ? Colors.blue : Colors.blueGrey,
                ),
                child: isChecked
                    ? const Icon(
                        Icons.check,
                        color: Colors.white,
                      )
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
