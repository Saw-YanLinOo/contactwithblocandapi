import 'package:bloc/bloc.dart';
import 'package:contactwithblocandapi/data/model/contact.dart';
import 'package:contactwithblocandapi/data/repository/contact_repository.dart';
import 'package:equatable/equatable.dart';

part 'updatecontact_state.dart';

class UpdatecontactCubit extends Cubit<UpdatecontactState> {
  final ContactRepository _contactRepository;
  UpdatecontactCubit(this._contactRepository) : super(UpdatecontactInitial());

  void updateContact(String id,Contact contact){
    emit(UpdatecontactLoading());
    _contactRepository.updateContact(id, contact)
    .then((value) => emit(UpdatecontactSuccess()))
    .catchError((e) => emit(UpdatecontactFail(e.toString())));
  }
}
