import 'package:bloc/bloc.dart';
import 'package:contactwithblocandapi/data/repository/contact_repository.dart';
import 'package:equatable/equatable.dart';

part 'deletecontact_state.dart';

class DeletecontactCubit extends Cubit<DeletecontactState> {
  final ContactRepository _contactRepository;
  DeletecontactCubit(this._contactRepository) : super(DeletecontactInitial());

  void deleteContact(String id){
    emit(DeletecontactInitial());
    _contactRepository.deleteContact(id)
    .then((value) => emit(DeletecontactSuccess()))
    .catchError((e) => emit(DeletecontactFail(e.toString())));
  }
}
