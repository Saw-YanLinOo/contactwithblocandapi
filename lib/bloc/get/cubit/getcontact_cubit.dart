import 'package:bloc/bloc.dart';
import 'package:contactwithblocandapi/data/model/contact.dart';
import 'package:contactwithblocandapi/data/repository/contact_repository.dart';
import 'package:equatable/equatable.dart';

part 'getcontact_state.dart';

class GetcontactCubit extends Cubit<GetcontactState> {
  final ContactRepository _contactRepository;

  GetcontactCubit(this._contactRepository) : super(GetcontactInitial()){
    getContact();
  }

  getContact(){
    emit(GetcontactInitial());
    _contactRepository.getContact()
    .then((value) => emit(GetcontactSuccess(value)))
    .catchError((e)=> emit(GetcontatFail(e.toString())));
  }

  void deleteContact(String id){
    emit(GetcontactInitial());
    _contactRepository.deleteContact(id)
        .then((value) => getContact())
        .catchError((e) => emit(GetcontatFail(e.toString())));
  }
}
