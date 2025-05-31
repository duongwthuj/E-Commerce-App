import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:thuctapcoso/features/shop/controllers/cart_controller.dart';
import 'package:thuctapcoso/features/shop/controllers/order_controller.dart';
import 'package:thuctapcoso/navigation_menu.dart';
import 'package:thuctapcoso/utlis/constants/colors.dart';
import 'package:thuctapcoso/utlis/constants/sizes.dart';
import 'package:thuctapcoso/routes/routes.dart';
import 'package:thuctapcoso/utlis/popups/loaders.dart';
import 'dart:async';

class PaymentQRDialog extends StatefulWidget {
  final double amount;

  const PaymentQRDialog({
    Key? key,
    required this.amount,
  }) : super(key: key);

  @override
  State<PaymentQRDialog> createState() => _PaymentQRDialogState();
}

class _PaymentQRDialogState extends State<PaymentQRDialog> {
  final cartController = CartController.instance;
  final orderController = OrderController.instance;
  String _qrData = '';
  Timer? _timer;
  int _remainingSeconds = 300; // 5 minutes

  @override
  void initState() {
    super.initState();
    _updateQRData();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingSeconds > 0) {
          _remainingSeconds--;
        } else {
          timer.cancel();
          Get.back();
        }
      });
    });
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  void _updateQRData() {
    // VietQR format for MB Bank
    final bankId = "970422"; // MB Bank ID
    final accountNumber = "038419093";
    final accountName = "NGUYEN DUONG THU";
    final bankName = "MB BANK";
    final amount = widget.amount.toStringAsFixed(0);
    final timestamp = DateTime.now().millisecondsSinceEpoch.toString();

    // VietQR format
    _qrData =
        "https://api.vietqr.io/image/$bankId-$accountNumber-$amount-$timestamp";
  }

  // Handle payment success
  void _handlePaymentSuccess() async {
    try {
      // Create order using OrderController
      await orderController.createOrder(
        cartController.cartItems,
        widget.amount,
      );

      // Close dialog
      Get.back();

      // Chuyển về màn hình chính với navigation bar
      Get.offAll(() => const NavigationMenu());
    } catch (e) {
      TLoaders.errorSnackBar(
        title: 'Error',
        message: 'Failed to process payment. Please try again.',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
      ),
      child: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Title
            Text(
              'Scan QR Code to Pay',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: TSizes.spaceBtwItems),

            // QR Code
            QrImageView(
              data: _qrData,
              version: QrVersions.auto,
              size: 200.0,
              backgroundColor: Colors.white,
            ),
            const SizedBox(height: TSizes.spaceBtwItems),

            // Amount
            Text(
              'Amount: \$${widget.amount.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: TSizes.spaceBtwItems),

            // Bank Account Info
            Container(
              padding: const EdgeInsets.all(TSizes.sm),
              decoration: BoxDecoration(
                color: TColors.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(TSizes.cardRadiusSm),
              ),
              child: Column(
                children: [
                  Text('Bank: MB BANK'),
                  Text('Account: 038419093'),
                  Text('Name: NGUYEN DUONG THU'),
                ],
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),

            // Timer
            Text(
              'Time remaining: ${_formatTime(_remainingSeconds)}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: TSizes.spaceBtwItems),

            // Confirm Payment Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _handlePaymentSuccess,
                child: const Text('Confirm Payment'),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),

            // Close Button
            TextButton(
              onPressed: () => Get.back(),
              child: const Text('Close'),
            ),
          ],
        ),
      ),
    );
  }
}
