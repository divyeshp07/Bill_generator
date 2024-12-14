import 'package:bill_manager_jmd_task/core/constents/page_txt_contents.dart';
import 'package:bill_manager_jmd_task/core/theme/extension/app_theme_extension.dart';
import 'package:flutter/material.dart';

class GreyColordTitleTextWidget extends StatelessWidget {
  const GreyColordTitleTextWidget({
    super.key,
    required this.constants,
    required this.greycolorTitle,
  });

  final GenerateInvoicePage constants;
  final String greycolorTitle;

  @override
  Widget build(BuildContext context) {
    return Text(
      // constants.grossamttxt,
      greycolorTitle,
      style: context.typography.body.copyWith(
          color: context.colors.textSubtle,
          fontSize: context.spaces.space_75 * 2.5),
    );
  }
}
