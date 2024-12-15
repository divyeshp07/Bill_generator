// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'dart:convert';

// // BillService to handle shared preferences interactions
// class BillService {
//   static const String _billsKey = 'bills';

//   Future<List<Bill>> getBills() async {
//     final prefs = await SharedPreferences.getInstance();
//     final billsString = prefs.getString(_billsKey);
//     if (billsString == null) return [];
//     final List<dynamic> billsJson = jsonDecode(billsString);
//     return billsJson.map((json) => Bill.fromJson(json)).toList();
//   }

//   Future<void> saveBill(Bill bill) async {
//     final prefs = await SharedPreferences.getInstance();
//     final bills = await getBills();
//     bills.add(bill);
//     final billsJson = bills.map((bill) => bill.toJson()).toList();
//     await prefs.setString(_billsKey, jsonEncode(billsJson));
//   }

//   Future<void> updateBill(String billId, bool isPaid) async {
//     final prefs = await SharedPreferences.getInstance();
//     final bills = await getBills();
//     final index = bills.indexWhere((bill) => bill.id == billId);
//     if (index != -1) {
//       bills[index] = Bill(
//         id: bills[index].id,
//         customerName: bills[index].customerName,
//         contactNumber: bills[index].contactNumber,
//         items: bills[index].items,
//         totalAmount: bills[index].totalAmount,
//         date: bills[index].date,
//         isPaid: isPaid,
//       );
//     }
//     final billsJson = bills.map((bill) => bill.toJson()).toList();
//     await prefs.setString(_billsKey, jsonEncode(billsJson));
//   }
// }

// // Riverpod Provider
// final billServiceProvider = Provider((ref) => BillService());

// // Bill List Notifier
// class BillNotifier extends StateNotifier<List<Bill>> {
//   final BillService billService;

//   BillNotifier(this.billService) : super([]);

//   Future<void> loadBills() async {
//     final bills = await billService.getBills();
//     state = bills;
//   }

//   Future<void> addBill(Bill bill) async {
//     await billService.saveBill(bill);
//     await loadBills();
//   }

//   Future<void> toggleBillStatus(String billId, bool isPaid) async {
//     await billService.updateBill(billId, isPaid);
//     await loadBills();
//   }
// }

// final billNotifierProvider =
//     StateNotifierProvider<BillNotifier, List<Bill>>((ref) {
//   return BillNotifier(ref.watch(billServiceProvider));
// });

import 'dart:convert';

import 'package:bill_manager_jmd_task/model/bill_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> createBill(BillModel bill) async {
    final prefs = await _prefs;
    await prefs.setString('Id', bill.id);
    await prefs.setString('CustomerName', bill.customerName);
    await prefs.setStringList(
        'items', bill.items.map((item) => item.toJson().toString()).toList());

    await prefs.setDouble('TotalAmount', bill.totalAmount);

    await prefs.setString('Date', bill.date);
    await prefs.setBool('IsPaid', bill.isPaid);
  }

  Future<void> clearFunction() async {
    final prefs = await _prefs;
    prefs.clear();
  }

  // Future<BillModel?> getBill() async {
  //   final prefs = await _prefs;
  //   final storedUsername = prefs.getString('Username');
  //   final storedPassword = prefs.getString('Password');
  //   if (storedUsername != null && storedPassword != null) {
  //     return BillModel(
  //       username: storedUsername,
  //       password: storedPassword,
  //     );
  //   }
  //   return null;
  // }

  Future<BillModel?> getBill() async {
    final prefs = await _prefs;

    final id = prefs.getString('Id');
    final customerName = prefs.getString('CustomerName');
    final totalAmount = prefs.getDouble('TotalAmount');
    final date = prefs.getString('Date');
    final isPaid = prefs.getBool('IsPaid');
    final items = prefs.getStringList('items');

    if (id != null &&
        customerName != null &&
        totalAmount != null &&
        date != null &&
        isPaid != null &&
        items != null) {
      List<Item> deserializedItems = items.map((item) {
        final Map<String, dynamic> json = jsonDecode(item);
        return Item.fromJson(json);
      }).toList();

      return BillModel(
        id: id,
        customerName: customerName,
        items: deserializedItems,
        totalAmount: totalAmount,
        date: date,
        isPaid: isPaid,
      );
    }
    return null;
  }
}
