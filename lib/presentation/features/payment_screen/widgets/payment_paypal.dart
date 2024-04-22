import 'package:flutter/material.dart';

class PaymentPapal extends StatefulWidget {
  const PaymentPapal({super.key});

  @override
  State<PaymentPapal> createState() => _PaymentPapalState();
}

class _PaymentPapalState extends State<PaymentPapal> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 150,
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
              'assets/images/paypalll.jpg',
              width: 50,
              height: 50,
            ),
            const SizedBox(width: 10),
            const Text(
              'Thanh Toán Qua Paypal',
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
