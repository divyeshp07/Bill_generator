import 'package:bill_manager_jmd_task/core/constents/page_txt_contents.dart';
import 'package:bill_manager_jmd_task/core/theme/colorpalet.dart';
import 'package:bill_manager_jmd_task/core/theme/extension/app_theme_extension.dart';
import 'package:flutter/material.dart';

class MainBtnWidget extends StatelessWidget {
  const MainBtnWidget({
    super.key,
    required this.constants,
    required this.mainbtnTxt,
    required this.backgroundColor,
  });
  final String mainbtnTxt;

  final GenerateInvoicePage constants;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(context.spaces.space_100),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: backgroundColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4), // Square corners
                    )),
                onPressed: () {},
                child: Text(
                  mainbtnTxt,
                  style: TextStyle(
                      color: context.colors.btnText,
                      fontSize: context.spaces.space_200),
                )),
          ),
        ],
      ),
    );
  }
}
