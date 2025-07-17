import 'package:fashion/core/utils/text_styles.dart';
import 'package:fashion/features/check_out/domain/entities/address_entity.dart';
import 'package:fashion/features/check_out/presentation/views/address_view.dart';
import 'package:fashion/features/check_out/presentation/views/payment_view.dart';
import 'package:fashion/features/check_out/presentation/views/widgets/check_out_secound_phase_item.dart';
import 'package:flutter/material.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({super.key});

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  ValueNotifier<AddressEntity?> addressNotifier = ValueNotifier<AddressEntity?>(
    AddressEntity(),
  );

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<AddressEntity?>(
      valueListenable: addressNotifier,
      builder: (context, address, _) {
        return address == null || (address.address?.isEmpty ?? true)
            ? CheckOutSecoundPhaseItem(
                title: "Payment method",
                SubTitle: "Visa payment method",
                onTap: () {
                  Navigator.pushNamed(context, PaymentView.routeName);
                },
              )
            : SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Shipping adress".toUpperCase(),
                      style: TextStyles.price_Large_18.copyWith(
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${address.firstName ?? ''} ${address.lastName ?? ''}",
                                style: TextStyles.price_Large_18.copyWith(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                "${address.address ?? ''} ${address.city ?? ''} ",
                                style: TextStyles.price_Large_18.copyWith(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                "${address.zipCode ?? ''} ${address.state ?? ''}",
                                style: TextStyles.price_Large_18.copyWith(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                "${address.phone ?? ''} ",
                                style: TextStyles.price_Large_18.copyWith(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                AddressView.routeName,
                                arguments: addressNotifier,
                              );
                            },
                            icon: const Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
      },
    );
  }
}
