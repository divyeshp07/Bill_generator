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
import 'package:uuid/uuid.dart';

class CreateBillPage extends ConsumerWidget {
  const CreateBillPage({super.key});
  static const routePath = 'createbillpage';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController customerNameController = TextEditingController();
    final constants = ref.watch(pageConstentsProvider);
    final products = ref.watch(productListProvider);
    final TextEditingController itemNameController = TextEditingController();
    final TextEditingController quantityController = TextEditingController();
    final TextEditingController priceController = TextEditingController();

    log("Total Products: ${products.length}");
    //grosstotal
    double grossTotal = 0;
    for (var product in products) {
      for (var item in product.items) {
        grossTotal +=
            double.tryParse(item.unitPrice) ?? 0 * int.parse(item.quantity);
      }
    }

// lessdiscount 10%
    double discount = grossTotal * 0.10;
    double discountedTotal = grossTotal - discount;

    log(grossTotal.toString());
    log(discount.toString());
    log(discountedTotal.toString());
    log(grossTotal.toString());

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
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu_rounded),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.spaces.space_100),
          child: Expanded(
            child: Column(
              children: [
                Container(
                  height: context.spaces.space_200 * 23,
                  // height: 300,
                  // color: Colors.amber,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InvoiceDetailsWidget(
                        controller: customerNameController,
                        invoicenumber: '1',
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: context.spaces.space_100,
                          vertical: context.spaces.space_200,
                        ),
                        child: Text(
                          constants.productdetailstxt,
                          style: context.typography.h3,
                        ),
                      ),
                      Flexible(
                        child: ListView.separated(
                          itemBuilder: (context, index) {
                            log(products[index].customerName);
                            log(products[index].id);
                            log(products[index].date);

                            // Ensure items exist before accessing them
                            if (products[index].items.isNotEmpty) {
                              log(products[index]
                                  .items
                                  .first
                                  .itemName); // Accessing the first item as an example
                            } else {
                              log('No items available for this product.');
                            }

                            return Card(
                              color: AppColorPalettes.white500,
                              child: Padding(
                                padding:
                                    EdgeInsets.all(context.spaces.space_200),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        if (products[index].items.isNotEmpty)
                                          Text(
                                            products[index]
                                                .items
                                                .first
                                                .itemName,
                                            style: context.typography.bodyLarge,
                                          )
                                        else
                                          Text(
                                            'No items',
                                            style: context.typography.bodyLarge,
                                          ),
                                        const Spacer(),
                                        ProductCardBtnWidget(
                                          constants: constants,
                                          text: constants.edittxt,
                                          color: AppColorPalettes.blue,
                                        ),
                                        SizedBox(
                                            width: context.spaces.space_100),
                                        ProductCardBtnWidget(
                                          constants: constants,
                                          text: constants.deletetxt,
                                          color: AppColorPalettes.red500,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                        height: context.spaces.space_75 * 2),
                                    if (products[index].items.isNotEmpty)
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Productcard_hedding_text_widget(
                                            constants: constants,
                                            heddingtxt: constants.quantitytxt,
                                            value: products[index]
                                                .items
                                                .first
                                                .quantity,
                                          ),
                                          Productcard_hedding_text_widget(
                                              constants: constants,
                                              heddingtxt: constants.ratetxt,
                                              value:
                                                  '${products[index].items.first.unitPrice}.0'),
                                          Productcard_hedding_text_widget(
                                            constants: constants,
                                            heddingtxt: constants.amounttxt,
                                            value:
                                                '${products[index].items.first.unitPrice}.00',
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
                          itemCount: products.length,
                        ),
                      ),
                    ],
                  ),
                ),
                MainBtnWidget(
                  onPressed: () {
                    return showDialog(
                      context: context,
                      builder: (BuildContext context) {
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
                              onPressed: () => Navigator.of(context).pop(),
                              child: const Text('Cancel'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                final String itemName =
                                    itemNameController.text.trim();
                                final String quantity =
                                    quantityController.text.trim();
                                final String price =
                                    priceController.text.trim();
                                final String customerName =
                                    customerNameController.text.trim();

                                if (itemName.isEmpty ||
                                    quantity.isEmpty ||
                                    price.isEmpty ||
                                    customerName.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text('Please fill in all fields')),
                                  );
                                  return;
                                }

                                final productId = const Uuid().v4();
                                final myProduct = BillModel(
                                  id: productId,
                                  date: constants.currentDate,
                                  customerName: customerName,
                                  items: [
                                    Item(
                                      itemName: itemName,
                                      quantity: quantity,
                                      unitPrice: price,
                                    ),
                                  ],
                                  totalAmount: double.tryParse(price) ?? 0,
                                  isPaid: false,
                                );

                                LocalStorage().createBill(myProduct);
                                ref.read(productListProvider.notifier).update(
                                      (state) => [...state, myProduct],
                                    );

                                Navigator.of(context).pop();
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
                              ValuesStyleWidget(value: grossTotal.toString())
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
                                      ValuesStyleWidget(
                                          value: constants.discountrateTxt),
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
                                  child: Row(
                                    children: [
                                      ValuesStyleWidget(
                                          value: discount.toString())
                                    ],
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
                                  constants: constants,
                                  popupselectedValue: '5%')
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
                          MyDividerWidget(),
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
                                discountedTotal.toString(),
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
        ),
      ),
    );
  }
}
