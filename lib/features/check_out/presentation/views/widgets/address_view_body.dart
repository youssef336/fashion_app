import 'package:fashion/core/widgets/custom_app_bar.dart';
import 'package:fashion/core/widgets/custom_text_feild.dart';
import 'package:fashion/features/check_out/presentation/views/widgets/check_out_buttom.dart';
import 'package:fashion/features/check_out/presentation/views/widgets/header.dart';
import 'package:flutter/material.dart';

class AddressViewBody extends StatelessWidget {
  const AddressViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width * 0.45;
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.872,
          child: Padding(
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
                      width: width,
                      child: const CustomTextFormFeild(
                        hintText: "First name",
                        textInputType: TextInputType.name,
                      ),
                    ),
                    const Spacer(),

                    SizedBox(
                      width: width,
                      child: const CustomTextFormFeild(
                        hintText: "Last name",
                        textInputType: TextInputType.name,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const CustomTextFormFeild(
                  maxLines: 1,
                  textInputType: TextInputType.streetAddress,
                  hintText: "Address",
                ),
                const SizedBox(height: 20),
                const CustomTextFormFeild(
                  maxLines: 1,
                  textInputType: TextInputType.streetAddress,
                  hintText: "City",
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    SizedBox(
                      width: width,
                      child: const CustomTextFormFeild(
                        maxLines: 1,
                        textInputType: TextInputType.streetAddress,
                        hintText: "State",
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: width,
                      child: const CustomTextFormFeild(
                        maxLines: 1,
                        textInputType: TextInputType.streetAddress,
                        hintText: "Zip code",
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const CustomTextFormFeild(
                  maxLines: 1,
                  textInputType: TextInputType.phone,
                  hintText: "Phone number",
                ),
              ],
            ),
          ),
        ),
        const Spacer(),

        const SizedBox(height: 10),
        CheckOutButtom(text: "add now", onTap: () {}),
      ],
    );
  }
}
