import 'package:contactwithblocandapi/data/api/api_service.dart';
import 'package:contactwithblocandapi/data/model/contact.dart';

class ContactRepository{
  final ApiService _apiService;

  ContactRepository(this._apiService);

  Future<List<Contact>> getContact() => _apiService.getContact();

  Future<Contact> addContact(Contact contact) => _apiService.addContact(contact);

  Future<Contact> updateContact(String id,Contact contact) => _apiService.updateContact(id, contact);

  Future<Contact> deleteContact(String id) =>_apiService.deleteContact(id);
  
}