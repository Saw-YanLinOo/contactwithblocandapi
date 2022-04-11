part of 'updatecontact_cubit.dart';

abstract class UpdatecontactState extends Equatable {
  const UpdatecontactState();

  @override
  List<Object> get props => [];
}

class UpdatecontactInitial extends UpdatecontactState {}

class UpdatecontactLoading extends UpdatecontactState{}

class UpdatecontactSuccess extends UpdatecontactState{}

class UpdatecontactFail extends UpdatecontactState{
  final String _error;

  UpdatecontactFail(this._error);

  @override
  // TODO: implement props
  List<Object> get props => [_error];
}
