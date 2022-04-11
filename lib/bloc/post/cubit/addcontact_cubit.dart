import 'package:bloc/bloc.dart';
import 'package:contactwithblocandapi/data/model/contact.dart';
import 'package:contactwithblocandapi/data/repository/contact_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'addcontact_state.dart';

class AddcontactCubit extends Cubit<AddcontactState> {
  final ContactRepository _contactRepository;

  AddcontactCubit(this._contactRepository) : super(AddcontactInitial());

  void addContact(Contact contact){
    emit(AddcontactLoading());
    _contactRepository.addContact(contact)
    .then((value) => emit(AddcontactSuccess()))
    .catchError((e)=> emit(AddcontactFail(e.toString())));

  }
}
