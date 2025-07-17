import 'package:fashion/features/check_out/domain/entities/address_entity.dart';
import 'package:fashion/features/check_out/presentation/views/widgets/address_text_fieild.dart';
import 'package:flutter/material.dart';

class AddressViewBody extends StatelessWidget {
  const AddressViewBody({super.key, required this.address});
  final ValueNotifier<AddressEntity?> address;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width * 0.45;

    return SingleChildScrollView(
      child: AddressTextFieild(address: address, width: width),
    );
  }
}
