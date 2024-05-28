import 'package:flutter/material.dart';

import '../features/home/home_screen.dart';

class PaymentFailed extends StatefulWidget {
  const PaymentFailed({super.key});

  @override
  State<PaymentFailed> createState() => _PaymentProcessScreenState();
}

class _PaymentProcessScreenState extends State<PaymentFailed>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _iconAnimation;
  late Animation<double> _textAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    // Create icon animation with multiple steps
    _iconAnimation = TweenSequence<double>([
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 0, end: 1)
            .chain(CurveTween(curve: const Interval(0, 0.5))),
        weight: 1,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 1, end: 1),
        weight: 2,
      ),
    ]).animate(_animationController);

    // Create text animation with multiple steps
    _textAnimation = TweenSequence<double>([
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 0, end: 1)
            .chain(CurveTween(curve: const Interval(0, 0.5))),
        weight: 1,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 1, end: 1),
        weight: 2,
      ),
    ]).animate(_animationController);

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HomeScreen()));
          },
        ),
        title: const Text('CTTNHH HDV'),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Opacity(
                  opacity: _iconAnimation.value,
                  child: const Icon(
                    Icons.dangerous_outlined,
                    size: 100,
                    color: Colors.red,
                  ),
                ),
                Opacity(
                  opacity: _textAnimation.value,
                  child: const Text(
                    'Thanh toán thất bại!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const HomeScreen(), // Chuyển đến màn hình xử lý thanh toán
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.teal, // Thiết lập màu nền là màu xanh nước biển
                  ),
                  child: const Text(
                    'Vui lòng đặt lại!',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
