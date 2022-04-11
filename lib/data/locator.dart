
import 'package:contactwithblocandapi/bloc/get/cubit/getcontact_cubit.dart';
import 'package:contactwithblocandapi/bloc/post/cubit/addcontact_cubit.dart';
import 'package:contactwithblocandapi/data/api/api_service.dart';
import 'package:contactwithblocandapi/data/repository/contact_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

var getIt = GetIt.I;
void locator(){
  Dio dio = Dio();
  getIt.registerLazySingleton(() => dio);

  ApiService apiService = ApiService(getIt.call());
  getIt.registerLazySingleton(() => apiService);

  ContactRepository contactRepository = ContactRepository(getIt.call());
  getIt.registerLazySingleton(() => contactRepository);
  
}