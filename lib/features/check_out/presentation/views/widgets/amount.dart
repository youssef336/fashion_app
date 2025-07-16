import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class amount extends StatefulWidget {
  const amount({super.key, required this.counter});
  final ValueNotifier<int> counter;

  @override
  State<amount> createState() => _amountState();
}

class _amountState extends State<amount> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => setState(() {
            if (widget.counter.value > 1) {
              widget.counter.value--;
            } else {
              widget.counter.value = 1;
            }
          }),
          child: const CircleAvatar(
            radius: 14,
            backgroundColor: Color.fromARGB(255, 167, 166, 166),
            child: CircleAvatar(
              radius: 13,
              backgroundColor: Color(0xffF7F0F8),
              child: Icon(Icons.remove, color: Colors.black54, size: 25),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          widget.counter.value.toString(),
          style: TextStyles.title_Medium_24,
        ),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: () => setState(() => widget.counter.value++),
          child: const CircleAvatar(
            radius: 14,
            backgroundColor: Color.fromARGB(255, 167, 166, 166),
            child: CircleAvatar(
              radius: 13,
              backgroundColor: Color(0xffF7F0F8),
              child: Icon(Icons.add, color: Colors.black54, size: 25),
            ),
          ),
        ),
      ],
    );
  }
}
