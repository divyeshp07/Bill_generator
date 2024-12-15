import 'package:bill_manager_jmd_task/core/constents/page_txt_contents.dart';
import 'package:bill_manager_jmd_task/core/theme/colorpalet.dart';
import 'package:bill_manager_jmd_task/core/theme/extension/app_theme_extension.dart';
import 'package:bill_manager_jmd_task/view/widgets/grey_color_titletext_style_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ignore: must_be_immutable
class InvoiceDetailsWidget extends ConsumerWidget {
  InvoiceDetailsWidget({
    super.key,
    required String invoicenumber,
    required this.controller,
  });
  TextEditingController controller;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final constants = ref.watch(pageConstentsProvider);

    // String invoicenumber = '1';
    // String date = '11-11-2022';
    return Container(
      color: AppColorPalettes.white500,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GreyColordTitleTextWidget(
                        constants: constants,
                        greycolorTitle: constants.invonumbertxt),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: context.spaces.space_200,
                          vertical: context.spaces.space_25),
                      child: Row(
                        children: [
                          Text('#',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: context.spaces.space_100 * 3,
                                  color: Colors.grey)),
                          SizedBox(width: context.spaces.space_100),
                          Flexible(
                            child: Text(constants.invoiceUuid,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 20)),
                          ),
                          Spacer(),
                          Icon(Icons.arrow_drop_down)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: context.spaces.space_200 * 2,
                width: context.spaces.space_25 / 2,
                color: Colors.grey,
              ),
              SizedBox(width: context.spaces.space_100),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GreyColordTitleTextWidget(
                        constants: constants,
                        greycolorTitle: constants.invodatetxt),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: context.spaces.space_200, vertical: 4),
                      child: Row(
                        children: [
                          Icon(Icons.date_range_rounded,
                              color: Colors.grey,
                              size: context.spaces.space_200),
                          // SizedBox(width: 8),
                          Text(constants.currentDate.toString(),
                              style: TextStyle(fontSize: 18)),
                          Spacer(),
                          Icon(Icons.arrow_drop_down)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: context.spaces.space_100),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.spaces.space_100),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderSide: BorderSide(width: 0.11)),
                // border: OutlineInputBorder(borderSide: BorderSide(width: 1)),
                labelText: constants.customernametxt,
              ),
            ),
          ),
          SizedBox(
            height: context.spaces.space_150,
          )
        ],
      ),
    );
  }
}
