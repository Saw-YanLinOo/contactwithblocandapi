part of 'getcontact_cubit.dart';

abstract class GetcontactState extends Equatable {
  const GetcontactState();

  @override
  List<Object> get props => [];
}

class GetcontactInitial extends GetcontactState {}

class GetcontactSuccess extends GetcontactState{
  final List<Contact> contactList;

  GetcontactSuccess(this.contactList);

  @override
  // TODO: implement props
  List<Object> get props => [contactList];
}

class GetcontatFail extends GetcontactState{
  final String error;

  GetcontatFail(this.error);

  @override
  // TODO: implement props
  List<Object> get props => [error];
}
