import 'dart:developer';

import 'package:bill_manager_jmd_task/controller/product_list_provider.dart';
import 'package:bill_manager_jmd_task/core/constents/page_txt_contents.dart';
import 'package:bill_manager_jmd_task/core/theme/colorpalet.dart';
import 'package:bill_manager_jmd_task/core/theme/extension/app_theme_extension.dart';
import 'package:bill_manager_jmd_task/model/bill_model.dart';
import 'package:bill_manager_jmd_task/service/db_services.dart';
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
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class CreateBillPage extends ConsumerWidget {
  const CreateBillPage({super.key});
  static const routePath = 'createbillpage';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController customernameController = TextEditingController();
    final constants = ref.watch(pageConstentsProvider);
    final products = ref.watch(productListProvider);
    log(products.length.toString());
    log(products.length.toString());

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings))
        ],
        centerTitle: true,
        title: Text(
          constants.generateInvoicetxt,
          style: context.typography.h3,
        ),
        leading:
            IconButton(onPressed: () {}, icon: const Icon(Icons.menu_rounded)),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.spaces.space_100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InvoiceDetailsWidget(
              controller: customernameController,
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
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    // ProductCard(constants: constants,);
                    log(products[index].customerName);
                    log(products[index].items[index].itemName);
                    log(products[index].id);
                    log(products[index].date);

                    return Card(
                      color: AppColorPalettes.white500,
                      child: Padding(
                        padding: EdgeInsets.all(context.spaces.space_200),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  products[index].items[index].itemName,
                                  style: context.typography.bodyLarge,
                                ),
                                const Spacer(),
                                ProductCardBtnWidget(
                                  constants: constants,
                                  text: constants.edittxt,
                                  color: AppColorPalettes.blue,
                                ),
                                SizedBox(
                                  width: context.spaces.space_100,
                                ),
                                ProductCardBtnWidget(
                                  constants: constants,
                                  text: constants.deletetxt,
                                  color: AppColorPalettes.red500,
                                ),
                              ],
                            ),
                            SizedBox(height: context.spaces.space_75 * 2),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Text('data'),
                                Productcard_hedding_text_widget(
                                  constants: constants,
                                  heddingtxt: constants.quantitytxt,
                                  value: products[index].items[index].quantity,
                                ),
                                // ),
                                Productcard_hedding_text_widget(
                                  constants: constants,
                                  heddingtxt: constants.ratetxt,
                                  value: products[index].items[index].unitPrice,
                                ),
                                Productcard_hedding_text_widget(
                                  constants: constants,
                                  heddingtxt: constants.amounttxt,
                                  value:
                                      '${products[index].items[index].unitPrice}0',
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(
                        height: context.spaces.space_100,
                      ),
                  itemCount: ref.watch(productListProvider).length),
            ),
            // ProductCard(constants: constants),

            MainBtnWidget(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    TextEditingController itemNameController =
                        TextEditingController();
                    TextEditingController quantityController =
                        TextEditingController();
                    TextEditingController priceController =
                        TextEditingController();

                    return AlertDialog(
                      title: Text(constants.addproduct),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextField(
                            controller: itemNameController,
                            decoration: const InputDecoration(
                              labelText: 'Item Name',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 16),
                          TextField(
                            controller: quantityController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: 'Quantity',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 16),
                          TextField(
                            controller: priceController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: 'Price',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            // Close the dialog
                            Navigator.of(context).pop();
                          },
                          child: const Text('Cancel'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            String itemName = itemNameController.text;
                            String quantity = quantityController.text;
                            String price = priceController.text;
                            String customername = customernameController.text;
                            final productId = const Uuid().v4();

                            final myproduct = BillModel(
                              id: productId,

                              date: DateFormat('yyyy-MM-dd')
                                  .format(DateTime.now()),
                              customerName: customernameController.text,
                              // contactNumber: '999999999',
                              items: [
                                Item(
                                    itemName: itemNameController.text,
                                    quantity: quantityController.text,
                                    unitPrice: priceController.text)
                              ],
                              totalAmount: 999,

                              isPaid: false,
                            );
                            if (itemName.isNotEmpty &&
                                quantity.isNotEmpty &&
                                price.isNotEmpty &&
                                customername.isNotEmpty) {
                              LocalStorage().createBill(myproduct);
                              ref.read(productListProvider.notifier).update(
                                    (state) => [...state, myproduct],
                                  );

                              Navigator.of(context).pop();
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Please fill in all fields')),
                              );
                            }
                          },
                          child: const Text('Add'),
                        ),
                      ],
                    );
                  },
                );
              },
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
                          const Spacer(),
                          const ValuesStyleWidget(value: '200')
                        ],
                      ),
                      const MyDividerWidget(),
                      Row(
                        children: [
                          GreyColordTitleTextWidget(
                              constants: constants,
                              greycolorTitle: constants.discountTxt),
                          const Spacer(),
                          // Container for Discount Rate
                          Container(
                            decoration: const BoxDecoration(
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
                                  const ValuesStyleWidget(value: '10'),
                                  SizedBox(width: context.spaces.space_200),
                                  ValuesStyleWidget(
                                      value: constants.percentagesybol)
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: context.spaces.space_100),
                          Container(
                            decoration: const BoxDecoration(
                              border: Border.fromBorderSide(
                                BorderSide(color: AppColorPalettes.grey350),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: context.spaces.space_100,
                                vertical: context.spaces.space_75,
                              ),
                              child: const Row(
                                children: [ValuesStyleWidget(value: '180')],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const MyDividerWidget(),
                      Row(
                        children: [
                          GreyColordTitleTextWidget(
                              constants: constants,
                              greycolorTitle: constants.gsttxt),
                          const Spacer(),
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
                          const ValuesStyleWidget(value: '2.5'),
                          const ValuesStyleWidget(value: '2.5'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GreyColordTitleTextWidget(
                              constants: constants,
                              greycolorTitle: constants.sgsttxt),
                          const ValuesStyleWidget(value: '2.5'),
                          const ValuesStyleWidget(value: '2.5'),
                        ],
                      ),
                      const MyDividerWidget(),
                      ProductCardBtnWidget(
                        constants: constants,
                        text: constants.addchangetxt,
                        color: Color(AppColorPalettes.green.value),
                      ),
                      const MyDividerWidget(),
                      Row(
                        children: [
                          GreyColordTitleTextWidget(
                              constants: constants,
                              greycolorTitle: constants.billamttxt),
                          const Spacer(),
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
              onPressed: () {
                // TODO
              },
              backgroundColor: AppColorPalettes.blue,
              constants: constants,
              mainbtnTxt: constants.saveinvoicetxt,
            )
          ],
        ),
      ),
    );
  }
}
