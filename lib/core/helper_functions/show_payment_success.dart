// ignore_for_file: deprecated_member_use

import 'package:fashion/core/utils/assets.dart';
import 'package:fashion/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void showPaymentSuccess(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: Text(
        'Payment Successful!'.toUpperCase(),
        style: TextStyles.tenor_Large_14.copyWith(
          fontSize: MediaQuery.of(context).size.width * 0.044,
          color: Colors.black,
          letterSpacing: 2,
        ),
      ),

      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 25),
          SvgPicture.asset(Assets.assetsImageTrueImage),
          const SizedBox(height: 25),
          Text(
            "Your payment was success".toUpperCase(),
            style: TextStyles.tenor_Large_14.copyWith(
              fontSize: MediaQuery.of(context).size.width * 0.04,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "Payment ID 15263541".toUpperCase(),
            style: TextStyles.tenor_Large_14.copyWith(
              fontSize: 15,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 20),
          SvgPicture.asset(
            Assets.assetsImageDivider,
            color: const Color(0xff555555),
          ),
        ],
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.25,
              height: 50,
              decoration: const BoxDecoration(color: Colors.black),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Dismiss dialog
                },
                child: const Text(
                  'Submit',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Container(
              width: MediaQuery.of(context).size.width * 0.33,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.transparent, // no fill
                border: Border.all(color: Colors.grey), // grey outline
                // optional rounded corners
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop(); // Dismiss dialog
                  // Dismiss dialog
                },
                child: const Text(
                  'Back to home',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
