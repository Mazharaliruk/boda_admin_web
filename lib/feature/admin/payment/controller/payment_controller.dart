


import 'package:admin_boda/data/repositories/sales/transaction_repository.dart';
import '../../../../../commons/common_imports/apis_commons.dart';
import '../../../../../commons/common_imports/common_libs.dart';
import '../../../../models/sales/transaction_model.dart';
final paymentProvider = ChangeNotifierProvider((ref) => PaymentController());
class PaymentController  extends ChangeNotifier{
  
final _transactionRepo = TransactionRepository();



  Future<List<TransactionModel>> fetchTransaction() async {
    return await _transactionRepo.fetchTransaction();
  }


}