part of 'deletecontact_cubit.dart';

abstract class DeletecontactState extends Equatable {
  const DeletecontactState();
  @override
  List<Object> get props => [];
}

class DeletecontactInitial extends DeletecontactState {}

class DeletecontactLoading extends DeletecontactState {}

class DeletecontactSuccess extends DeletecontactState {}

class DeletecontactFail extends DeletecontactState{
  final String _error;

  DeletecontactFail(this._error);

  @override
  // TODO: implement props
  List<Object> get props => [_error];
}
