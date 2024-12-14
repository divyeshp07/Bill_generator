import 'package:bill_manager_jmd_task/core/theme/extension/app_theme_extension.dart';
import 'package:flutter/material.dart';

class ValuesStyleWidget extends StatelessWidget {
  const ValuesStyleWidget({
    super.key,
    required this.value,
  });

  final String value;

  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      style: context.typography.bodyLarge.copyWith(
          fontWeight: FontWeight.normal,
          fontSize: context.spaces.space_100 * 2),
    );
  }
}
