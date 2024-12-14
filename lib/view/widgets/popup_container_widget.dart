import 'package:bill_manager_jmd_task/core/constents/page_txt_contents.dart';
import 'package:bill_manager_jmd_task/core/theme/colorpalet.dart';
import 'package:bill_manager_jmd_task/core/theme/extension/app_theme_extension.dart';
import 'package:bill_manager_jmd_task/view/widgets/value_style_widget.dart';
import 'package:flutter/material.dart';

class PopupMenuContainerWidget extends StatelessWidget {
  const PopupMenuContainerWidget({
    super.key,
    required this.constants,
    required this.popupselectedValue,
  });

  final GenerateInvoicePage constants;
  final dynamic popupselectedValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.spaces.space_200 * 2.5,
      decoration: BoxDecoration(
        border: Border.fromBorderSide(
          BorderSide(color: AppColorPalettes.grey350),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.spaces.space_100,
        ),
        child: Row(
          children: [
            // Text(
            //   popupselectedValue,
            //   style: context.typography.body.copyWith(
            //     fontWeight: FontWeight.normal,
            //   ),
            // ),
            ValuesStyleWidget(value: popupselectedValue),
            // SizedBox(width: context.spaces.space_200),

            SizedBox(width: context.spaces.space_75),
            PopupMenuButton<String>(
              icon: Icon(
                Icons.arrow_drop_down,
                color: context.colors.textSubtle, // Optional: Style the icon
              ),
              onSelected: (value) {
                // Handle the selected value
                print('Selected: $value');
              },
              itemBuilder: (BuildContext context) {
                return <PopupMenuEntry<String>>[
                  PopupMenuItem<String>(
                    value: '5%',
                    child: Text('5%'),
                  ),
                  PopupMenuItem<String>(
                    value: '10%',
                    child: Text('10%'),
                  ),
                  PopupMenuItem<String>(
                    value: '15%',
                    child: Text('15%'),
                  ),
                  PopupMenuItem<String>(
                    value: '20%',
                    child: Text('20%'),
                  ),
                ];
              },
            ),
          ],
        ),
      ),
    );
  }
}
