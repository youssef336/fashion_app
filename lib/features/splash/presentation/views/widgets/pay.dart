import 'package:flutter/material.dart';

class Pay extends StatelessWidget {
  const Pay({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Pay the money',
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
        ],
      ),
    );
  }
}
