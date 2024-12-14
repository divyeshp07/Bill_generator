// import 'package:bill_manager_jmd_task/core/constents/page_txt_contents.dart';
// import 'package:bill_manager_jmd_task/core/theme/colorpalet.dart';
// import 'package:bill_manager_jmd_task/core/theme/extension/app_theme_extension.dart';
// import 'package:flutter/material.dart';

// class ProductCard extends StatelessWidget {
//   const ProductCard({
//     super.key,
//     required this.constants,
//   });

//   final GenerateInvoicePage constants;

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//             color: AppColorPalettes.white500,
//             child: Padding(
//               padding:  EdgeInsets.all(context.spaces.space_200),
//               child: Column(
//     children: [
//       Row(
//         children: [
//           Text(constants.producttxt,style: context.typography.bodyLarge,),
//           Spacer(),
//           ElevatedButton(onPressed: () {
            
//           }, child: Text(constants.edittxt)),
//           SizedBox(width: context.spaces.space_100,),
//           ElevatedButton(onPressed: () {
            
//           }, child: Text(constants.deletetxt))
//         ],
//       ),
//       Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(constants.quantitytxt,style: context.typography.body.copyWith(color: context.colors.textSubtle,fontWeight: FontWeight.normal),),
//           Text(constants.ratetxt,style: context.typography.body.copyWith(color: context.colors.textSubtle,fontWeight: FontWeight.normal)),
//           Text(constants.amounttxt,style: context.typography.body.copyWith(color: context.colors.textSubtle,fontWeight: FontWeight.normal)),
//         ],
//       ),
//       Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text('datajd',style: context.typography.body.copyWith(fontWeight: FontWeight.normal),),
//           Text('datakslsl',style: context.typography.body.copyWith(fontWeight: FontWeight.normal)),
//           Text('datalms',style: context.typography.body.copyWith(fontWeight: FontWeight.normal))
    
//         ],
//       )
//     ],
//               ),
//             ),
           
//     );
//   }
// }

import 'package:bill_manager_jmd_task/core/constents/page_txt_contents.dart';
import 'package:bill_manager_jmd_task/core/theme/colorpalet.dart';
import 'package:bill_manager_jmd_task/core/theme/extension/app_theme_extension.dart';
import 'package:bill_manager_jmd_task/view/widgets/productcard_Btn_widget.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.constants,
  });

  final GenerateInvoicePage constants;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColorPalettes.white500,
      child: Padding(
        padding: EdgeInsets.all(context.spaces.space_200),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  constants.producttxt,
                  style: context.typography.bodyLarge,
                ),
                Spacer(),
             
                                ProductCardBtnWidget(constants: constants,text: constants.edittxt,),

                SizedBox(
                  width: context.spaces.space_100,
                ),
                ProductCardBtnWidget(constants: constants,text: constants.deletetxt,),
              ],
            ),
            SizedBox(    height:         context.spaces.space_75*2
),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
             
                Productcard_hedding_text_widget(constants: constants,heddingtxt:    
                   constants.quantitytxt,value:'1.0' ,
),
                // ),
                Productcard_hedding_text_widget(constants: constants,heddingtxt:    
                   constants.ratetxt,value: '100.0',
),
                Productcard_hedding_text_widget(constants: constants,heddingtxt:    
                   constants.amounttxt,value: '100.00',
),
               
              ],
            ),
           
          ],
        ),
      ),
    );
  }
}

class Productcard_hedding_text_widget extends StatelessWidget {
  const Productcard_hedding_text_widget({
    super.key,
    required this.constants,
    required this.heddingtxt,
    required this.value,
  });

  final GenerateInvoicePage constants;
  final String heddingtxt;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          heddingtxt,
          style: context.typography.body.copyWith(
            color: context.colors.textSubtle,
            fontWeight: FontWeight.normal,
          ),
        ),
        Text('\$${value}',style: context.typography.bodyLarge.copyWith(fontWeight: FontWeight.normal,fontSize: context.spaces.space_100*2),)
      ],
    );
  }
}

