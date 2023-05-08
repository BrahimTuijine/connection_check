// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'check_connection_bloc.dart';

abstract class CheckConnectionState extends Equatable {}

class CheckConnectionInitial extends CheckConnectionState {
  @override
  List<Object?> get props => [];
}

class CheckConnectionStatus extends CheckConnectionState {
  final String message;
  CheckConnectionStatus({
    required this.message,
  });
  @override
  List<Object?> get props => [message];
}
