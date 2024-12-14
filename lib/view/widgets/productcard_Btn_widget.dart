import 'package:bill_manager_jmd_task/core/constents/page_txt_contents.dart';
import 'package:bill_manager_jmd_task/core/theme/extension/app_theme_extension.dart';
import 'package:flutter/material.dart';

class ProductCardBtnWidget extends StatelessWidget {
  const ProductCardBtnWidget(
      {super.key, required this.constants, required this.text, this.color});
  final String text;
  final Color? color;

  final GenerateInvoicePage constants;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.spaces.space_200 * 2,
      // width: context.spaces.space_200*,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          minimumSize: Size(40, 40), // Square size
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4), // Square corners
          ),
        ),
        child: Text(
          text,
          style: TextStyle(color: context.colors.btnText),
        ),
      ),
    );
  }
}
