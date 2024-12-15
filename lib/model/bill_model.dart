import 'package:freezed_annotation/freezed_annotation.dart';

part 'bill_model.g.dart';
part 'bill_model.freezed.dart';

@freezed
class BillModel with _$BillModel {
  const factory BillModel({
    required String id,
    required String customerName,
    // required String contactNumber,
    required List<Item> items,
    required double totalAmount,
    required String date,
    required bool isPaid,
  }) = _BillModel;

  factory BillModel.fromJson(Map<String, dynamic> json) =>
      _$BillModelFromJson(json);
}

@freezed
class Item with _$Item {
  const factory Item({
    required String itemName,
    required String quantity,
    required String unitPrice,
  }) = _Item;

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}
