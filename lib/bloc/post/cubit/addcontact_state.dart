part of 'addcontact_cubit.dart';

abstract class AddcontactState extends Equatable {
  const AddcontactState();

  @override
  List<Object> get props => [];
}

class AddcontactInitial extends AddcontactState {}

class AddcontactLoading extends AddcontactState{}

class AddcontactSuccess extends AddcontactState{}

class AddcontactFail extends AddcontactState{
  final String error;

  AddcontactFail(this.error);

  @override
  // TODO: implement props
  List<Object> get props => [error];
}
