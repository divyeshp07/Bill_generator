import 'package:bill_manager_jmd_task/core/constents/page_txt_contents.dart';
import 'package:bill_manager_jmd_task/core/theme/extension/app_theme_extension.dart';
import 'package:bill_manager_jmd_task/view/widgets/value_style_widget.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class Productcard_hedding_text_widget extends StatelessWidget {
  const Productcard_hedding_text_widget({
    super.key,
    required this.constants,
    required this.heddingtxt,
    required this.value,
  });

  final GenerateInvoicePage constants;
  final String heddingtxt;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          heddingtxt,
          style: context.typography.body.copyWith(
              color: context.colors.textSubtle,
              fontSize: context.spaces.space_75 * 2.5),
        ),
        ValuesStyleWidget(value: value)
      ],
    );
  }
}
