import 'package:bill_manager_jmd_task/model/bill_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productListProvider = StateProvider<List<BillModel>>((ref) => []);
