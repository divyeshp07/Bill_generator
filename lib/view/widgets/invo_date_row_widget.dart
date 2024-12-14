import 'package:bill_manager_jmd_task/core/constents/page_txt_contents.dart';
import 'package:bill_manager_jmd_task/core/theme/colorpalet.dart';
import 'package:bill_manager_jmd_task/core/theme/extension/app_theme_extension.dart';
import 'package:bill_manager_jmd_task/view/widgets/grey_color_titletext_style_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InvoiceDetailsWidget extends ConsumerWidget {
  const InvoiceDetailsWidget({
    super.key,
    required String invoicenumber,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final constants = ref.watch(pageConstentsProvider);

    String invoicenumber = '1';
    String date = '11-11-2022';
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
                          Text(invoicenumber, style: TextStyle(fontSize: 20)),
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 4),
                      child: Row(
                        children: [
                          Icon(Icons.date_range_rounded,
                              color: Colors.grey, size: 28),
                          // SizedBox(width: 8),
                          Text(date, style: TextStyle(fontSize: 18)),
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
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(borderSide: BorderSide(width: 1)),
                hintText: constants.customernametxt,
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
