import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class RazorPay extends StatefulWidget {
  const RazorPay({super.key, required this.title});

  final String title;

  @override
  State<RazorPay> createState() => _RazorPayState();
}

class _RazorPayState extends State<RazorPay> {
  Razorpay razorPay = Razorpay();
  
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    razorPay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    razorPay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);

    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the RazorPay object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: OutlinedButton(
              onPressed: () {
                var options = {
                  'key': 'rzp_test_GcZZFDPP0jHtC4',
                  'amount': 650000,
                  'name': 'Learn and Build',
                  'description': 'Fine T-Shirt',
                  'prefill': {
                    'contact': '8888888888',
                    'email': 'test@razorpay.com'
                  }
                };

                razorPay.open(options);
              },
              child: const Text('PAY AMOUNT:6500 Rs'))),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
    Fluttertoast.showToast(msg: "Payment Success");
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    Fluttertoast.showToast(msg: "Payment Failure");
  }

  @override
  void dispose() {
    
    super.dispose();

    try {
      razorPay.clear();
    } catch (e) {
      print(e);
    }
  }
}
