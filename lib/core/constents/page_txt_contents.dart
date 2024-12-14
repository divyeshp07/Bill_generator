
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'page_txt_contents.g.dart';
class GenerateInvoicePage {
  final generateInvoicetxt = "Generate Invoice";
  final invonumbertxt = "Invoice No";
  final invodatetxt = 'Invoice Date';
  final customernametxt = 'Customer Name';
  final productdetailstxt =  "Product Details";
  final producttxt =  "Product ";
  final edittxt = 'Edit';
  final deletetxt = 'Delete';
  final quantitytxt = 'Quantity';
  final ratetxt = 'Rate';
  final amounttxt = 'Amount';
  final addproduct = 'Add Product ';
  final grossamttxt = 'Gross Amount';
  final discountTxt = 'Discount';
  final gsttxt = 'GST';
  final cgsttxt = 'CGST';
  final sgsttxt = 'SGST';
  final addchangetxt = 'Add Charges';
  final billamttxt = 'Bill Amount';
  final saveinvoicetxt = 'Save Invoice';

  
}

@riverpod
GenerateInvoicePage pageConstents(Ref ref) {
  return GenerateInvoicePage();
}
