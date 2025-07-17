import 'package:fashion/features/check_out/domain/entities/address_entity.dart';
import 'package:fashion/features/check_out/presentation/views/widgets/address_view_body.dart';
import 'package:flutter/material.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key, required this.address});
  static const routeName = '/address';
  final ValueNotifier<AddressEntity?> address;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: AddressViewBody(address: address));
  }
}
