import 'package:fashion/features/check_out/presentation/views/widgets/address_view_body.dart';
import 'package:flutter/material.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});
  static const routeName = '/address';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: AddressViewBody());
  }
}
