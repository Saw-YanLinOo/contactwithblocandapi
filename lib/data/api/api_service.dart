
import 'package:contactwithblocandapi/data/model/contact.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: 'https://625103f8977373573f43d626.mockapi.io/api/')
abstract class ApiService{
  factory ApiService(Dio dio) => _ApiService(dio);

  @GET('')
  Future<List<Contact>> getContact();

  @POST('')
  Future<Contact> addContact(@Body() Contact contact);

  @PUT('{id}')
  Future<Contact> updateContact(@Path()String id,@Body() Contact contact);

  @DELETE('{id}')
  Future<Contact> deleteContact(@Path() String id);

}