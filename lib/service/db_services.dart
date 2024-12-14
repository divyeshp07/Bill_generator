// // import 'package:flutter_riverpod/flutter_riverpod.dart';
// // import 'package:shared_preferences/shared_preferences.dart';
// // import 'dart:convert';

// // // BillService to handle shared preferences interactions
// // class BillService {
// //   static const String _billsKey = 'bills';

// //   Future<List<Bill>> getBills() async {
// //     final prefs = await SharedPreferences.getInstance();
// //     final billsString = prefs.getString(_billsKey);
// //     if (billsString == null) return [];
// //     final List<dynamic> billsJson = jsonDecode(billsString);
// //     return billsJson.map((json) => Bill.fromJson(json)).toList();
// //   }

// //   Future<void> saveBill(Bill bill) async {
// //     final prefs = await SharedPreferences.getInstance();
// //     final bills = await getBills();
// //     bills.add(bill);
// //     final billsJson = bills.map((bill) => bill.toJson()).toList();
// //     await prefs.setString(_billsKey, jsonEncode(billsJson));
// //   }

// //   Future<void> updateBill(String billId, bool isPaid) async {
// //     final prefs = await SharedPreferences.getInstance();
// //     final bills = await getBills();
// //     final index = bills.indexWhere((bill) => bill.id == billId);
// //     if (index != -1) {
// //       bills[index] = Bill(
// //         id: bills[index].id,
// //         customerName: bills[index].customerName,
// //         contactNumber: bills[index].contactNumber,
// //         items: bills[index].items,
// //         totalAmount: bills[index].totalAmount,
// //         date: bills[index].date,
// //         isPaid: isPaid,
// //       );
// //     }
// //     final billsJson = bills.map((bill) => bill.toJson()).toList();
// //     await prefs.setString(_billsKey, jsonEncode(billsJson));
// //   }
// // }

// // // Riverpod Provider
// // final billServiceProvider = Provider((ref) => BillService());

// // // Bill List Notifier
// // class BillNotifier extends StateNotifier<List<Bill>> {
// //   final BillService billService;

// //   BillNotifier(this.billService) : super([]);

// //   Future<void> loadBills() async {
// //     final bills = await billService.getBills();
// //     state = bills;
// //   }

// //   Future<void> addBill(Bill bill) async {
// //     await billService.saveBill(bill);
// //     await loadBills();
// //   }

// //   Future<void> toggleBillStatus(String billId, bool isPaid) async {
// //     await billService.updateBill(billId, isPaid);
// //     await loadBills();
// //   }
// // }

// // final billNotifierProvider =
// //     StateNotifierProvider<BillNotifier, List<Bill>>((ref) {
// //   return BillNotifier(ref.watch(billServiceProvider));
// // });


// import 'package:bill_manager_jmd_task/model/bill_model.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:using_sharedpreferences/model/usercrediential_model.dart';

// class LocalStorage {
//   final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

//   Future<void> createBill(BillModel bill) async {
//     final prefs = await _prefs;
//     await prefs.setString('Id', bill.id);
//     await prefs.setString('CustomerName', bill.customerName);
//     await prefs.setString('ContactNumber', bill.contactNumber);
//     await prefs.setString('Items', bill.toJson().entries.);
//     await prefs.setString('TotalAmount', bill.totalAmount);
//     await prefs.setString('Date', bill.date);
//     await prefs.setString('IsPaid', bill.is);
//   }

//   Future<void> clearFunction() async {
//     final prefs = await _prefs;
//     prefs.clear();
//   }

//   Future<Bill?> getBill() async {
//     final prefs = await _prefs;
//     final storedUsername = prefs.getString('Username');
//     final storedPassword = prefs.getString('Password');
//     if (storedUsername != null && storedPassword != null) {
//       return Bill(
//         username: storedUsername,
//         password: storedPassword,
//       );
//     }
//     return null;
//   }

  
// }

// TODO

import 'dart:convert'; // For JSON encoding/decoding
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bill_manager_jmd_task/model/bill_model.dart';

class LocalStorage {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  /// Save a single bill
  Future<void> saveBill(BillModel bill) async {
    final prefs = await _prefs;

    // Convert BillModel to JSON string
    final billJson = jsonEncode(bill.toJson());
    await prefs.setString('bill_${bill.id}', billJson);

    print("Bill saved: $billJson");
  }

  /// Retrieve a single bill by ID
  Future<BillModel?> getBillById(String id) async {
    final prefs = await _prefs;

    // Get the JSON string for the bill
    final billJsonString = prefs.getString('bill_$id');
    if (billJsonString == null) {
      print("No bill found with ID: $id");
      return null;
    }

    // Decode JSON string back into BillModel
    final billJson = jsonDecode(billJsonString);
    return BillModel.fromJson(billJson);
  }

  /// Save a list of bills
  Future<void> saveBills(List<BillModel> bills) async {
    final prefs = await _prefs;

    // Save each bill as a JSON string
    for (var bill in bills) {
      await saveBill(bill);
    }

    // Save the list of bill IDs for easy retrieval
    final billIds = bills.map((bill) => bill.id).toList();
    await prefs.setStringList('bill_ids', billIds);

    print("All bills saved.");
  }

  /// Retrieve all bills
  Future<List<BillModel>> getAllBills() async {
    final prefs = await _prefs;

    // Retrieve the list of saved bill IDs
    final billIds = prefs.getStringList('bill_ids') ?? [];
    final List<BillModel> bills = [];

    // Retrieve each bill by its ID
    for (var id in billIds) {
      final bill = await getBillById(id);
      if (bill != null) {
        bills.add(bill);
      }
    }

    return bills;
  }

  /// Clear all stored data
  Future<void> clearAllData() async {
    final prefs = await _prefs;
    await prefs.clear();
    print("All data cleared.");
  }
}
