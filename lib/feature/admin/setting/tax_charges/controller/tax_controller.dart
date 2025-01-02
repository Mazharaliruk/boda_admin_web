

import 'package:admin_boda/commons/common_imports/apis_commons.dart';
import 'package:admin_boda/commons/common_imports/common_libs.dart';

import '../../../../../data/repositories/core/service_repository.dart';
import '../../../../../data/repositories/inventry/tax_repository.dart';
import '../../../../../models/core/service_model.dart';
import '../../../../../models/inventry/tax_model.dart';



final taxProvider = ChangeNotifierProvider((ref) => TaxController());

class TaxController extends ChangeNotifier {
final _taxRepo  = TaxRepository();
final _serviceRepo = ServiceRepository();
  var selectedService;




  Future<List<TaxModel>> fetchTax() async => await _taxRepo.fetchTax();

  // add tax
  Future<void> addTax(Map<String, dynamic> data) async => await _taxRepo.addTax(data);

  //fetch all services 
  Future<List<ServiceModel>> fetchService() async => await _serviceRepo.fetchService();

  // delete tax
  Future<void> deleteTax(int id) async => await _taxRepo.deleteTax(id);


// update tax
  Future<void> updateTax(TaxModel data) async => await _taxRepo.updateTax(data);

  // fetch tax by id
  Future<TaxModel?> fetchTaxById(int  id) async => await _taxRepo.fetchTaxById(id);


  // fetch service by id
  Future<ServiceModel> fetchServiceById(int  id) async => await _serviceRepo.fetchOnlyOneService(id);

}
