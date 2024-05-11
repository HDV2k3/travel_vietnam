import 'package:flutter/material.dart';

class SelectedPaymentMethod extends StatefulWidget {
  const SelectedPaymentMethod({super.key});

  @override
  State<SelectedPaymentMethod> createState() => _SelectedPaymentMethodState();
}

class _SelectedPaymentMethodState extends State<SelectedPaymentMethod> {
  int type = 1;
  void handRadio(Object? e) => setState(() {
        type = e as int;
      });
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: Column(
          children: [
            Container(
              width: size.width,
              height: 55,
              decoration: BoxDecoration(
                  border: type == 1
                      ? Border.all(width: 1, color: Colors.black)
                      : Border.all(width: 0.3, color: Colors.grey),
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.transparent),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Radio(
                            value: 1,
                            groupValue: type,
                            onChanged: handRadio,
                            activeColor: Colors.blue,
                          ),
                          Text(
                            'Amazon Pay ',
                            style: type == 1
                                ? const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  )
                                : const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey,
                                  ),
                          ),
                        ],
                      ),
                      Image.asset(
                        'assets/images/amazon.png',
                        width: 200,
                        height: 70,
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: size.width,
              height: 55,
              decoration: BoxDecoration(
                  border: type == 2
                      ? Border.all(width: 1, color: Colors.black)
                      : Border.all(width: 0.3, color: Colors.grey),
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.transparent),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Radio(
                            value: 2,
                            groupValue: type,
                            onChanged: handRadio,
                            activeColor: Colors.blue,
                          ),
                          Text(
                            'Paypal ',
                            style: type == 2
                                ? const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  )
                                : const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey,
                                  ),
                          ),
                        ],
                      ),
                      Image.asset(
                        'assets/images/paypal.jpg',
                        width: 200,
                        height: 70,
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: size.width,
              height: 55,
              decoration: BoxDecoration(
                  border: type == 3
                      ? Border.all(width: 1, color: Colors.black)
                      : Border.all(width: 0.3, color: Colors.grey),
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.transparent),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Radio(
                            value: 3,
                            groupValue: type,
                            onChanged: handRadio,
                            activeColor: Colors.blue,
                          ),
                          Text(
                            'Google Pay ',
                            style: type == 3
                                ? const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  )
                                : const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey,
                                  ),
                          ),
                        ],
                      ),
                      Image.asset(
                        'assets/images/ggpay.png',
                        width: 200,
                        height: 50,
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: size.width,
              height: 55,
              decoration: BoxDecoration(
                  border: type == 4
                      ? Border.all(width: 1, color: Colors.black)
                      : Border.all(width: 0.3, color: Colors.grey),
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.transparent),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Radio(
                            value: 4,
                            groupValue: type,
                            onChanged: handRadio,
                            activeColor: Colors.blue,
                          ),
                          Text(
                            'Credit Cart ',
                            style: type == 4
                                ? const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  )
                                : const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey,
                                  ),
                          ),
                        ],
                      ),
                      Image.asset(
                        'assets/images/creditcard.jpg',
                        width: 200,
                        height: 70,
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
