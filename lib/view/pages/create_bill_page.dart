import 'package:bill_manager_jmd_task/core/constents/page_txt_contents.dart';
import 'package:bill_manager_jmd_task/core/theme/colorpalet.dart';
import 'package:bill_manager_jmd_task/core/theme/extension/app_theme_extension.dart';
import 'package:bill_manager_jmd_task/view/widgets/invo_date_row_widget.dart';
import 'package:bill_manager_jmd_task/view/widgets/main_btn_widget.dart';
import 'package:bill_manager_jmd_task/view/widgets/product_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateBillPage extends ConsumerWidget {
  const CreateBillPage({super.key});
  static const routePath = 'createbillpage';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final constants = ref.watch(pageConstentsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('data'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.spaces.space_100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFieldFromToWidget(
              invoicenumber: '1',
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: context.spaces.space_100,
                  vertical: context.spaces.space_200),
              child: Text(
                constants.productdetailstxt,
                style: context.typography.h3,
              ),
            ),
            ProductCard(constants: constants),
            MainBtnWidget(
              constants: constants,
              mainbtnTxt: constants.addproduct,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.spaces.space_100,
              ),
              child: Container(
                color: AppColorPalettes.white500,
                child: Padding(
                  padding: EdgeInsets.all(context.spaces.space_200),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            constants.grossamttxt,
                            style: context.typography.body.copyWith(
                                color: context.colors.textSubtle,
                                fontSize: context.spaces.space_75 * 2.5),
                          ),
                          Spacer(),
                          Text('200')
                        ],
                      ),
                      Divider(),
                      Row(
                        children: [
                          Text(
                            constants.discountTxt,
                            style: context.typography.body.copyWith(
                                color: context.colors.textSubtle,
                                fontSize: context.spaces.space_75 * 2.5),
                          ),
                          Spacer(),
                          Container(
                            width: context.spaces.space_200 * 4,
                            height: context.spaces.space_200 * 2,
                            decoration: BoxDecoration(
                                // color: Colors.amber,
                                border: Border.fromBorderSide(BorderSide(
                                    color: AppColorPalettes.grey350))),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
