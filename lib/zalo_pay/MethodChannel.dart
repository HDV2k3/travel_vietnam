import 'package:flutter/services.dart';

class ZaloPay {
  static const MethodChannel _channel = MethodChannel('zalopay');

  static Future<String> pay(String orderId) async {
    try {
      final String result =
          await _channel.invokeMethod('pay', {'order_id': orderId});
      return result;
    } on PlatformException catch (e) {
      return "Failed to initiate payment: '${e.message}'.";
    }
  }
}
