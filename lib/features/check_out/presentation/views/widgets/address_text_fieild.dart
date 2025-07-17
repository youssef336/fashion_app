import 'package:fashion/core/widgets/custom_app_bar.dart';
import 'package:fashion/core/widgets/custom_text_feild.dart';
import 'package:fashion/features/check_out/domain/entities/address_entity.dart';
import 'package:fashion/features/check_out/presentation/views/widgets/check_out_buttom.dart';
import 'package:fashion/features/check_out/presentation/views/widgets/header.dart';
import 'package:flutter/material.dart';

class AddressTextFieild extends StatefulWidget {
  const AddressTextFieild({
    super.key,
    required this.width,
    required this.address,
  });

  final double width;
  final ValueNotifier<AddressEntity?> address;
  @override
  State<AddressTextFieild> createState() => _AddressTextFieildState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

class _AddressTextFieildState extends State<AddressTextFieild> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: _autovalidateMode,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                CustomAppBar(isblack: false),
                const SizedBox(height: 34),
                const Header(text: "Add shipping adress"),
                const SizedBox(height: 20),
                Row(
                  children: [
                    SizedBox(
                      width: widget.width,
                      child: CustomTextFormFeild(
                        hintText: "First name",
                        textInputType: TextInputType.name,
                        onSaved: (p0) {
                          widget.address.value?.firstName = p0;
                        },
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: widget.width,
                      child: CustomTextFormFeild(
                        hintText: "Last name",
                        textInputType: TextInputType.name,
                        onSaved: (p0) {
                          widget.address.value?.lastName = p0;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                CustomTextFormFeild(
                  maxLines: 1,
                  textInputType: TextInputType.streetAddress,
                  hintText: "Address",
                  onSaved: (p0) {
                    widget.address.value?.address = p0;
                  },
                ),
                const SizedBox(height: 20),
                CustomTextFormFeild(
                  maxLines: 1,
                  textInputType: TextInputType.streetAddress,
                  hintText: "City",
                  onSaved: (p0) {
                    widget.address.value?.city = p0;
                  },
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    SizedBox(
                      width: widget.width,
                      child: CustomTextFormFeild(
                        maxLines: 1,
                        textInputType: TextInputType.streetAddress,
                        hintText: "State",
                        onSaved: (p0) {
                          widget.address.value?.state = p0;
                        },
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: widget.width,
                      child: CustomTextFormFeild(
                        maxLines: 1,
                        textInputType: TextInputType.streetAddress,
                        hintText: "Zip code",
                        onSaved: (p0) {
                          widget.address.value?.zipCode = p0;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                CustomTextFormFeild(
                  maxLines: 1,
                  textInputType: TextInputType.phone,
                  hintText: "Phone number",
                  onSaved: (p0) {
                    widget.address.value?.phone = p0;
                  },
                ),
              ],
            ),
          ),

          SizedBox(height: MediaQuery.of(context).size.height * 0.39),
          CheckOutButtom(
            text: "add now",
            onTap: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                widget.address.value = widget.address.value!.copyWith(
                  firstName: widget.address.value?.firstName,
                  lastName: widget.address.value?.lastName,
                  address: widget.address.value?.address,
                  city: widget.address.value?.city,
                  zipCode: widget.address.value?.zipCode,
                  phone: widget.address.value?.phone,
                );

                Navigator.pop(context);
              } else {
                setState(() {
                  _autovalidateMode = AutovalidateMode.always;
                });
              }
            },
          ),
        ],
      ),
    );
  }
}
