package com.example.chandoiqua;

//import io.flutter.embedding.android.FlutterActivity;
//
//public class MainActivity extends FlutterActivity {
//}
package com.yourcompany.yourapp; // Ensure this matches your package name

import android.os.Bundle;
import io.flutter.app.FlutterActivity;
import io.flutter.plugins.GeneratedPluginRegistrant;
import io.flutter.plugin.common.MethodChannel;
import com.zing.zalo.zalosdk.oauth.ZaloSDK;
import com.zing.zalo.zalosdk.payment.ZaloPaySDK;

public class MainActivity extends FlutterActivity {
    private static final String CHANNEL = "zalopay";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this);

        new MethodChannel(getFlutterView(), CHANNEL).setMethodCallHandler(
                (call, result) -> {
                    if (call.method.equals("pay")) {
                        // Implement ZaloPay payment here
                        // Example:
                        ZaloPaySDK.getInstance().payOrder(MainActivity.this, "order_id",
                                response -> {
                                    if (response.getReturnCode() == 1) {
                                        result.success("Payment Success");
                                    } else {
                                        result.error("PAYMENT_ERROR", "Payment failed", null);
                                    }
                                });
                    } else {
                        result.notImplemented();
                    }
                }
        );
    }
}
