

import 'package:bill_manager_jmd_task/core/constents/page_txt_contents.dart';
import 'package:bill_manager_jmd_task/core/theme/extension/app_theme_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TextFieldFromToWidget extends ConsumerWidget {
   TextFieldFromToWidget({
    super.key,
    required String invoicenumber,
  });

  @override
  Widget build(BuildContext context,WidgetRef ref) {
        final constants = ref.watch(pageConstentsProvider);

    String invoicenumber = '1';
    String date = '11-11-2022';
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start, // Align content to the left
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Ensure proper spacing
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center, // Align text to the left
                children: [
                  Text(constants.invonumbertxt, style: context.typography.body.copyWith(color: context.colors.textSubtle)),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: context.spaces.space_200,vertical: context.spaces.space_25),
                    child: Row(
                      children: [
                        Text('#', style: TextStyle(fontWeight: FontWeight.bold, fontSize: context.spaces.space_100*3, color: Colors.grey)),
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
              height: context.spaces.space_200*2,
              width: context.spaces.space_25/2,
              color: Colors.grey,
            ),
            SizedBox(width: context.spaces.space_100),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(constants.invodatetxt, style:  context.typography.body.copyWith(color: context.colors.textSubtle)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 4),
                    child: Row(
                      children: [
                        Icon(Icons.date_range_rounded, color: Colors.grey, size: 28),
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
              hintText:constants.customernametxt,
            ),
          ),
        ),
      ],
    );
  }
}
