import 'package:bill_manager_jmd_task/core/constents/page_txt_contents.dart';
import 'package:bill_manager_jmd_task/core/theme/colorpalet.dart';
import 'package:bill_manager_jmd_task/core/theme/extension/app_theme_extension.dart';
import 'package:bill_manager_jmd_task/view/widgets/grey_color_titletext_style_widget.dart';
import 'package:bill_manager_jmd_task/view/widgets/invo_date_row_widget.dart';
import 'package:bill_manager_jmd_task/view/widgets/main_btn_widget.dart';
import 'package:bill_manager_jmd_task/view/widgets/my_divider_widget.dart';
import 'package:bill_manager_jmd_task/view/widgets/popup_container_widget.dart';
import 'package:bill_manager_jmd_task/view/widgets/product_card_widget.dart';
import 'package:bill_manager_jmd_task/view/widgets/productcard_Btn_widget.dart';
import 'package:bill_manager_jmd_task/view/widgets/value_style_widget.dart';
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
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.settings))],
        centerTitle: true,
        title: Text(
          constants.generateInvoicetxt,
          style: context.typography.h3,
        ),
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu_rounded)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.spaces.space_100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InvoiceDetailsWidget(
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
                backgroundColor: AppColorPalettes.green,
                constants: constants,
                mainbtnTxt: constants.addproduct,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.spaces.space_100,
                ),
                child: Container(
                  color: AppColorPalettes.white500,
                  // color: Colors.amber,
                  child: Padding(
                    padding: EdgeInsets.all(context.spaces.space_200),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            GreyColordTitleTextWidget(
                              constants: constants,
                              greycolorTitle: constants.grossamttxt,
                            ),
                            Spacer(),
                            ValuesStyleWidget(value: '200')
                          ],
                        ),
                        MyDividerWidget(),
                        Row(
                          children: [
                            GreyColordTitleTextWidget(
                                constants: constants,
                                greycolorTitle: constants.discountTxt),
                            Spacer(),
                            // Container for Discount Rate
                            Container(
                              decoration: BoxDecoration(
                                border: Border.fromBorderSide(
                                  BorderSide(color: AppColorPalettes.grey350),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: context.spaces.space_100,
                                  vertical: context.spaces.space_75,
                                ),
                                child: Row(
                                  children: [
                                    ValuesStyleWidget(value: '10'),
                                    SizedBox(width: context.spaces.space_200),
                                    ValuesStyleWidget(
                                        value: constants.percentagesybol)
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: context.spaces.space_100),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.fromBorderSide(
                                  BorderSide(color: AppColorPalettes.grey350),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: context.spaces.space_100,
                                  vertical: context.spaces.space_75,
                                ),
                                child: Row(
                                  children: [ValuesStyleWidget(value: '180')],
                                ),
                              ),
                            ),
                          ],
                        ),
                        MyDividerWidget(),
                        Row(
                          children: [
                            GreyColordTitleTextWidget(
                                constants: constants,
                                greycolorTitle: constants.gsttxt),
                            Spacer(),
                            PopupMenuContainerWidget(
                              constants: constants,
                              popupselectedValue: constants.statetxt,
                            ),
                            SizedBox(
                              width: context.spaces.space_100,
                            ),
                            PopupMenuContainerWidget(
                                constants: constants, popupselectedValue: '5%')
                          ],
                        ),
                        SizedBox(
                          height: context.spaces.space_100,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GreyColordTitleTextWidget(
                                constants: constants,
                                greycolorTitle: constants.cgsttxt),
                            ValuesStyleWidget(value: '2.5'),
                            ValuesStyleWidget(value: '2.5'),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GreyColordTitleTextWidget(
                                constants: constants,
                                greycolorTitle: constants.sgsttxt),
                            ValuesStyleWidget(value: '2.5'),
                            ValuesStyleWidget(value: '2.5'),
                          ],
                        ),
                        MyDividerWidget(),
                        ProductCardBtnWidget(
                          constants: constants,
                          text: constants.addchangetxt,
                          color: Color(AppColorPalettes.green.value),
                        ),
                        MyDividerWidget(),
                        Row(
                          children: [
                            GreyColordTitleTextWidget(
                                constants: constants,
                                greycolorTitle: constants.billamttxt),
                            Spacer(),
                            Text(
                              '189.00',
                              style: context.typography.bodyLarge,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: context.spaces.space_100,
              ),
              MainBtnWidget(
                backgroundColor: AppColorPalettes.blue,
                constants: constants,
                mainbtnTxt: constants.saveinvoicetxt,
              )
            ],
          ),
        ),
      ),
    );
  }
}
